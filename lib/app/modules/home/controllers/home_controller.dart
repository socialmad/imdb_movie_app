import 'package:get/get.dart';
import 'package:imdb_movie_app/app/data/models/movie_model.dart';
import 'package:imdb_movie_app/app/data/providers/movie_provider.dart';

class HomeController extends GetxController {
  final MovieProvider movieProvider = Get.find<MovieProvider>();
  RxList<MovieModel> movies = <MovieModel>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onReady() {
    super.onReady();
    fetchMovies();
  }

  void fetchMovies() async {
    var results = await movieProvider.getMovies();
    if (results != null) {
      results.forEach((result) {
        movies.add(MovieModel.fromJson(result));
      });
    }
    isLoading.value = false;
  }
}
