import 'package:blog_app/core/constant/assetsHelper.dart';
import 'package:blog_app/core/constant/dimensionHelper.dart';
import 'package:blog_app/core/utils/utility.dart';
import 'package:blog_app/features/presentation/blocs/blogs/blog_bloc.dart';
import 'package:blog_app/features/presentation/widgets/custom_appbar.dart';
import 'package:blog_app/features/presentation/widgets/custom_blog.dart';
import 'package:blog_app/features/presentation/widgets/custom_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constant/sharedpreference_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SharedPreferenceHelper sh = SharedPreferenceHelper();
  late TextEditingController datCon;
  late TextEditingController timeCon;
  String? name, email;

  getSharedPref() async {
    name = await sh.getUserNames();
    email = await sh.getUserEmails();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    context.read<BlogBloc>().add(GetBlogEvent());
    datCon = TextEditingController();
    timeCon = TextEditingController();
    getSharedPref();
  }

  @override
  void dispose() {
    super.dispose();
    datCon.clear();
    timeCon.clear();
  }

  @override
  Widget build(BuildContext context) {
    print('Name is a $name: and email is a $email');
    return Scaffold(
      appBar: CustomAppBar(
          isBio: true,
          email: email.toString(),
          name: name,
              () {
            print('Hello');
          }, AssetsHelper.boy2),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: DimensionHelper.dimens_20,
              vertical: DimensionHelper.dimens_20,
            ),
            child: BlocBuilder<BlogBloc,BlogState>(
              builder: (context, state) {
                if(state is BlogLoading){
                return Center(child: SpinKitFadingCircle(color: Colors.green,size: 50,),);
                }
                if(state is BlogError){
                  Utils().toastMessage(state.error.toString());
                }
                if(state is BlogGetState){
                  return CustomListView(
                    itemCount: state.entity.length,
                    itemBuilder: (context, index) {
                      final data = state.entity[index];
                      return CustomBlog(
                        title: data.title.toString(),
                        callback: () {
                          context.go("/details",extra: data);
                        },
                        time: data.time.toString(),
                        date: data.date.toString(),
                        image: data.image.toString(),
                      );
                    },
                  );
                }
                return SizedBox();
              },
            )
        ),
      ),
    );
  }
}

