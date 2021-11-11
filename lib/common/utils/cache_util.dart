import 'dart:io';

import 'package:desk/common/utils/toast.dart';
import 'package:path_provider/path_provider.dart';

import '../../export.dart';

class CacheUtil {
  ///加载缓存
  static Future<String?> loadCache() async {
    try {
      var _tempDir = await getTemporaryDirectory();
      double value = 0;
      var exists = await _tempDir.exists();
      if (exists) {
        value = await _getTotalSizeOfFilesInDir(_tempDir);
      }
      /*tempDir.list(followLinks: false,recursive: true).listen((file){
          //打印每个缓存文件的路径
        print(file.path);
      });*/
      String cacheSize = _renderSize(value);
      logger.d('临时目录大小「$cacheSize」');
      return cacheSize;
    } catch (err) {
      logger.e('$err');
      return null;
    }
  }

  static Future<double> _getTotalSizeOfFilesInDir(
    final FileSystemEntity file,
  ) async {
    if (file is File) {
      int length = await file.length();
      return double.parse(length.toString());
    }
    if (file is Directory) {
      final List<FileSystemEntity> children = file.listSync();
      double total = 0;
      for (final FileSystemEntity child in children) {
        total += await _getTotalSizeOfFilesInDir(child);
      }
      return total;
    }
    return 0;
  }

  ///递归方式删除目录
  static Future delDir(FileSystemEntity file) async {
    try {
      if (file is Directory) {
        final List<FileSystemEntity> children = file.listSync();
        for (final FileSystemEntity child in children) {
          await delDir(child);
        }
      }
      await file.delete();
    } catch (e) {
      logger.e('删除目录失败「$e」');
    }
  }

  ///格式化文件大小
  static String _renderSize(double? value) {
    if (value == null) {
      return '0K';
    }
    List<String> unitArr = ['B', 'K', 'M', 'G'];
    int index = 0;
    while (value! > 1024) {
      index++;
      value = value / 1024;
    }
    String size = value.toStringAsFixed(2);
    return size + unitArr[index];
  }

  static Future<String?> clearCache(context) async {
    //此处展示加载loading
    try {
      var _tempDir = await getTemporaryDirectory();
      double value = 0;
      bool exists = await _tempDir.exists();
      if (_tempDir != null && exists) {
        value = await _getTotalSizeOfFilesInDir(_tempDir);
      }
      if (value <= 0) {
        ToastUtil.show('暂无缓存');
      } else if (value >= 0) {
        toastLoading();
        return Future.delayed(const Duration(seconds: 2), () async {
          //删除缓存目录
          await delDir(_tempDir);
          ToastUtil.show('清理完成');
          var size = await loadCache();
          logger.d("size => $size");
          return size;
        });
      }
    } catch (e) {
      ToastUtil.show('清除缓存失败');
    } finally {
      cancelLoading();
    }
  }
}
