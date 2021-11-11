import 'dart:developer';

import 'package:desk/common/base/base_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

import 'comm_web_logic.dart';
import 'comm_web_state.dart';

class CommWebPage extends GetView<CommWebLogic> {
  final CommWebState state = Get.find<CommWebLogic>().state;
  final params = Get.arguments;
  final GlobalKey webViewKey = GlobalKey();

  CommWebPage({Key? key, String? url, String? title}) : super(key: key) {
    if (url != null) {
      state.url.value = url;
    }
    if (title != null) {
      state.title.value = title;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: Get.theme.iconTheme,
          automaticallyImplyLeading: true,
          centerTitle: true,
          elevation: 2,
          title: Obx(
            () => Text(
              state.title.value,
              style: Get.textTheme.headline5,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.close,
                  color: Get.iconColor,
                )),
            IconButton(
                onPressed: () => controller.showBottomModal(),
                icon: Icon(
                  Icons.more_horiz,
                  color: Get.iconColor,
                ))
          ],
        ),
        onBack: () => controller.back(),
        body: _buildWebView());
  }

  Widget _buildWebView() => Obx(() => controller.state.inited.value
      ? Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  InAppWebView(
                    key: webViewKey,
                    initialData: controller.initData,
                    initialUrlRequest: URLRequest(url: controller.getUri()),
                    initialOptions: controller.options,
                    onWebViewCreated: (c) {
                      controller.webViewController = c;
                    },
                    onLoadStart: (c, url) {
                      controller.url = url.toString();
                      controller.urlController.text = controller.url;
                    },
                    androidOnPermissionRequest:
                        (controller, origin, resources) async {
                      return PermissionRequestResponse(
                          resources: resources,
                          action: PermissionRequestResponseAction.GRANT);
                    },
                    onLoadStop: (c, url) async {
                      // controller.refreshController.endRefreshing();
                      controller.url = url.toString();
                      controller.urlController.text = controller.url;
                    },
                    onLoadError: (c, url, code, message) {
                      // controller.refreshController.endRefreshing();
                    },
                    onProgressChanged: (c, progress) {
                      if (progress == 100) {
                        // controller.refreshController.endRefreshing();
                      }
                      controller.progress = progress / 100;
                      controller.urlController.text = controller.url;
                    },
                    onUpdateVisitedHistory: (c, url, androidIsReload) {
                      controller.url = url.toString();
                      controller.urlController.text = controller.url;
                    },
                    onConsoleMessage: (controller, consoleMessage) {
                      log(consoleMessage.toString());
                    },
                    onTitleChanged: (c, title) {
                      state.title.value = title ?? '';
                    },
                  ),
                  Obx(() => controller.progress < 1.0
                      ? LinearProgressIndicator(value: controller.progress)
                      : Container()),
                ],
              ),
            ),
          ],
        )
      : const Center(
          child: CircularProgressIndicator(),
        ));
}
