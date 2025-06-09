import 'package:blog_app/core/failure.dart';
import 'package:blog_app/features/data/source/user_datasource.dart';
import 'package:blog_app/features/domain/entity/user.dart';
import 'package:blog_app/features/domain/repository/user_repository.dart';
import 'package:fpdart/src/either.dart';

class UserRepositoryImplementation extends UserRepository{
  final UserDataSource userDataSource;
  UserRepositoryImplementation({required this.userDataSource});
  @override
  Future<Either<Failuress, void>> forgotPassword({required String email})async{
    try{
      final data = await userDataSource.forgotPassword(email: email);
      return Right(data);
    }catch(e){
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failuress, void>> logOut()async{
    try{
      final data = await userDataSource.logOut();
      return Right(data);
    }catch(e){
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failuress, UserEntity>> signin({required String email, required String password})async{
    try{
      final data = await userDataSource.signin(email: email, password: password);
      return Right(data);
    }catch(e){
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failuress, UserEntity>> signup({required UserEntity user})async{
    try{
      final data = await userDataSource.signup(users: user);
      return Right(data);
    }catch(e){
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failuress, bool>> userLoggedIn()async{
    try{
      final data = await userDataSource.isUserLoggedIn();
      return Right(data);
    }catch(e){
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failuress, UserEntity>> getUser()async{
    try{
      final data = await userDataSource.getUser();
      return Right(data);
    }catch(e){
      return Left(ServerFailure(e.toString()));
    }
  }

}