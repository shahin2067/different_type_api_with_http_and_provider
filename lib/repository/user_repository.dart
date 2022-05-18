import 'package:diffrents_api_and_provider/model/user_model.dart';
import 'package:diffrents_api_and_provider/utils/app_error.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'dart:io';

class UserRepository{

  Future<Either<AppError, List<UserModel>?>> fetchUserData() async{
    var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    var response = await http.get(url);

    List<UserModel>? data = userModelFromJson(response.body);
    //var myData = response.body as List;
    //print('respnse: ')
    //var newList = myData.map((e) => UserModel.fromJson(e)).toList();
    //print('data: ${response.body}');

    try {
      if (response.statusCode == 200) {
        return Right(data);
      } else if (response.statusCode == 401) {
        return Left(AppError.unauthorized);
      } else {
        return Left(AppError.serverError);
      }
    } on SocketException catch (e) {
      //logger.e(e);
      return Left(AppError.networkError);
    } catch (e) {
      //logger.e(e);
      return Left(AppError.unknownError);
    }

  }

}