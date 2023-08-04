import 'package:get/get.dart';

import '../../../core/constants/imageassets.dart';
import '../../model/onboardingmodel.dart';

List<OnboardingModel> onboardinglist = [
  OnboardingModel(
      title: '1'.tr, body: '3'.tr, images: ImageAssets.onboardingone),
  OnboardingModel(
      title: '4'.tr, body: '5'.tr, images: ImageAssets.onboardingtwo),
  OnboardingModel(
      title: '6'.tr, body: '7'.tr, images: ImageAssets.onboardingthree),
  OnboardingModel(
      title: 'Fast delivery ',
      body:
          'In this example you will learn the basics of GetX. You will see how much easier it is to code with this framework, and you will know what problems GetX proposes to solve.',
      images: ImageAssets.onboardingfour)
];
