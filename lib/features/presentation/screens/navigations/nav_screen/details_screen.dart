import 'package:blog_app/core/constant/assetsHelper.dart';
import 'package:blog_app/core/constant/dimensionHelper.dart';
import 'package:blog_app/core/constant/fontsHelper.dart';
import 'package:blog_app/core/utils/utility.dart';
import 'package:blog_app/features/domain/entity/blog.dart';
import 'package:blog_app/features/presentation/blocs/blogs/blog_bloc.dart';
import 'package:blog_app/features/presentation/widgets/custom_appbar.dart';
import 'package:blog_app/features/presentation/widgets/custom_button.dart';
import 'package:blog_app/features/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsScreen extends StatefulWidget {
  final BlogEntity entity;
  const DetailsScreen({super.key,required this.entity});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: CustomAppBar(
         isArrow: true,
              (){
        context.go("/nav");
      }, AssetsHelper.boy2),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: DimensionHelper.dimens_20.h,),
            Container(
              width: DimensionHelper.dimens_all,
              height: DimensionHelper.dimens_300.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                    image: NetworkImage(widget.entity.image)),
                color: Colors.yellow,
                 borderRadius: BorderRadius.circular(DimensionHelper.dimens_80.r)
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: DimensionHelper.dimens_30.w,vertical: DimensionHelper.dimens_20.h),
              child: Column(
                children: [
                  CustomText(
                    text: widget.entity.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    fontsize: FontHelper.font_32.sp,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: DimensionHelper.dimens_20.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.date_range_outlined,color: Colors.green,size: 40,),
                          SizedBox(width: DimensionHelper.dimens_10.w,),
                          CustomText(
                            text: widget.entity.date,
                            fontsize: FontHelper.font_28,
                            fontFamily: GoogleFonts.calistoga().fontFamily,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.watch_later_outlined,color: Colors.green,size: 40,),
                          SizedBox(width: DimensionHelper.dimens_10.w,),
                          CustomText(
                            text: widget.entity.time,
                            fontsize: FontHelper.font_28,
                            fontFamily: GoogleFonts.calistoga().fontFamily,
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: DimensionHelper.dimens_20.h,),
                  CustomText(
                    maxLines: 13,
                    fontsize: FontHelper.font_28,
                    color: Colors.grey,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    text: widget.entity.description,
                  ),
                  SizedBox(height: DimensionHelper.dimens_14.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CustomButton(
                            height: DimensionHelper.dimens_60,
                            width: DimensionHelper.dimens_160,
                            color: Colors.grey,
                            text: "Edit",
                            callback: () {
                              context.go("/edit",extra: widget.entity);
                            },
                          ),
                          SizedBox(width: DimensionHelper.dimens_30.w,),
                          BlocListener<BlogBloc,BlogState>(
  listener: (context, state) {
    if(state is BlogError){
      Utils().toastMessage(state.error);
    }
    if(state is DeleteBlogState){
      Utils().toastMessage("Blog Deleted Successfully!!!");
    }
  },
  child: CustomButton(
                            height: DimensionHelper.dimens_60,
                            width: DimensionHelper.dimens_160,
                            color: Colors.grey,
                            text: "Delete",
                            callback: () {
                              context.read<BlogBloc>().add(DeleteBlogEvent(id: widget.entity.id));
                            },
                          ),
),
                        ],
                      ),
                      IconButton(onPressed: (){}, icon: Icon(Icons.share,color: Colors.green,size: DimensionHelper.dimens_60,))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
