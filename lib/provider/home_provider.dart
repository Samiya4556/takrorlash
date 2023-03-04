import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:takrorlash/models/users_models.dart';
import 'package:takrorlash/service/users_service.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    getData();
  }
  GetUserService getUserService = GetUserService();
  List<UserModels>? data;
  bool isLoading = false;
  String? error = "";
  void getData() async {
    isLoading = true;
    notifyListeners();
    dynamic response = await getUserService.getUserService();
    if (response is List<UserModels>) {
      data = response;
      isLoading = false;
      notifyListeners();
    } else {
      error = response;
      isLoading = false;
      notifyListeners();
    }
  }
}