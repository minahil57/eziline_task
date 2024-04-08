import 'package:flutter_easyloading/flutter_easyloading.dart';

void showToast({
  required String message,
}) =>
    EasyLoading.showToast(
      message,
      toastPosition: EasyLoadingToastPosition.bottom,
      maskType: EasyLoadingMaskType.black,
    );
