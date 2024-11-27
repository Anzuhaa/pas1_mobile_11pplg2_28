import 'package:get/get.dart';

class DashboardController extends GetxController {
  var selectedindex = 0.obs;

  void changesMenu(index) {
    selectedindex.value = index;
  }
}
