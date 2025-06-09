import 'package:blog_app/features/data/repository_implemantation/blog_repository_implementation.dart';
import 'package:blog_app/features/data/repository_implemantation/repository_implementation.dart';
import 'package:blog_app/features/data/source/blog_data_source.dart';
import 'package:blog_app/features/data/source/user_datasource.dart';
import 'package:blog_app/features/domain/repository/blog_repository.dart';
import 'package:blog_app/features/domain/repository/user_repository.dart';
import 'package:blog_app/features/domain/usecase/addblog_usecase.dart';
import 'package:blog_app/features/domain/usecase/deleteblog_usecase.dart';
import 'package:blog_app/features/domain/usecase/forgotpassword_usecase.dart';
import 'package:blog_app/features/domain/usecase/getblog_usecase.dart';
import 'package:blog_app/features/domain/usecase/getuser_usecase.dart';
import 'package:blog_app/features/domain/usecase/isuserloggedin_usecase.dart';
import 'package:blog_app/features/domain/usecase/logout_usecase.dart';
import 'package:blog_app/features/domain/usecase/searchblog_usecase.dart';
import 'package:blog_app/features/domain/usecase/signin_usecase.dart';
import 'package:blog_app/features/domain/usecase/signup_usecase.dart';
import 'package:blog_app/features/domain/usecase/updateblo_usecase.dart';
import 'package:blog_app/features/presentation/blocs/blogs/blog_bloc.dart';
import 'package:blog_app/features/presentation/blocs/nav_bloc/navigation_bloc.dart';
import 'package:blog_app/features/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/presentation/blocs/toggle/toggle_bloc.dart';
final sl = GetIt.instance;
Future<void> setUpLocator() async {
   sl.registerFactory(() => ToggleBloc());
   sl.registerFactory(() => NavigationBloc());
   sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
   sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
   final sharedPreferences = await SharedPreferences.getInstance();
   sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  // // todo user Authentications
   sl.registerLazySingleton<UserDataSource>(() => UserDataSourceImplementation(firestore: sl(), auth: sl(), sh: sl()),);
   sl.registerLazySingleton<UserRepository>(() =>UserRepositoryImplementation(userDataSource: sl()),);
   sl.registerLazySingleton<SignInUseCase>(() =>SignInUseCase(userRepository: sl()),);
   sl.registerLazySingleton<SignUpUseCase>(() =>SignUpUseCase(userRepository: sl()),);
   sl.registerLazySingleton<ForgotPasswordUseCase>(() =>ForgotPasswordUseCase(userRepository: sl()),);
   sl.registerLazySingleton<LogOutUseCase>(() =>LogOutUseCase(userRepository: sl()),);
   sl.registerLazySingleton<UseLoggedInUseCase>(() =>UseLoggedInUseCase(userRepository: sl()),);
   sl.registerLazySingleton<GetUserUseCase>(() => GetUserUseCase(userRepository: sl()),);
   sl.registerFactory(() => UserBloc(
      getUserUseCase: sl(),
       useLoggedInUseCase: sl(),
       logOutUseCase: sl(),
       forgotPasswordUseCase: sl(),
       signUpUseCase: sl(),
       signInUseCase: sl()),
   );

                                    // BLOG CRUD OPERATION PERFORM ADD DELETE UPDATE GET
   sl.registerLazySingleton<BlogDataSource>(() =>BlogDateSourceImplementation(firestore: sl()) ,);
   sl.registerLazySingleton<BlogRepository>(() =>BlogRepositoryImplementation(dataSource: sl()),);
   sl.registerLazySingleton<AddBlogUseCase>(() =>AddBlogUseCase(blogRepository: sl()),);
   sl.registerLazySingleton<GetBlogUseCase>(() =>GetBlogUseCase(blogRepository: sl()),);
   sl.registerLazySingleton<SearchBlogUseCase>(() =>SearchBlogUseCase(blogRepository: sl()),);
   sl.registerLazySingleton<DeleteBlogUseCse>(() =>DeleteBlogUseCse(blogRepository: sl()),);
   sl.registerLazySingleton<UpdateBlogUseCase>(() =>UpdateBlogUseCase(blogRepository: sl()),);

   sl.registerFactory(() =>BlogBloc(
       getBlogUseCase: sl(),
       addBlogUseCase: sl(),
      deleteBlogUseCse: sl(),
      searchBlogUseCase: sl(),
      updateBlogUseCase: sl(),
   )
      ,);

}
