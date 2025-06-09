import 'package:blog_app/features/presentation/blocs/nav_bloc/navigation_bloc.dart';
import 'package:blog_app/features/presentation/screens/navigations/nav_screen/account.dart';
import 'package:blog_app/features/presentation/screens/navigations/nav_screen/add.dart';
import 'package:blog_app/features/presentation/screens/navigations/nav_screen/home.dart';
import 'package:blog_app/features/presentation/screens/navigations/nav_screen/notification.dart';
import 'package:blog_app/features/presentation/screens/navigations/nav_screen/search.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationScreen extends StatelessWidget {
   NavigationScreen({super.key});
   final int index = 0;
final List<Widget> screens = [
  HomeScreen(),
  SearchScreen(),
  AddScreen(),
  NotificationScreen(),
  AccountScreen()
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationBloc,NavigationState>(builder: (context, state) {
        int index = 0;
        if(state is NavigationButtonState){
          index = state.cIndex;
        }
        return screens[index];
      },),
      bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationState>(
  builder: (context, state) {
    int cIndex = 0;
    if(state is NavigationButtonState){
      cIndex = state.cIndex;
    }
    return CurvedNavigationBar(
        onTap: (value) {
          context.read<NavigationBloc>().add(NavigationButtonEvent(index: value));
        },
        index: cIndex,
         animationCurve: Curves.easeInCubic,
         animationDuration: Duration(milliseconds: 200),
         color: Colors.white,
          backgroundColor: Colors.black,
          items: [
            Icon(Icons.home_outlined,size: 60,color: Colors.black,),
            Icon(Icons.search_outlined,size: 60,color: Colors.black,),
            Icon(Icons.add_circle_outline_sharp,size: 60,color: Colors.black,),
            Icon(Icons.notifications_outlined,size: 60,color: Colors.black,),
            Icon(Icons.account_circle_outlined,size: 60,color: Colors.black,),
      ]);
  },
)
    );
  }
}
