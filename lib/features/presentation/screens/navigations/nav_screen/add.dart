import 'package:blog_app/core/constant/assetsHelper.dart';
import 'package:blog_app/core/constant/colorsHelper.dart';
import 'package:blog_app/core/constant/dimensionHelper.dart';
import 'package:blog_app/core/constant/helper_funcction.dart';
import 'package:blog_app/core/constant/validation.dart';
import 'package:blog_app/core/utils/utility.dart';
import 'package:blog_app/features/data/entity_modal/blog_modal.dart';
import 'package:blog_app/features/presentation/blocs/blogs/blog_bloc.dart';
import 'package:blog_app/features/presentation/widgets/custom_appbar.dart';
import 'package:blog_app/features/presentation/widgets/custom_button.dart';
import 'package:blog_app/features/presentation/widgets/custom_date&time_picker.dart';
import 'package:blog_app/features/presentation/widgets/custom_textfield.dart';
import 'package:blog_app/features/presentation/widgets/custom_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController titleCon;
  late TextEditingController desCon;
  late TextEditingController imageCon;
  late TextEditingController dateCon;
  late TextEditingController timeCon;
  @override
  void initState() {
    super.initState();
    titleCon = TextEditingController();
    desCon = TextEditingController();
    timeCon = TextEditingController();
    dateCon = TextEditingController();
    imageCon = TextEditingController();
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
        () {},
        AssetsHelper.boy2,
        isProfile: false,
        isArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(DimensionHelper.dimens_30.sp),
          child: BlocConsumer<BlogBloc,BlogState>(
  listener: (context, state) {
   if(state is BlogAddState){
     Utils().toastMessage("Blog Added Successfully...");
   }
   if(state is BlogError){
     Utils().toastMessage(state.error);
   }
  },
  builder: (context, state) {
    return Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: AHelperFunction.screenSize(context).height * .08,
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
                state is BlogLoading?Center(child: SpinKitFadingCircle(color: Colors.green,size: 50,),):CustomButton(
                  height: DimensionHelper.dimens_60.h,
                  width: DimensionHelper.dimens_all,
                  callback: () {
                    if(formKey.currentState!.validate()){
                      if(dateCon.text.isNotEmpty && timeCon.text.isNotEmpty){
                        final entity = BlogModel(
                            id: DateTime.now().millisecondsSinceEpoch.toString(),
                            title: titleCon.text.toString(),
                            description: desCon.text.toString(),
                            image: imageCon.text.toString(),
                            date: dateCon.text.toString(),
                            time: timeCon.text.toString()
                        );
                        context.read<BlogBloc>().add(AddBlogEvent(entity: entity));
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
                  text: "Upload Blog",
                  color: ColorsHelper.nBlue1,
                )
              ],
            ),
          );
  },
),
        ),
      ),
    );
  }
}
