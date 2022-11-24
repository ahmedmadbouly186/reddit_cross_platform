import 'package:flutter/material.dart';
import '../../networks/const_endpoint_data.dart';
import '../../networks/dio_client.dart';
import '../models/myprofile_data.dart';

//using in heighest widget to use
class MyProfileProvider with ChangeNotifier {
  MyProfileData? loadProfile;

  MyProfileData? get gettingMyProfileData {
    return loadProfile;
  }

  Future<void> fetchAndSetMyProfile(String userName) async {
    try {
      DioClient.init();
      await DioClient.get(path: myprofile).then((response) {
        loadProfile = MyProfileData.fromJson(response.data['data']);
        notifyListeners();
      });
    } catch (error) {
      print(error);
      throw (error);
    }
  }
}
