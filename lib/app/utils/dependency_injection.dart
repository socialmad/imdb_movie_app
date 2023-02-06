import 'package:imdb_movie_app/app/services/network_status_service.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static void init() async {
    //services
    Get.put<NetworkStatusService>(NetworkStatusService(), permanent: true);
  }
}
