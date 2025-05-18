import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uip_tv/controllers/home_controller.dart';
import 'package:uip_tv/models/movie.dart';
import 'package:uip_tv/utils/colors.dart';
import 'package:uip_tv/views/widgets/movie_card.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 10),
                _buildSearchBar(),
                _buildCategories('Categories'),
                const SizedBox(height: 10),
                _buildImageWidget(),
                const SizedBox(height: 10),
                _buildMovieSection(
                    'Trending Movies', controller.trendingMovies),
                _buildContinueWatching(),
                _buildMovieSection(
                    'Recommended For You', controller.recommendedMovies),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            color: const Color(0xff1C212A),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: const Color.fromARGB(255, 0, 0, 0), width: 2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.home, color: const Color(0xffff3440)),
              Icon(Icons.tv, color: Colors.grey[600]),
              Icon(Icons.download, color: Colors.grey[600]),
              Icon(Icons.person, color: Colors.grey[600]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello ${controller.userName}',
                style: Get.textTheme.headlineSmall?.copyWith(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Akatab')),
            Text('Let\'s watch today',
                style: Get.textTheme.bodyMedium?.copyWith(
                    color: Colors.white70,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Akatab')),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [
                Color.fromRGBO(255, 0, 212, 1),
                Color.fromRGBO(0, 255, 255, 1)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(255, 0, 212, 1).withOpacity(0.6),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: ClipOval(
            child: Image.asset(
              'assets/images/profile.png',
              width: 48,
              height: 48,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: TextField(
        onChanged: (value) => () {},
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: const TextStyle(color: Colors.white70),
          // prefixIcon: const Icon(Icons.search, color: Colors.white70),
          filled: true,
          fillColor: Colors.grey[800],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide.none,
          ),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildCategories(title) {
    return Column(
      children: [
        // Row(
        //   children: [
        //     Text(
        //       'Categories',
        //       style: Get.textTheme.titleLarge?.copyWith(
        //           fontWeight: FontWeight.bold,
        //           color: Colors.white,
        //           fontFamily: 'Akatab',
        //           // fontSize: 20
        //           ),
        //     ),
        //     const Spacer(),
        //     Text('See More',
        //         style: Get.textTheme.bodyMedium?.copyWith(
        //             color: Colors.white70,
        //             fontWeight: FontWeight.w400,
        //             fontFamily: 'Akatab')),
        //   ],
        // ),
        _buildSectionHeader(title),
        const SizedBox(height: 8),
        SizedBox(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: ['Action', 'Anime', 'Sci-fi', 'Thriller']
                .map((genre) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Chip(
                        label: Text(genre),
                        backgroundColor: Colors.grey[800],
                        labelStyle: const TextStyle(color: Colors.white),
                      ),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildImageWidget() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        'assets/images/headingimage.png',
        fit: BoxFit.cover,
        width: double.infinity,
        height: 200,
      ),
    );
  }

  Widget _buildContinueWatching() {
    return Column(
      children: [
        _buildSectionHeader('Continue Watching'),
        SizedBox(
          height: 200,
          // width: 300,
          child: Obx(() => ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.continueWatching.length,
                itemBuilder: (_, index) => MovieCard(
                  movie: controller.continueWatching[index],
                  showProgress: true,
                ),
              )),
        ),
      ],
    );
  }

  Widget _buildMovieSection(String title, RxList<Movie> movies) {
    return Column(
      children: [
        _buildSectionHeader(title),
        SizedBox(
          height: 270,
          child: Obx(() => ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (_, index) => MovieCard(movie: movies[index]),
              )),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Get.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Akatab',
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'See More',
            style: TextStyle(
              color: AppColors.textColor,
              fontFamily: 'Akatab',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
