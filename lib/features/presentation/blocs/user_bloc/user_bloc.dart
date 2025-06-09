import 'package:bloc/bloc.dart';
import 'package:blog_app/features/domain/entity/user.dart';
import 'package:blog_app/features/domain/usecase/forgotpassword_usecase.dart';
import 'package:blog_app/features/domain/usecase/getuser_usecase.dart';
import 'package:blog_app/features/domain/usecase/isuserloggedin_usecase.dart';
import 'package:blog_app/features/domain/usecase/logout_usecase.dart';
import 'package:blog_app/features/domain/usecase/signin_usecase.dart';
import 'package:blog_app/features/domain/usecase/signup_usecase.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;
  final GetUserUseCase getUserUseCase;
  final ForgotPasswordUseCase forgotPasswordUseCase;
  final LogOutUseCase logOutUseCase;
  final UseLoggedInUseCase useLoggedInUseCase;
  UserBloc({required this.useLoggedInUseCase,
    required this.logOutUseCase,
    required this.getUserUseCase,
    required this.forgotPasswordUseCase,
    required this.signUpUseCase,
    required this.signInUseCase
  }) : super(UserInitial()) {
    on<UserSignUpEvent>((event, emit)async{
      emit(UserLoadingState());
     final data = await signUpUseCase.call(users: event.entity);
     data.fold((l) => emit(UserErrorState(error: l.toString())), (r) => emit(UserSuccessState(userEntity: r)),);
    });
    on<UserSignInEvent>((event, emit)async{
      emit(UserLoadingState());
      final data = await signInUseCase.call(email: event.email, password: event.password);
      data.fold((l) => emit(UserErrorState(error: l.toString())), (r) => emit(UserSuccessState(userEntity: r)),);
    });
    on<UserForgotPasswordEvent>((event, emit)async{
      emit(UserLoadingState());
      final data = await forgotPasswordUseCase.call(email: event.email);
      data.fold((l) => emit(UserErrorState(error: l.toString())), (_) => emit(UserForgotPasswordState()),);
    });
    on<UserLogOutEvent>((event, emit)async{
      emit(UserLoadingState());
      final data = await logOutUseCase.call();
      data.fold((l) => emit(UserErrorState(error: l.toString())), (r) => emit(UserLogOutState()),);
    });
    on<UserIsLoggedInEvent>((event, emit)async{
      final data = await useLoggedInUseCase.call();
      data.fold((l) => emit(UserErrorState(error: l.toString())), (r) => r?emit(UserIsLoggedInState()):emit(UserLogOutState()),);
    });
    on<GetUserEvent>((event, emit)async{
      final data = await getUserUseCase.call();
      data.fold((l) => emit(UserErrorState(error: l.toString())), (r) => emit(GetUserState(entity: r)),);
    });
  }
}
