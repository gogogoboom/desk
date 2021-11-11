import 'dart:typed_data';

import 'package:desk/common/utils/toast.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class GalleryPhotoViewWrapper extends StatefulWidget {
  GalleryPhotoViewWrapper({
    Key? key,
    this.loadingBuilder,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
    this.initialIndex = 0,
    required this.galleryItems,
    this.scrollDirection = Axis.horizontal,
  })  : pageController = PageController(initialPage: initialIndex),
        super(key: key);

  final LoadingBuilder? loadingBuilder;
  final BoxDecoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final int initialIndex;
  final PageController pageController;
  final List<String> galleryItems;
  final Axis scrollDirection;

  @override
  State<StatefulWidget> createState() {
    return _GalleryPhotoViewWrapperState();
  }
}

class _GalleryPhotoViewWrapperState extends State<GalleryPhotoViewWrapper> {
  late int currentIndex = widget.initialIndex;

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: <Widget>[
          PhotoViewGallery.builder(
            scrollPhysics: const BouncingScrollPhysics(),
            builder: _buildItem,
            itemCount: widget.galleryItems.length,
            loadingBuilder: widget.loadingBuilder,
            backgroundDecoration: widget.backgroundDecoration,
            pageController: widget.pageController,
            onPageChanged: onPageChanged,
            scrollDirection: widget.scrollDirection,
          ),
          SafeArea(
            child: Row(
              children: <Widget>[
                const SizedBox(
                  width: 16,
                ),
                SizedBox(
                  height: 28,
                  child: GFButton(
                    color: Colors.transparent,
                    highlightColor: Colors.black87,
                    focusColor: Colors.black87,
                    hoverColor: Colors.black87,
                    splashColor: Colors.black87,
                    // borderSide: BorderSide(width: 0.5, color: Colors.white),
                    onPressed: () => _save(widget.galleryItems[currentIndex]),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.download,
                          color: Colors.white,
                          size: 12,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          '保存相册',
                          style: Get.textTheme.bodyText2
                              ?.copyWith(color: Colors.white, fontSize: 12),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                  height: 0,
                )),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    '${currentIndex + 1}/${widget.galleryItems.length}',
                    style:
                        Get.textTheme.headline4?.copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 16,
            top: 16,
            child: SafeArea(
              child: IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                onPressed: () => Get.back(),
              ),
            ),
          )
        ],
      ),
    );
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    final String item = widget.galleryItems[index];
    return PhotoViewGalleryPageOptions(
      imageProvider: NetworkImage(item),
      onTapUp: (
        BuildContext context,
        TapUpDetails details,
        PhotoViewControllerValue controllerValue,
      ) =>
          Get.back(),
      tightMode: true,
      initialScale: PhotoViewComputedScale.contained,
      minScale: PhotoViewComputedScale.contained * (0.5 + index / 10),
      maxScale: PhotoViewComputedScale.covered * 4.1,
      heroAttributes: PhotoViewHeroAttributes(tag: item),
    );
  }

  _save(String url) async {
    final dio.Response<List<int>> response = await dio.Dio()
        .get(url, options: dio.Options(responseType: dio.ResponseType.bytes));
    await ImageGallerySaver.saveImage(
      Uint8List.fromList(response.data!),
      quality: 100,
      name: url,
    );
    ToastUtil.show('图片已保存到相册！');
  }
}
