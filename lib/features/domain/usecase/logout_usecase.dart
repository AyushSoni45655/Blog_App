import 'package:blog_app/core/failure.dart';
import 'package:blog_app/features/domain/repository/user_repository.dart';
import 'package:fpdart/fpdart.dart';

class LogOutUseCase{
  final UserRepository userRepository;
  LogOutUseCase({required this.userRepository});
  Future<Either<Failuress,void>>call()async{
    return userRepository.logOut();
  }
}