import 'package:blog_app/core/constant/sharedpreference_helper.dart';
import 'package:blog_app/features/data/entity_modal/user_entity_modal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entity/user.dart';

abstract class UserDataSource{
  Future<UserModel>signin({required String email,required String password});
  Future<bool>isUserLoggedIn();
  Future<void>logOut();
  Future<void>forgotPassword({required String email});
  Future<UserModel>signup({required UserEntity users});
}
class UserDataSourceImplementation extends UserDataSource{
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  final SharedPreferences sh;
  UserDataSourceImplementation({required this.firestore,required this.auth,required this.sh});
  @override
  Future<void> forgotPassword({required String email})async{
    await auth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<bool> isUserLoggedIn()async{
    return sh.containsKey("Uid");
  }

  @override
  Future<void> logOut()async{
    await sh.remove("Uid");
    await auth.signOut();
  }

  @override
  Future<UserModel> signin({required String email, required String password})async{
    final credential = await auth.signInWithEmailAndPassword(email: email, password: password);
    final data = await firestore.collection("BlogUser").doc(credential.user!.uid).get();
    await sh.setString("Uid", credential.user!.uid);
    return UserModel.fromMap(data.data()!);
  }

  @override
  Future<UserModel> signup({required UserEntity users})async{
    final credential = await auth.createUserWithEmailAndPassword(email: users.email, password: users.password);
    await SharedPreferenceHelper().setUserId(users.id);
    await SharedPreferenceHelper().setName(users.name);
    await SharedPreferenceHelper().setUserEmail(users.email);
    await SharedPreferenceHelper().setUserPhone(users.phone);
    final modal = UserModel(
        id: credential.user!.uid,
        name: users.name,
        email: users.email,
        password: users.password,
        phone: users.phone
    );
    await firestore.collection("BlogUser").doc(credential.user!.uid).set(modal.toMap());
    await sh.setString("Uid", credential.user!.uid);
    return modal;
  }

}
