import 'package:flutter/material.dart';

import '../../../core/constants/imageassets.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImageAssets.logoauth,
      height: 200,
    );
  }
}
