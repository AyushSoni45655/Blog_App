
import 'package:blog_app/features/domain/entity/blog.dart';
import 'package:blog_app/features/presentation/screens/navigations/nav_screen/edit_screen.dart';
import 'package:go_router/go_router.dart';
import '../../features/presentation/screens/auths/signin.dart';
import '../../features/presentation/screens/auths/signup.dart';
import '../../features/presentation/screens/navigations/nav.dart';
import '../../features/presentation/screens/navigations/nav_screen/details_screen.dart';
import '../../features/presentation/screens/splashes/splash.dart';
//required bool isFirst
GoRouter goRouter({required bool isFirst}){
  return GoRouter(
      initialLocation: isFirst? "/":"/nav",
      routes: [
        GoRoute(
          path: '/',
          name: 'splash1',
          builder: (context, state) => SplashScreen(),
        ),
        // GoRoute(
        //   path: '/splash2',
        //   name: 'splash2',
        //   builder: (context, state) => SplashScreen2(),
        // ),
        // GoRoute(
        //   path: '/cal',
        //   name: 'calander',
        //   builder: (context, state) => Calander(),
        // ),
        // // //
        GoRoute(
          path: "/signin",
          name: "login",
          builder: (context, state) => SignInScreen(),
        ),
        // GoRoute(
        //   path: "/fPassword",
        //   name: "fPassword",
        //   builder: (context, state) => ForgotPasswordScreen(),
        // ),
        GoRoute(
          path: "/signup",
          name: "signin",
          builder: (context, state) => SignUpScreen(),
        ),
        GoRoute(
          path: "/nav",
          name: "bottom",
          builder: (context, state) => NavigationScreen(),
        ),
        // GoRoute(
        //   path: "/add",
        //   name: "navPage",
        //   builder: (context, state) => AddPageScreen(),
        // ),
        // // GoRoute(
        // //   path: "/home",
        // //   name: "homescreen",
        // //   builder: (context, state) => HomeScreen(),
        // // ),
        // GoRoute(
        //   path: "/details",
        //   name: "detail",
        //   builder: (context, state) {
        //     final tasks = state.extra as TaskEntity;
        //     return DetailsScreen(entity: tasks,);
        //   },
        // ),
        GoRoute(
          path: "/edit",
          name: "edit_screen",
          builder: (context, state) {
            final foodItem = state.extra as BlogEntity;
            return EditScreen(entity: foodItem,);},
        ),
        // GoRoute(
        //   path: "/setting",
        //   name: "loginPage",
        //   builder: (context, state) => Setting(),
        // ),
        // GoRoute(
        //   path: "/fp",
        //   name: "fPassword",
        //   builder: (context, state) =>ForgotPasswordScreen(),
        // ),
        GoRoute(
          path: "/details",
          name: "dtailsPage",
          builder: (context, state){
            final foodItem = state.extra as BlogEntity;
            return DetailsScreen(entity: foodItem,);
          },
        )
      ]
  );
}


