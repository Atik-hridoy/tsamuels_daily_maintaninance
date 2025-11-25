import 'package:get/get.dart';
import '../controllers/getstarted_controller.dart';

class GetStartedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetStartedController>(() => GetStartedController());
  }
}
