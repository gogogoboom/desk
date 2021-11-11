import 'package:animate_do/animate_do.dart';
import 'package:desk/common/global/i_style.dart';
import 'package:desk/common/utils/asset_file.dart';
import 'package:desk/views/web/comm_web_logic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ModalCallModal extends GetView<CommWebLogic> {
  const ModalCallModal(
    this.phoneNumber, {
    Key? key,
  }) : super(key: key);

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: Container(),
          middle: Text('联系我们', style: Get.textTheme.headline4),
          backgroundColor: Get.theme.backgroundColor,
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '拨打电话：$phoneNumber',
                style: Get.textTheme.headline4,
              ),
              const SizedBox(
                width: 12,
              ),
              ElasticInRight(
                child: IconButton(
                  onPressed: () {
                    Get.back();
                    _call();
                  },
                  icon: SvgPicture.asset(
                    Utils.getSvgPath('icon_call'),
                    color: IColors.primarySwatch,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _call() async => await canLaunch('tel:$phoneNumber')
      ? await launch('tel:$phoneNumber')
      : throw 'Could not launch ${'tel:$phoneNumber'}';
}
