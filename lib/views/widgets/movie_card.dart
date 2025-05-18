import 'package:flutter/material.dart';

import 'package:uip_tv/models/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final bool showProgress;

  const MovieCard({
    super.key,
    required this.movie,
    this.showProgress = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: AspectRatio(
                  aspectRatio: showProgress ? (120 / 90) : (100 / 130),
                  child: Image.asset(
                    'assets/images/${movie.imageUrl}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              if (showProgress)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: LinearProgressIndicator(
                    value: movie.progress,
                    backgroundColor: Colors.grey[800],
                    valueColor: AlwaysStoppedAnimation(
                        const Color.fromARGB(255, 177, 15, 3)),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            movie.title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Akatab',
                ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (showProgress)
            Text(
              'Season - ${movie.season} Episode - ${movie.episode}',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white70,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Akatab',
                  ),
            ),
        ],
      ),
    );
  }
}
