import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gdg_eljadida/app/core/di/injection.dart';
import 'package:gdg_eljadida/app/core/state/loading_state.dart';
import 'package:gdg_eljadida/app/widgets/favorite_card.dart';
import 'package:get/get.dart';

import '../controllers/event_detail_controller.dart';

class EventDetailView extends StatelessWidget {
  final eventDetailController = Get.put(getIt<EventDetailController>());

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

              ],
            );
          }
          return const SizedBox();
        }),
      ),
    );
  }
}
