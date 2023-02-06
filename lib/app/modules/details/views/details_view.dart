import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imdb_movie_app/app/modules/details/controllers/details_controller.dart';
import 'package:imdb_movie_app/app/themes/app_text_theme.dart';
import 'package:imdb_movie_app/app/themes/theme_colors.dart';
import 'package:imdb_movie_app/app/utils/constants.dart';
import 'dart:math' as math;

class DetailsView extends GetView<DetailsController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: ThemeColor.white,
        body: controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : NestedScrollView(
                headerSliverBuilder:
                    ((BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      title: Text(
                        controller.movie.first.originalTitle.toString(),
                        style: poppinsBold(color: ThemeColor.white),
                      ),
                      expandedHeight: Get.height * 0.4,
                      floating: true,
                      pinned: true,
                      elevation: 0,
                      flexibleSpace: FlexibleSpaceBar(
                        background: CachedNetworkImage(
                          imageUrl:
                              '$imageBaseUrl${controller.movie.first.backdropPath}',
                          fit: BoxFit.cover,
                          width: Get.width,
                          height: Get.height,
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                        collapseMode: CollapseMode.parallax,
                      ),
                    )
                  ];
                }),
                body: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Genres',
                        style: poppinsBold(),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        height: Get.height * 0.04,
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: controller.movie.first.genres!.length,
                          physics: const ScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Center(
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: Color((math.Random().nextDouble() *
                                              0xFFFFFF)
                                          .toInt())
                                      .withOpacity(1.0),
                                ),
                                child: Text(
                                  controller.movie.first.genres![index].name
                                      .toString(),
                                  style: poppinsMedium(
                                    color: ThemeColor.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(width: 10);
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Overview',
                        style: poppinsBold(),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        controller.movie.first.overview.toString(),
                        style: poppinsRegular(color: ThemeColor.primaryGrey),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
