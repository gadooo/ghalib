import 'package:cwt_starter_template/data/repository/authentication_repository/authentication_repository.dart';
import 'package:cwt_starter_template/utils/constants/image_strings.dart';
import 'package:cwt_starter_template/utils/helpers/network_manager.dart';
import 'package:cwt_starter_template/utils/popups/exports.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  // Variables
  final email = TextEditingController();
  final GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  // Send Reset Password Email
  sendPasswordResetEmail() async {
    try {
      TFullScreenLoader.openLoadingDialog(
        "Processing your request ",
        TImages.docerAnimation,
      );
      final isConnected = await NetworkManager.instance.isConnected();
      if (isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance.sendPasswordResetEmail(
        email.text.trim(),
      );
      TFullScreenLoader.stopLoading();
    } catch (e) {}
  }

  resendPasswordResetEmail(String email) async {
    try {} catch (e) {}
  }
}
