import 'package:get/get.dart';
import 'package:imdb_movie_app/app/data/models/movie_details_model.dart';
import 'package:imdb_movie_app/app/data/providers/movie_provider.dart';

class DetailsController extends GetxController {
  int movieId = Get.arguments['movie_id'] ?? 0;
  final MovieProvider movieProvider = Get.find<MovieProvider>();

  RxBool isLoading = true.obs;
  RxList<MovieDetails> movie = <MovieDetails>[].obs;

  @override
  void onReady() {
    super.onReady();
    fetchMovieByID();
  }

  void fetchMovieByID() async {
    var response = await movieProvider.getMoviesByID(movieId: movieId);
    if(response != null){
      movie.add(MovieDetails.fromJson(response));
    }
    isLoading.value = false;
  }

}
