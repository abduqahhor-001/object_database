import 'package:get_storage/get_storage.dart';

import '../Model/Users.dart';

class ObjectDatabase{
  static var box= GetStorage();

  static void getUser(User user){
    box.write("user", user.toJson());
  }

  static User checkUser(){
    var user = User.fromJson(box.read("user"));
    return user;
  }

}