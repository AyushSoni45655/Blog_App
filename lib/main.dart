import 'package:blog_app/features/presentation/blocs/blogs/blog_bloc.dart';
import 'package:blog_app/features/presentation/blocs/nav_bloc/navigation_bloc.dart';
import 'package:blog_app/features/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:blog_app/features/presentation/screens/auths/signin.dart';
import 'package:blog_app/features/presentation/screens/auths/signup.dart';
import 'package:blog_app/features/presentation/screens/splashes/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/constant/firebase_option.dart';
import 'core/constant/routes.dart';
import 'core/theme/theme.dart';
import 'features/presentation/blocs/toggle/toggle_bloc.dart';
import 'getit_dependency.dart';

void main() async{
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
   SharedPreferences sh = await SharedPreferences.getInstance();
   bool isFirst =  sh.getBool("isFirstTime")??true;
  await Firebase.initializeApp(
      options: optionss
  );
  setUpLocator();
  runApp( MultiBlocProvider(providers: [
    BlocProvider(create: (context) => GetIt.I<ToggleBloc>(),),
     BlocProvider(create: (context) => GetIt.I<NavigationBloc>(),),
     BlocProvider(create: (context) => GetIt.I<UserBloc>(),),
    BlocProvider(create: (context) => GetIt.I<BlogBloc>(),)
  ], child: MyApp(isfirst: isFirst,)));
}

class MyApp extends StatelessWidget {
  bool isfirst;
   MyApp({super.key
    , required this.isfirst
    });


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router
          (
          builder: (context, child) {
            return ResponsiveWrapper.builder(
              BouncingScrollWrapper.builder(context, child!),  // Ensure the child is non-null
              maxWidth: 1280,
              minWidth: 640,
              defaultScale: true,
              breakpoints: [
                ResponsiveBreakpoint.resize(640, name: 'SM'),
                ResponsiveBreakpoint.autoScale(768, name: 'MD'),
                ResponsiveBreakpoint.autoScale(1024, name: 'LG'),
                ResponsiveBreakpoint.autoScale(1280, name: 'XL'),
              ],
            );
          },
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          darkTheme: AAppTheme.darkTheme,
          theme: AAppTheme.lightTheme,
          themeMode: ThemeMode.dark,
         routerConfig: goRouter(isFirst: isfirst),
          //home: NavigationScreen(),
          //home:AccountScreen(),
              //isFirst: isfirst


        );

      },
    );
  }
}