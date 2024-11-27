import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  final storage = GetStorage();
  var username = ''.obs;
  var email = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  void loadUserData() {
    username.value = storage.read('username') ?? 'User';
    email.value = storage.read('email') ?? 'user@email.com';
  }

  void logout() {
    storage.erase();
    Get.offAllNamed('/login');
  }
}
