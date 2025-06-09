import 'package:blog_app/core/failure.dart';
import 'package:blog_app/features/domain/repository/user_repository.dart';
import 'package:fpdart/fpdart.dart';

class ForgotPasswordUseCase{
  final UserRepository userRepository;
  ForgotPasswordUseCase({required this.userRepository});
  Future<Either<Failuress,void>>call({required String email})async{
    return userRepository.forgotPassword(email: email);
  }
}