import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gdg_eljadida/app/core/di/injection.dart';
import 'package:gdg_eljadida/app/widgets/favorite_card.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  final homeController = Get.put(getIt<HomeController>());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('HomeView'),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.blue.withOpacity(0.05),
          child: Obx(() {
            final pageState = homeController.pageState.value;
            return pageState.map(
              loading: (value) => Center(
                child: CircularProgressIndicator(),
              ),
              empty: (value) => const SizedBox(),
              error: (value) => value.message != null ? Text(value.message!) : const SizedBox(),
              loaded: (value) {
                final events = homeController.events.toList();
                if (events.isEmpty) return Container();
                return RefreshIndicator(
                  onRefresh: () => homeController.onRefresh(),
                  child: ListView.builder(
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      final event = events[index];
                      return Card(
                        margin: EdgeInsets.all(16.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 200.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                flex: 70,
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    InkWell(
                                      onTap: () => homeController.onClickEvent(index: index),
                                      child: CachedNetworkImage(
                                        imageUrl: event.imageUrl,
                                        fit: BoxFit.cover,
                                        errorWidget: (context, url, error) => const SizedBox(),
                                      ),
                                    ),
                                    FavoriteCard(
                                      onPressed: () => homeController.onFavorite(index: index, isFav: event.isFavorite),
                                      isFavorite: event.isFavorite,
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 30,
                                child: Center(
                                  child: Text(
                                    event.name,
                                    style: Get.textTheme.headline4,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }),
        ));
  }
}
