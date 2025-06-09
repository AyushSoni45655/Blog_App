import 'package:blog_app/core/failure.dart';
import 'package:blog_app/features/domain/repository/user_repository.dart';
import 'package:fpdart/fpdart.dart';

class UseLoggedInUseCase{
  final UserRepository userRepository;
  UseLoggedInUseCase({required this.userRepository});
  Future<Either<Failuress,bool>>call()async{
    return userRepository.userLoggedIn();
  }
}