import 'package:blog_app/core/failure.dart';
import 'package:blog_app/features/domain/entity/user.dart';
import 'package:blog_app/features/domain/repository/user_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetUserUseCase{
  final UserRepository userRepository;
  GetUserUseCase({required this.userRepository});
  Future<Either<Failuress,UserEntity>>call()async{
    return userRepository.getUser();
  }
}