import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';

import 'package:adminapp/core/class/statusrequest.dart';
import 'package:dartz/dartz.dart';

import 'package:http/http.dart' as http;

import '../functions/checkinternetconnection.dart';

class Crud {
  Future<Either<Statusrequest, Map>> postdata(String url, Map data) async {
    try {
      if (await checkinternetstatus()) {
        print("good internet connection the passed data is ");
        print(data);
        // internet connection
        var response = await http.post(Uri.parse(url), body: data);

        if (response.statusCode == 200 || response.statusCode == 201) {
          //get response from server

          print(
              '-------response code 200 or 201---------success-----crud--- data passed to api-------');
          print(response.body);
          print(data);
          Map responsebody = jsonDecode(response.body);

          return Right(responsebody);
        } else {
          //no response from server
          return const Left(Statusrequest.serverfailure);
        }
      } else {
        //no internet connection
        return const Left(Statusrequest.offlinefailure);
      }
    } catch (e) {
      print(e);
      return const Left(Statusrequest.serverexception);
    }
  }

  Future<Either<Statusrequest, Map>> addRequestWithImageOne(
      url, data, File? image,
      [String? namerequest]) async {
    if (namerequest == null) {
      namerequest = "file";
    }

    var uri = Uri.parse(url);
    // print(uri);
    var request = http.MultipartRequest("POST", uri);
    request.headers.addAll({'Authorization': ""});

    if (image != null) {
      print("image != null");
      var length = await image.length();
      var stream = http.ByteStream(image.openRead());
      stream.cast();
      // print(basename(image.path));
      var multipartFile = http.MultipartFile(namerequest, stream, length,
          filename: basename(image.path));
      request.files.add(multipartFile);
    }

    // add Data to request
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    // add Data to request
    // Send Request
    var myrequest = await request.send();
    // For get Response Body
    var response = await http.Response.fromStream(myrequest);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      Map responsebody = jsonDecode(response.body);
      return Right(responsebody);
    } else {
      return const Left(Statusrequest.serverfailure);
    }
  }
}
