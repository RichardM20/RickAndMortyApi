import 'package:get/get.dart';

class GlobalController extends GetxController {
  static GlobalController get to => Get.find<GlobalController>();

  RxInt characterId = 0.obs;
  RxInt page = 1.obs;
  RxBool hide = false.obs;
  RxString id = ''.obs;
  RxBool exceptionOnList = false.obs;
  RxBool exceptionOnDetail = false.obs;
  RxString messageEx = ''.obs;
}
