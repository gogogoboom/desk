import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';

import 'common/http/address.dart';
import 'common/http/base_dio.dart';
import 'common/http/rest/common_rest_client.dart';
import 'common/http/rest/member_rest_client.dart';

final Logger logger = Logger();

final GetStorage getStorage = GetStorage();
final Dio dio = BaseDio.getInstance().getDio();
final MemberRestClient memberRestClient =
MemberRestClient(dio, baseUrl: Address.baseUrl);
final CommonRestClient commonRestClient =
CommonRestClient(dio, baseUrl: Address.baseUrl);
const Uuid uuid = Uuid();
