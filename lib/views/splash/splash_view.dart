import 'package:cached_network_image/cached_network_image.dart';
import 'package:desk/common/base/base_scaffold.dart';
import 'package:desk/common/global/i_style.dart';
import 'package:desk/common/mock/mock_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import 'splash_logic.dart';

class SplashPage extends StatelessWidget {
  final SplashLogic logic = Get.put(SplashLogic());

  SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Stack(
        children: [
          CachedNetworkImage(
            width: ScreenUtil().screenWidth,
            height: ScreenUtil().screenHeight,
            imageUrl: MockData.imgUrl6,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 32,
            right: 32,
            child: SafeArea(
              child: GFAvatar(
                backgroundColor: Colors.black45,
                size: 32,
                child: GFProgressBar(
                  percentage: 1,
                  radius: 48,
                  circleWidth: 3,
                  animation: true,
                  animationDuration: logic.second * 1000,
                  padding: EdgeInsets.zero,
                  type: GFProgressType.circular,
                  backgroundColor: Colors.black26,
                  progressBarColor: IColors.primarySwatch,
                  child: GestureDetector(
                    onTap: () => logic.jumpToIndex(),
                    child: Text(
                      '跳过',
                      style: Get.textTheme.bodyText2
                          ?.copyWith(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
