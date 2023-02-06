import 'package:get/get.dart';
import 'package:imdb_movie_app/app/modules/details/controllers/details_controller.dart';

class DetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsController>(
      () => DetailsController(),
    );
  }
}
