import 'package:dio/dio.dart';
import 'package:takrorlash/models/users_models.dart';

class GetUserService {
  Future<dynamic> getUserService() async {
    try {
      Response response =
          await Dio().get("https://jsonplaceholder.typicode.com/users");

      if (response.statusCode == 200) {
        List<UserModels> userData =
            (response.data as List).map((e) => UserModels.fromJson(e)).toList();
        return userData;
      } else {
        return response.statusMessage;
      }
    } on DioError catch (e) {
      return e.message.toString();
    }
  }
}
