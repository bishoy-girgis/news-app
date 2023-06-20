import 'package:flutter/cupertino.dart';

class SettingProvider extends ChangeNotifier {
  String currentLocal = "en";

  void changeLocal(String newLocal) {
    if (newLocal == currentLocal) return;
    currentLocal = newLocal;
    notifyListeners();
  }
}
