import 'dart:ffi';

import 'package:desk/common/base/base_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../export.dart';

abstract class BaseController<T> extends SuperController<T> {
  late RefreshController refreshController = RefreshController();
  // PageParams? pageParams;

  ///需要分页的话重写这个变量
  bool supportPagination = false;

  ///展示的空信息
  String? emptyMsg;

  late Future<T> Function() requestFunc;

  GestureDetector get _placeholderError => GestureDetector(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/ic_placeholder_error.png', width: 200),
              Text('tip_page_error'.tr, style: Get.textTheme.subtitle2)
            ],
          ),
        ),
        onTap: () => onRefresh(),
      );

  Center get _placeholderEmpty => Center(
        child: GestureDetector(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/ic_placeholder_empty.png',
                  width: 200,
                ),
                Text('${emptyMsg ?? 'tip_page_empty'.tr}，轻触刷新',
                    style: Get.textTheme.subtitle2)
              ],
            ),
          ),
          onTap: () => onRefresh(),
        ),
      );

  Widget volatile(NotifierBuilder<T?> widget) {
    return obx(widget,
        onLoading: loading(),
        onError: (_) => _placeholderError,
        onEmpty: _placeholderEmpty);
  }

  void onRefresh() {
    // pageParams ??= PageParams.init();
    // pageParams?.pages = 1;
    try {
      Future<T> compute() => requestFunc();
      compute().then((newValue) {
        if (newValue is List) {
          change(newValue,
              status: newValue.isEmpty ? RxStatus.empty() : RxStatus.success());
        } else {
          change(newValue, status: RxStatus.success());
        }
        onDataLoaded();
      }, onError: (err) {
        change(state, status: RxStatus.error(err.toString()));
      });
    } catch (e) {
      logger.e('刷新失败了...「$e」');
    } finally {
      refreshController.refreshCompleted();
      refreshController.loadComplete();
    }
  }

  ///下一页
  Future<Void?> onLoadMore() async {
    // pageParams?.next();
    try {
      change(state, status: RxStatus.loadingMore());
      final List<dynamic> newList = await requestFunc() as List<dynamic>;
      if (newList.isEmpty) {
        refreshController.loadNoData();
      } else {
        refreshController.loadComplete();
      }
      if(state != null) {
        (state! as List<dynamic>).addAll(newList);
      }
      change(state, status: RxStatus.success());
    } catch (e) {
      logger.e('加载更多失败了...「$e」');
    }
  }

  void onDataLoaded() {}

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    if (supportPagination) {
      onRefresh();
    }
    super.onReady();
  }

  @override
  void onDetached() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {}
}
