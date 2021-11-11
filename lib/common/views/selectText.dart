// ignore_for_file: file_names

import 'package:desk/common/style/style.dart';
import 'package:flutter/material.dart';

class SelectText extends StatelessWidget {
  const SelectText({
    Key? key,
    this.isSelect: true,
    this.title,
  }) : super(key: key);

  final bool isSelect;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      color: Colors.black.withOpacity(0),
      child: Text(
        title ?? '??',
        textAlign: TextAlign.center,
        style:
            isSelect ? StandardTextStyle.big : StandardTextStyle.bigWithOpacity,
      ),
    );
  }
}
