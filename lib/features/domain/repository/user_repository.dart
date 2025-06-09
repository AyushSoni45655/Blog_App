import 'package:blog_app/core/failure.dart';
import 'package:blog_app/features/domain/entity/user.dart';
import 'package:fpdart/fpdart.dart';

abstract class UserRepository{
  Future<Either<Failuress,UserEntity>>signin({required String email,required String password});
  Future<Either<Failuress,bool>>userLoggedIn();
  Future<Either<Failuress,void>>logOut();
  Future<Either<Failuress,void>>forgotPassword({required String email});
  Future<Either<Failuress,UserEntity>>signup({required UserEntity user});
}