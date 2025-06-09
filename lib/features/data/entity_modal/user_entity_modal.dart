import 'package:blog_app/features/domain/entity/user.dart';

class UserModel extends UserEntity{
  UserModel({required super.id, required super.name, required super.email, required super.password, required super.phone});
  Map<String,dynamic>toMap(){
    return{
      "Id":id,
      "Name":name,
      "Email":email,
      "Password":password,
      "Phone":phone
    };
  }
  factory UserModel.fromMap(Map<String,dynamic>json){
    return UserModel(
        id: json["Id"]??"No Id",
        name: json["Name"]??"No name",
        email: json["Email"]??"No email",
        password: json["Password"]??"No password",
        phone: json["Phone"]??"No phone",
    );
  }

}