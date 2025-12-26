import 'package:flutter/material.dart';

import '../theme/app_text_style.dart';

class SignUpTitleSmall extends StatelessWidget {
  const SignUpTitleSmall({super.key,required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text,style: AppTextStyle.interSmallTitle,);
  }
}
