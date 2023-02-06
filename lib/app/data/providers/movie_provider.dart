import 'package:get/get.dart';
import 'package:imdb_movie_app/app/utils/constants.dart';

class MovieProvider extends GetConnect {

  //get the upcoming movies list
  Future<dynamic> getMovies() async {
    try{
      final response = await get('$apiBaseUrl/movie/upcoming?api_key=$apiKey');
      if (response.statusCode == 200) {
        return response.body['results'];
      } else {
        return null;
      }
    }catch(e) {
      print(e);
    }
  }

  //get movies by id
  Future<dynamic> getMoviesByID({required int movieId}) async {
    try{
      final response = await get('$apiBaseUrl/movie/$movieId?api_key=$apiKey');
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return null;
      }
    }catch(e) {
      print(e);
    }
  }

}
