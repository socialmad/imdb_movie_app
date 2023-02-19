import 'package:imdb_movie_app/app/data/providers/movie_provider.dart';
import 'package:imdb_movie_app/app/services/network_status_service.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static void init() async {
    //provider
    Get.put<MovieProvider>(MovieProvider());

    //services
    Get.put<NetworkStatusService>(NetworkStatusService(), permanent: true);

  }
}
