import 'package:get/get.dart';

import 'package:imdb_movie_app/app/modules/details/bindings/details_binding.dart';
import 'package:imdb_movie_app/app/modules/details/views/details_view.dart';
import 'package:imdb_movie_app/app/modules/home/bindings/home_binding.dart';
import 'package:imdb_movie_app/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DETAILS,
      page: () => DetailsView(),
      binding: DetailsBinding(),
    ),
  ];
}
