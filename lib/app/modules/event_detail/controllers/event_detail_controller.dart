import 'package:gdg_eljadida/app/core/state/loading_state.dart';
import 'package:gdg_eljadida/app/data/models/event.dart';
import 'package:gdg_eljadida/app/services/event_service.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@injectable
class EventDetailController extends GetxController {
  late int index;

  final pageState = Rx<LoadingState>(LoadingState.loading());

  Event get event => eventService.events[index];

  var isFavorite=false.obs;

  EventService eventService;

  EventDetailController(this.eventService);

  @override
  void onInit() {
    super.onInit();
    _fetchEvent();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  onFavorite() {
    eventService.favorite(index: index, isFav: isFavorite.value);
    isFavorite.toggle();
  }

  void _fetchEvent() {
    pageState.value = LOADING();
    index = Get.arguments['index'];
    pageState.value = LOADED();
  }
}
