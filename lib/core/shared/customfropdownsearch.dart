import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:drop_down_list/drop_down_list.dart';

class CustomDropDownSearch extends StatefulWidget {
  final String title;
  final List<SelectedListItem> data;
  final TextEditingController dropdownselectedid;
  final TextEditingController dropdownselectedname;

  CustomDropDownSearch(
      {super.key,
      required this.title,
      required this.data,
      required this.dropdownselectedid,
      required this.dropdownselectedname});

  @override
  State<CustomDropDownSearch> createState() => _CustomDropDownSearchState();
}

class _CustomDropDownSearchState extends State<CustomDropDownSearch> {
  @override
  showdropdownsearch() {
    return DropDownState(DropDown(
        bottomSheetTitle: Text(
          "choose Categorie",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: widget.data ?? [],
        selectedItems: (List<dynamic> selectedList) {
          SelectedListItem selected = selectedList[0];
          setState(() {
            print(selected.name);
            widget.dropdownselectedname.text = selected.name;
            widget.dropdownselectedid.text = selected.value!;
          });
        })).showModal(context);
  }

  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      // controller: widget.dropdownselectedname,

      onTap: () {
        showdropdownsearch();
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        suffixIcon: Icon(
          Icons.arrow_drop_down,
          size: 30,
        ),
        label: Text("   select categorie"),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
        hintText: widget.dropdownselectedname.text == ""
            ? widget.title
            : widget.dropdownselectedname.text,
      ),
    );
  }
}
