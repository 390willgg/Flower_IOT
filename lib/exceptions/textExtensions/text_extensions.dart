import 'package:flutter/material.dart';

extension TextExtensions on String {
  Widget styledText(BuildContext context,
      {TextStyle? style, TextAlign? align}) {
    return Text(
      this,
      style: style ?? Theme.of(context).textTheme.bodySmall,
      textAlign: align ?? TextAlign.start,
    );
  }
}
