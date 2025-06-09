import 'package:blog_app/core/failure.dart';
import 'package:blog_app/features/domain/entity/user.dart';
import 'package:blog_app/features/domain/repository/user_repository.dart';
import 'package:fpdart/fpdart.dart';

class SignUpUseCase{
  final UserRepository userRepository;
  SignUpUseCase({required this.userRepository});
  Future<Either<Failuress,UserEntity>>call({required UserEntity users})async{
    return userRepository.signup(user: users);
  }
}