import 'package:get/get.dart';
import 'package:uip_tv/models/movie.dart';

class HomeController extends GetxController {
  final RxList<Movie> trendingMovies = <Movie>[].obs;
  final RxList<Movie> continueWatching = <Movie>[].obs;
  final RxList<Movie> recommendedMovies = <Movie>[].obs;
  final RxString userName = 'Rafsan'.obs;

  @override
  void onInit() {
    _loadDummyData();
    super.onInit();
  }

  void _loadDummyData() {
    trendingMovies.assignAll([
      Movie(
        id: '1',
        title: 'Yes I Do',
        imageUrl: 'trendingMovies/yesIDo.png',
        genre: 'Romance',
      ),
      Movie(
        id: '2',
        title: 'Inside Out 2',
        imageUrl: 'trendingMovies/insideOut2.png',
        genre: 'Animation',
      ),
      Movie(
        id: '3',
        title: 'Babylon',
        imageUrl: 'trendingMovies/babylon.png',
        genre: 'Drama',
      ),
    ]);

    continueWatching.assignAll([
      Movie(
        id: '4',
        title: 'Wednesday',
        imageUrl: 'contMovies/wednesday.png',
        genre: 'Drama',
        progress: 0.6,
        season: 1,
        episode: 3,
      ),
      Movie(
        id: '5',
        title: 'SoulMate',
        imageUrl: 'contMovies/emilyInParis.png',
        genre: 'Drama',
        progress: 0.3,
        season: 1,
        episode: 2,
      ),
    ]);

    recommendedMovies.assignAll([
      Movie(
        id: '6',
        title: 'Double Love',
        imageUrl: 'recomended/doubleLove.png',
        genre: 'Drama',
      ),
      Movie(
        id: '7',
        title: 'Sunita',
        imageUrl: 'recomended/sunita.png',
        genre: 'Animation',
      ),
      Movie(
        id: '8',
        title: 'Pokemon: detective Pikachu',
        imageUrl: 'recomended/pokemon.png',
        genre: 'Romance',
      ),
    ]);
  }
}