import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imdb_movie_app/app/modules/home/controllers/home_controller.dart';
import 'package:imdb_movie_app/app/routes/app_pages.dart';
import 'package:imdb_movie_app/app/themes/app_text_theme.dart';
import 'package:imdb_movie_app/app/themes/theme_colors.dart';
import 'package:imdb_movie_app/app/utils/constants.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeColor.white,
          title: Text(
            'Watch',
            style: poppinsBold(),
          ),
          elevation: 0,
        ),
        body: controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: controller.movies.length,
                  physics: const ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.DETAILS, arguments: {
                          'movie_id': controller.movies[index].id
                        });
                      },
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(6.0),
                            ),
                            child: CachedNetworkImage(
                              imageUrl:
                                  '$imageBaseUrl${controller.movies[index].backdropPath}',
                              fit: BoxFit.cover,
                              height: Get.height * 0.28,
                              width: Get.width,
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: Get.height * 0.15,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(6.0),
                                  bottomRight: Radius.circular(6.0),
                                ),
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.5),
                                    Colors.transparent
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              controller.movies[index].title.toString(),
                              style: poppinsBold(color: ThemeColor.white),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 10);
                  },
                ),
              ),
      ),
    );
  }
}
