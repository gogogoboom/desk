import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'zh': <String, String>{
          'hello': '你好 世界',
          'app_name': 'Desk',
          'home': '首页',
          'selection': '精选',
          'room': '聊天室',
          'meet': '邂逅',
          'mine': '我的',
          'begin_download_android': '开始下载',
          'begin_download_ios': '前往App store',
          'downloading': '正在下载',
          'downloaded': '下载完成',
          'download_failed': '下载失败',
          're_download': '重新下载',
          'install': '安装',
          'ignore_version': '稍后提醒我',
          'mine_publish_task': '我发布的',
          'mine_do_task': '我执行的',
          'search': '搜索',
          'login': '登录',
          'logout': '退出登录',
          'register': '注册',
          'welcome': '欢迎',
          'username': '手机号',
          'password': '密码',
          'username_hint': '请输入手机号',
          'otp_code_hint': '请输入验证码',
          'password_hint': '请输入密码',
          'forget': '忘记密码？',
          'register_now': '没有账号？去注册',
          'otp_code': '验证码',
          'get_otp_code': '获取验证码',
          'go_login': '已有账号？去登录',
          'tip': '提示',
          'cancel': '取消',
          'confirm': '确定',
        },
        'de_DE': {
          'hello': 'Hallo World',
        },
      };
}
