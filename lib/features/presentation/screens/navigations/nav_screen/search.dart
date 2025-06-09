import 'package:blog_app/core/constant/dimensionHelper.dart';
import 'package:blog_app/core/constant/fontsHelper.dart';
import 'package:blog_app/core/constant/stringHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/utility.dart';
import '../../../blocs/blogs/blog_bloc.dart';
import '../../../widgets/custom_blog.dart';
import '../../../widgets/custom_listview.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController searchCon;
  @override
  void initState() {
    super.initState();
    searchCon = TextEditingController();
    context.read<BlogBloc>().add(SearchBlogEvent(title: searchCon.text.trim()));
  }
  @override
  void dispose() {
    super.dispose();
    searchCon.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: DimensionHelper.dimens_30,vertical: DimensionHelper.dimens_50.h),
          child: Column(
          children: [
                                                        // SEARCH BOX HERE
            Container(
              padding: EdgeInsets.symmetric(horizontal: DimensionHelper.dimens_20.w,vertical: DimensionHelper.dimens_10.h),
              height: DimensionHelper.dimens_70.h,
              width: DimensionHelper.dimens_all.w,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.yellow,width: 3),
                borderRadius: BorderRadius.circular(DimensionHelper.dimens_30.r),
              ),
              child: TextFormField(
                onChanged: (value) {
                  context.read<BlogBloc>().add(SearchBlogEvent(title: value.toString()));

                },
                controller: searchCon,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: FontHelper.font_26
                ),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  prefixIcon: Icon(Icons.search_sharp,size: DimensionHelper.dimens_50.sp,color: Colors.green,),
                  hintText: StringHelper.sBlog,
                  border: OutlineInputBorder( borderSide: BorderSide.none),
                  hintStyle: TextStyle(
                    fontSize: FontHelper.font_30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  )
                ),
              ),
            ),
                                                       // BLOGS ITEMS HERE

            BlocBuilder<BlogBloc,BlogState>(
              builder: (context, state) {
                if(state is BlogLoading){
                  return Center(child: SpinKitFadingCircle(color: Colors.green,size: 50,),);
                }
                if(state is BlogError){
                  Utils().toastMessage(state.error.toString());
                }
                if(state is SearchBlogState){
                  return CustomListView(
                    itemCount: state.entity.length,
                    itemBuilder: (context, index) {
                      final data = state.entity[index];
                      return CustomBlog(
                        title: data.title.toString(),
                        callback: () {
                          context.go("/details");
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

          ],
        ),),
      ),
    );
  }
}
