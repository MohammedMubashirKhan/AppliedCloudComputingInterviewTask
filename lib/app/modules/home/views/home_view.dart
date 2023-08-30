import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Flutter Demo Home Page"),
      ),
      body: Column(
        children: [
          Obx(
            () {
              if (controller.bannersModel.value == null) {
                return const CircularProgressIndicator();
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "${controller.bannersModel.value?.data?.first.cardName}"),
                  CarouselSlider.builder(
                    itemCount: controller.bannersModel.value?.data?.first
                            .contentList?.length ??
                        0,
                    itemBuilder: (context, index, realIndex) {
                      final cardData = controller
                          .bannersModel.value?.data?.first.contentList?[index];

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            CachedNetworkImage(imageUrl: cardData!.imageUrl!),
                      );
                    },
                    options: CarouselOptions(
                      height: 200,
                      viewportFraction: 0.3,
                      autoPlay: true,
                      // enlargeCenterPage: true,
                      // enlargeFactor: 0.3,
                    ),
                  ),
                ],
              );
            },
          ),
          Obx(() {
            if (controller.typesOfMoviesModel.value == null) {
              return const CircularProgressIndicator();
            }

            return Expanded(
              child: ListView.builder(
                itemCount: controller.typesOfMoviesModel.value?.data?.length,
                itemBuilder: (context, outerIndex) {
                  var data =
                      controller.typesOfMoviesModel.value?.data?[outerIndex];
                  print("data: ${data?.toJson()}");
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${data?.cardName}"),
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                          itemCount: data?.contentList?.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, innerIndex) {
                            var movie = data?.contentList?[innerIndex];
                            return Column(
                              children: [
                                SizedBox(
                                  height: 100,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CachedNetworkImage(
                                      imageUrl: movie!.imageUrl!,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          })
        ],
      ),
    );
  }
}
