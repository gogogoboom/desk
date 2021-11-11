import 'package:desk/common/alert/dialog_common_bottom_sheet.dart';
import 'package:desk/common/alert/modal/modal_web_more_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../export.dart';
import 'comm_web_state.dart';

class CommWebLogic extends GetxController {
  final CommWebState state = CommWebState();
  late HeadlessInAppWebView headlessWebView;

  // PullToRefreshController _refreshController = PullToRefreshController();
  late InAppWebViewController webViewController;
  final TextEditingController urlController = TextEditingController();

  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  String get url => state.url.value;

  Uri? getUri() {
    Uri? uri;
    try {
      if (url.startsWith('http')) {
        uri = Uri.parse(url);
      } else if (url.startsWith('www')) {
        uri = Uri.parse('https://$url');
      }
    } catch (e) {
      logger.d(e);
    }
    return uri;
  }

  bool get isNoTitle => state.noTitle.value;

  InAppWebViewInitialData? get initData =>
      (url.startsWith('http') || url.startsWith('www'))
          ? null
          : InAppWebViewInitialData(data: url);

  set url(String url) => state.url.value = url;

  double get progress => state.progress.value;

  set progress(double p) => state.progress.value = p;

  @override
  Future<void> onInit() async {
    super.onInit();
    final params = Get.arguments;
    state.url.value = (params['url'] as String?) ?? '';
    state.title.value = (params['title'] as String?) ?? '';
    initWeb();
  }

  Future<void> initWeb() async {
    if (GetPlatform.isAndroid) {
      await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
    }
    state.inited.toggle();
  }

  void onRefresh() {
    Get.back();
    webViewController.reload();
  }

  void onClear() {
    Get.back();
    webViewController.clearCache();
  }

  void onExport() {
    Get.back();
    launch(url);
  }

  back() async {
    bool canGoBack = await webViewController.canGoBack();
    if (canGoBack) {
      webViewController.goBack();
    } else {
      Get.back();
    }
  }

  void showBottomModal() {
    showCommonModalBottomSheet(
      context: Get.context!,
      builder: (BuildContext context) => const ModalWebMoreModal(
        export: true,
      ),
    );
  }
}
