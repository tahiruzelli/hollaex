
import 'package:get/get.dart';
import 'package:hollaex/Globals/Constans/colors.dart';
double opacityValue = 0.7;
errorSnackBar(String title, String content) {
  return Get.snackbar(
    title,
    content,
    backgroundColor: colorDanger.withOpacity(opacityValue),
    colorText: colorWhite,
  );
}

warningSnackBar(String title, String content) {
  return Get.snackbar(
    title,
    content,
    backgroundColor: colorWarning.withOpacity(opacityValue),
    colorText: colorWhite,
  );
}

infoSnackBar(String title, String content) {
  return Get.snackbar(
    title,
    content,
    backgroundColor: colorInfo.withOpacity(opacityValue),
    colorText: colorWhite,
  );
}

successSnackBar(String title, String content) {
  return Get.snackbar(
    title,
    content,
    backgroundColor: colorSuccess.withOpacity(opacityValue),
    colorText: colorWhite,
  );
}