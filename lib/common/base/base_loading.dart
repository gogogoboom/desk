import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:desk/common/global/i_style.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget loading() =>
    const SpinKitChasingDots(
      color: IColors.accentColor,
    );