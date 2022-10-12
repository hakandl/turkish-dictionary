import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../constants/enums/size_enum.dart';

class SignLanguageCard extends StatelessWidget {
  const SignLanguageCard({super.key, required this.word});
  final String word;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(SizeEnum.zTen.value),
      child: Card(
        shape: UnderlineInputBorder(borderSide: BorderSide(color: context.colorScheme.onSecondary)),
        child: Padding(
          padding: context.paddingNormal,
          child: Image.network(word),
        ),
      ),
    );
  }
}
