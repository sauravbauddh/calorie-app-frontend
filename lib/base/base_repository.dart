import 'package:calorie_app/app/data/network/network_request.dart';
import 'package:get/get.dart';

class BaseRepository {
  NetworkRequester get controller => GetInstance().find<NetworkRequester>();
}
