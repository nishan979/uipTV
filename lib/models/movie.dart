class Movie {
  final String id;
  final String title;
  final String imageUrl;
  final String genre;
  final double progress;
  final int season;
  final int episode;

  Movie({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.genre,
    this.progress = 0,
    this.season = 1,
    this.episode = 1,
  });
}