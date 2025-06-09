import 'package:blog_app/core/constant/assetsHelper.dart';
import 'package:blog_app/core/constant/dimensionHelper.dart';
import 'package:blog_app/core/constant/fontsHelper.dart';
import 'package:blog_app/core/constant/helper_funcction.dart';
import 'package:blog_app/core/constant/stringHelper.dart';
import 'package:blog_app/core/constant/validation.dart';
import 'package:blog_app/core/utils/utility.dart';
import 'package:blog_app/features/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:blog_app/features/presentation/widgets/custom_button.dart';
import 'package:blog_app/features/presentation/widgets/custom_text.dart';
import 'package:blog_app/features/presentation/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final formkey = GlobalKey<FormState>();
  late TextEditingController nameCon;
  late TextEditingController email;
  late TextEditingController phone;
  @override
  void initState() {
    super.initState();
    nameCon = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    context.read<UserBloc>().add(GetUserEvent());
  }
  @override
  void dispose() {
    super.dispose();
    nameCon.clear();
    phone.clear();
    email.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: DimensionHelper.dimens_20.h,),
              Container(
                height: AHelperFunction.screenSize(context).height *.4,
                width: DimensionHelper.dimens_all.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                      image: AssetImage(AssetsHelper.boy2)),
                  borderRadius: BorderRadius.circular(DimensionHelper.dimens_80.sp),
                  color: Colors.green
                ),
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: DimensionHelper.dimens_30.w,
                        vertical: DimensionHelper.dimens_40.h),
                    child:BlocBuilder<UserBloc,UserState>(
  builder: (context, state) {
    if(state is UserErrorState){
      Utils().toastMessage(state.error.toString());
    }
    if(state is GetUserState){
      final data = state.entity;
      return Column(
        children: [
          Row(
            children: [
              CustomText(
                text: "UserName",
                fontsize: FontHelper.font_34,
                color: Colors.white,
                spacingLetter: 2,
              ),
              SizedBox(width: DimensionHelper.dimens_100.w,),
              CustomText(
                text: data.name.toString(),
                fontFamily: GoogleFonts.calistoga().fontFamily,
                fontsize: FontHelper.font_30,
                color: Colors.white,
                spacingLetter: 2,
              )
            ],
          ),
          SizedBox(height: DimensionHelper.dimens_30.h,),
          Row(
            children: [
              CustomText(
                text: "Email-Address",
                fontsize: FontHelper.font_26,
                color: Colors.white,
                spacingLetter: 2,
              ),
              SizedBox(width: DimensionHelper.dimens_20.w,),
              CustomText(
                text: data.email.toString(),
                fontFamily: GoogleFonts.calistoga().fontFamily,
                fontsize: FontHelper.font_26,
                color: Colors.white,
                spacingLetter: 2,
              )
            ],
          ),
          SizedBox(height: DimensionHelper.dimens_30.h,),
          Row(
            children: [
              CustomText(
                text: "Phone-Number",
                fontsize: FontHelper.font_24,
                color: Colors.white,
                spacingLetter: 2,
              ),
              SizedBox(width: DimensionHelper.dimens_40.w,),
              CustomText(
                text: "+91 ${data.phone}",
                fontFamily: GoogleFonts.calistoga().fontFamily,
                fontsize: FontHelper.font_28,
                color: Colors.white,
                spacingLetter: 2,
              )
            ],
          ),
          SizedBox(height: DimensionHelper.dimens_30.h,),
          Row(
            children: [
              CustomText(
                text: "Password",
                fontsize: FontHelper.font_28,
                color: Colors.white,
                spacingLetter: 2,
              ),
              SizedBox(width: DimensionHelper.dimens_40.w,),
              CustomText(
                //text: data.password.toString(),
                text: "XXXXXX${data.password.substring(2)}",
                fontFamily: GoogleFonts.calistoga().fontFamily,
                fontsize: FontHelper.font_28,
                color: Colors.white,
                spacingLetter: 2,
              )
            ],
          ),
          SizedBox(height: DimensionHelper.dimens_80.h,),
          CustomButton(
            callback: () {
              customUpdateAlert(formKey: formkey, context: context, nameCon: nameCon, email: email, phone: phone, editCallback: () {

              },);
            },
            height: DimensionHelper.dimens_60.h,
            width: DimensionHelper.dimens_all,
            text: "Edit",
            cText: false,
          ),
          SizedBox(height: DimensionHelper.dimens_50.h,),

        ],
      );
    }
    return SizedBox();
  },
),
                  ),

                  BlocListener<UserBloc, UserState>(
                    listener: (context, state) {
                      if(state is UserLogOutState){
                        context.go("/signin");
                        Utils().toastMessage("LogOut Completed");
                      }
                      if(state is UserErrorState){
                        Utils().toastMessage(state.error.toString());
                      }
                    },
                    child: CustomButton(
                      callback: () {
                        context.read<UserBloc>().add(UserLogOutEvent());
                      },
                      height: DimensionHelper.dimens_60.h,
                      width: DimensionHelper.dimens_all,
                      text: "LogOut",
                      color: Colors.red,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
Future<void>customUpdateAlert({
  required  GlobalKey<FormState> formKey,
  required BuildContext context,
  required TextEditingController nameCon,
  required TextEditingController email,
  required TextEditingController phone,
  required VoidCallback editCallback
})async{
  return showDialog(context: context, builder: (context) {
    return AlertDialog(
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextfield(
              validatore: (value) {
                return AValidator.validateEmptyText("Name", value);
              },
              controller: nameCon,
              hintText: StringHelper.eName,
              inputType: TextInputType.name,
              preIcon: Icons.person,
            ),
            SizedBox(height: DimensionHelper.dimens_20.h,),
            CustomTextfield(
              validatore: (value) {
                return AValidator.validateEmail(value);
              },
              controller: email,
              hintText: StringHelper.eEmail,
              inputType: TextInputType.emailAddress,
              preIcon: Icons.email,
            ),
            SizedBox(height: DimensionHelper.dimens_20.h,),
            CustomTextfield(
              validatore: (value) {
                return AValidator.validatePhoneNumber(value);
              },
              controller: phone,
              hintText: StringHelper.ePNumber,
              inputType: TextInputType.phone,
              preIcon: Icons.phone,
              prefixText: "+91 ",
              maxLength: 10,
            ),
            SizedBox(height: DimensionHelper.dimens_30.h,),
            Row(
              children: [
                Expanded(
                   flex: 5,
                  child: CustomButton(
                    text: "Update",
                    cText: false,
                    height: DimensionHelper.dimens_60,
                    callback: editCallback,
                  ),
                ),
                SizedBox(width: DimensionHelper.dimens_20.w,),
                Expanded(
                  flex: 5,
                  child: CustomButton(

                    text: "Cancel",
                    cText: false,
                    height: DimensionHelper.dimens_60,
                    callback: () {
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.grey,
      title: Text("Edit UserDetails",style: TextStyle(
        color: Colors.black,
         fontFamily: GoogleFonts.calistoga().fontFamily,
        fontSize: FontHelper.font_32,
      ),),

    );
  },);
}