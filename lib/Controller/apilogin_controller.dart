import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../API/apilogin_service.dart';

class ApiloginController extends GetxController {
  final storage = GetStorage();
  final ApiloginService apiServicee = ApiloginService();
  var isLoading = false.obs;
  var loginStatus = ''.obs;
  var token = ''.obs;
  var username = ''.obs;

  Future<void> loginUser(String usernameInput, String password) async {
    try {
      isLoading(true);

      final responseData = await apiServicee.login(usernameInput, password);

      if (responseData['status'] == true) {
        token.value = responseData['token'] ?? '';
        username.value = usernameInput;
        loginStatus.value =
            'Login success: ${responseData['message']}\nToken: ${token.value}';

        await storage.write('isLoggedIn', true);
        await storage.write('token', token.value);
        await storage.write('username', usernameInput);

        Get.snackbar(
          'Login Success',
          'Welcome Back, $usernameInput!',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.offAllNamed('/home');
      } else {
        loginStatus.value = 'Login failed: ${responseData['message']}';
        Get.snackbar(
          'Error',
          responseData['message'] ?? 'Login Failed.',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      loginStatus.value = 'Login Failed: $e';
      Get.snackbar(
        'Error',
        'Error found: $e',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }

  Future<void> logoutUser() async {
    try {
      isLoading(true);

      await storage.remove('isLoggedIn');
      await storage.remove('token');
      await storage.remove('username');
      token.value = '';
      username.value = '';
      loginStatus.value = 'You have been logged out.';

      Get.snackbar(
        'Logout Successful',
        'You have been logged out successfully.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      Get.offAllNamed('/login');
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to log out: $e',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }
}
