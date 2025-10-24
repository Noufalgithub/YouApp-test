import 'package:get/get.dart';

class EditInterestController extends GetxController {
  final RxList<String?> interests = <String?>[].obs;

  void addInterest(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) return;
    if (!interests.contains(trimmed)) {
      interests.add(trimmed);
    }
  }

  void removeInterest(String value) {
    interests.remove(value);
  }

  bool get isEmpty =>
      interests.isEmpty || interests.every((e) => e!.trim().isEmpty);
}
