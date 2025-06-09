import 'package:blog_app/core/constant/assetsHelper.dart';
import 'package:blog_app/core/constant/colorsHelper.dart';
import 'package:blog_app/core/constant/dimensionHelper.dart';
import 'package:blog_app/core/constant/fontsHelper.dart';
import 'package:blog_app/core/constant/helper_funcction.dart';
import 'package:blog_app/core/constant/validation.dart';
import 'package:blog_app/core/utils/utility.dart';
import 'package:blog_app/features/data/entity_modal/blog_modal.dart';
import 'package:blog_app/features/domain/entity/blog.dart';
import 'package:blog_app/features/presentation/blocs/blogs/blog_bloc.dart';
import 'package:blog_app/features/presentation/widgets/custom_appbar.dart';
import 'package:blog_app/features/presentation/widgets/custom_button.dart';
import 'package:blog_app/features/presentation/widgets/custom_date&time_picker.dart';
import 'package:blog_app/features/presentation/widgets/custom_text.dart';
import 'package:blog_app/features/presentation/widgets/custom_textfield.dart';
import 'package:blog_app/features/presentation/widgets/custom_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class EditScreen extends StatefulWidget {
  final BlogEntity entity;
  const EditScreen({super.key,required this.entity});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController titleCon;
  late TextEditingController desCon;
  late TextEditingController imageCon;
  late TextEditingController dateCon;
  late TextEditingController timeCon;
  @override
  void initState() {
    super.initState();
    titleCon = TextEditingController(text: widget.entity.title);
    desCon = TextEditingController(text: widget.entity.description);
    timeCon = TextEditingController(text: widget.entity.time);
    dateCon = TextEditingController(text: widget.entity.date);
    imageCon = TextEditingController(text: widget.entity.image);
  }

  @override
  void dispose() {
    super.dispose();
    timeCon.dispose();
    dateCon.dispose();
    desCon.dispose();
    titleCon.dispose();
    imageCon.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
            () {
              context.go("/nav");
            },
        AssetsHelper.boy2,
        isProfile: false,
        isArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(DimensionHelper.dimens_30.sp),
          child: BlocConsumer<BlogBloc,BlogState>(
  listener: (context, state) {
    if(state is BlogError){
      Utils().toastMessage(state.error.toString());
    }
    if(state is UpdateBlogState){
      Utils().toastMessage("Blog Updated Successfully!!!");
    }
  },
  builder: (context, state) {
    return Form(
            key: formKey,
            child: Column(
              children: [
                CustomText(
                  text: "Update Your Details Here..",
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontsize: FontHelper.font_38,
                  fontFamily: GoogleFonts.oswald().fontFamily,
                ),
                SizedBox(
                  height: AHelperFunction.screenSize(context).height * .06,
                ),
                CustomTextfield(
                  controller: imageCon,
                  validatore: (value) {
                    return AValidator.validateEmptyText("Image", value);
                  },
                  inputType: TextInputType.text,
                  hintText: "Enter Image URL..",
                  preIcon: Icons.image,
                ),
                SizedBox(height: DimensionHelper.dimens_50.h),
                CustomTextfield(
                  controller: titleCon,
                  validatore: (value) {
                    return AValidator.validateEmptyText("Title", value);
                  },
                  inputType: TextInputType.text,
                  hintText: "Enter Your Title",
                  preIcon: Icons.title,
                ),
                SizedBox(height: DimensionHelper.dimens_60.h),
                Row(
                  children: [
                    Expanded(child: CustomTime(controller: timeCon, hintText: "Enter Time...")),
                    SizedBox(width: DimensionHelper.dimens_30.w),
                    Expanded(child: CustomDateSelector(controller: dateCon, hintText: "Enter Date...")),
                  ],
                ),
                SizedBox(height: DimensionHelper.dimens_60.h),
                CustomTextfield(
                  controller: desCon,
                  validatore: (value) {
                    return AValidator.validateEmptyText("Description", value);
                  },
                  preIcon: Icons.description,
                  hintText: "Enter Description",
                  inputType: TextInputType.text,
                ),
                SizedBox(height: DimensionHelper.dimens_100.h),
               state is BlogLoading?Center(child: SpinKitFadingCircle(color: Colors.green,size: 50,),): CustomButton(
                  height: DimensionHelper.dimens_60.h,
                  width: DimensionHelper.dimens_all,
                  callback: () {
                    if(formKey.currentState!.validate()){
                      if(dateCon.text.isNotEmpty && timeCon.text.isNotEmpty){
                        final entity = BlogModel(
                            id: widget.entity.id,
                            title: titleCon.text.toString(),
                            description: desCon.text.toString(),
                            image: imageCon.text.toString(),
                            date: dateCon.text.toString(),
                            time: timeCon.text.toString()
                        );
                        context.read<BlogBloc>().add(UpdateBlogEvent(entity: entity));
                      }else{
                        if(dateCon.text.isEmpty){
                          Utils().toastMessage("Enter Date");
                        }
                        if(timeCon.text.isEmpty){
                          Utils().toastMessage("Enter Time");
                        }
                      }

                    }
                  },
                  text: "Update Blog",
                  color: ColorsHelper.nBlue1,
                )
              ],
            ),
          );
  },
)
        ),
      ),
    );
  }
}
