import 'package:diffrents_api_and_provider/model/user_model.dart';
import 'package:diffrents_api_and_provider/repository/user_repository.dart';
import 'package:diffrents_api_and_provider/utils/app_error.dart';
import 'package:flutter/cupertino.dart';

class UserViewModel extends ChangeNotifier{

  late AppError error;
  bool _isLoadingData = false;
  List<UserModel>? _userData;
  //List<UserModel> _userData = [];

  Future<bool> getVersion() async {
    _isLoadingData = true;
    var result = await UserRepository().fetchUserData();
    return result.fold((l) {
      _isLoadingData = false;
      return false;
    }, (r) {
      _userData= r;
      _isLoadingData = false;
      print('Shahin: $userData');
      notifyListeners();
      return true;
    });
  }
  List<UserModel>? get userData => _userData;


}