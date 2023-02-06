import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:imdb_movie_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:imdb_movie_app/app/widgets/network_error_item.dart';

class NetworkStatusService extends GetxService {
  NetworkStatusService() {
    Connectivity().onConnectivityChanged.listen(
          (status) async {
        _getNetworkStatus(status);
      },
    );
  }

  void _getNetworkStatus(ConnectivityResult status) {
    if (status == ConnectivityResult.mobile ||
        status == ConnectivityResult.wifi) {
      if (Get.isDialogOpen == true) {
        Get.offNamedUntil(Routes.HOME, (_) => false);
      }
    } else {
      Get.dialog(NetworkErrorItem(), useSafeArea: false);
    }
  }
}
