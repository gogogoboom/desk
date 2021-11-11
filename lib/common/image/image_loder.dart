import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:desk/common/global/i_style.dart';
import 'package:desk/common/utils/asset_file.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget fetchImage(String url,
    {double width = 48,
    double height = 48,
    Color? color,
    String defaultImagePath = 'bg_img_placeholder'}) {
  return url.isNotEmpty
      ? CachedNetworkImage(
          height: height,
          width: width,
          imageUrl: url,
          color: color,
          fit: BoxFit.cover,
          placeholder: (BuildContext context, String url) => SvgPicture.asset(
            Utils.getSvgPath(defaultImagePath),
            width: width,
            height: height,
          ),
          errorWidget: (BuildContext context, String url, dynamic error) =>
              SvgPicture.asset(Utils.getSvgPath(defaultImagePath),
                  width: width, height: height),
        )
      : SvgPicture.asset(
          Utils.getSvgPath(defaultImagePath),
          width: width,
          height: height,
        );
}

Widget fetchAvatar(String? url,
    {double size = 60, String defaultImagePath = 'ic_default_avatar'}) {
  return url == null
      ? Image.asset(Utils.getImgPath(defaultImagePath))
      : CachedNetworkImage(
          height: size,
          width: size,
          imageUrl: url,
          fit: BoxFit.cover,
          placeholder: (BuildContext context, String url) => Image.asset(
            Utils.getImgPath(defaultImagePath),
            color: IColors.lineColor,
          ),
          errorWidget: (BuildContext context, String url, dynamic error) =>
              Image.asset(Utils.getImgPath(defaultImagePath)),
        );
}

Widget fetchLocalImage(File file, {double width = 48, double height = 48}) {
  return Image.file(file, fit: BoxFit.cover, width: width, height: height);
}

Widget fetchAssetsImage(String path, {double width = 48, double height = 48}) {
  return Image.asset(path, fit: BoxFit.cover, width: width, height: height);
}
