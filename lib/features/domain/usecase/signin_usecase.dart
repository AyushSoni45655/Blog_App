import 'package:blog_app/core/failure.dart';
import 'package:blog_app/features/domain/entity/user.dart';
import 'package:blog_app/features/domain/repository/user_repository.dart';
import 'package:fpdart/fpdart.dart';

class SignInUseCase{
  final UserRepository userRepository;
  SignInUseCase({required this.userRepository});
  Future<Either<Failuress,UserEntity>>call({required String email,required String password})async{
    return userRepository.signin(email: email, password: password);
  }
}