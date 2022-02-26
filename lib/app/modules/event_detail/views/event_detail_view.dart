import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gdg_eljadida/app/core/di/injection.dart';
import 'package:gdg_eljadida/app/core/state/loading_state.dart';
import 'package:gdg_eljadida/app/routes/app_pages.dart';
import 'package:gdg_eljadida/app/widgets/favorite_card.dart';
import 'package:get/get.dart';

import '../controllers/event_detail_controller.dart';

class EventDetailView extends StatelessWidget {
  final eventDetailController = Get.put(getIt<EventDetailController>(), tag: '${UniqueKey()}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EventDetailView'),
        centerTitle: true,
      ),
      body: SizedBox.expand(
        child: Obx(() {
          final pageState = eventDetailController.pageState.value;
          if (pageState is LOADING) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (pageState is LOADED) {
            final event = eventDetailController.event;
            return Column(
              children: [
                Expanded(
                  flex: 70,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CachedNetworkImage(
                        imageUrl: event.imageUrl,
                      ),
                      FavoriteCard(
                        onPressed: () => eventDetailController.onFavorite(),
                        isFavorite: event.isFavorite,
                      )
                    ],
                  ),
                ),
                Text('Similar Events',style: Get.textTheme.bodyText1,),
                Obx(() {
                  final events = eventDetailController.events;
                  return Expanded(
                      flex: 30,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: events.length,
                        itemBuilder: (context, index) {
                          final event = events[index];
                          return Card(
                            margin: EdgeInsets.all(16.0),
                            child: SizedBox(
                              height: double.infinity,
                              width: 300.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    flex: 70,
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: [
                                        InkWell(
                                          onTap: () => Get.toNamed(Routes.EVENT_DETAIL,
                                              arguments: {"index": index}, preventDuplicates: false),
                                          child: CachedNetworkImage(
                                            imageUrl: event.imageUrl,
                                            fit: BoxFit.cover,
                                            errorWidget: (context, url, error) => const SizedBox(),
                                          ),
                                        ),
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
                      ));
                })
              ],
            );
          }
          return const SizedBox();
        }),
      ),
    );
  }
}
