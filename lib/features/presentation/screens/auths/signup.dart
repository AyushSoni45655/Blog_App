import 'package:blog_app/core/constant/dimensionHelper.dart';
import 'package:blog_app/core/constant/fontsHelper.dart';
import 'package:blog_app/core/constant/helper_funcction.dart';
import 'package:blog_app/core/constant/stringHelper.dart';
import 'package:blog_app/core/constant/validation.dart';
import 'package:blog_app/core/utils/utility.dart';
import 'package:blog_app/features/data/entity_modal/user_entity_modal.dart';
import 'package:blog_app/features/presentation/blocs/toggle/toggle_bloc.dart';
import 'package:blog_app/features/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:blog_app/features/presentation/widgets/custom_button.dart';
import 'package:blog_app/features/presentation/widgets/custom_text.dart';
import 'package:blog_app/features/presentation/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController emailCon;
  late TextEditingController passCon;
  late TextEditingController nameCon;
  late TextEditingController phoneCon;
  @override
  void initState() {
    super.initState();
    emailCon = TextEditingController();
    passCon = TextEditingController();
    nameCon = TextEditingController();
    phoneCon = TextEditingController();
  }
  @override
  void dispose() {
    super.dispose();
    passCon.clear();
    emailCon.clear();
    nameCon.clear();
    phoneCon.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: DimensionHelper.dimens_40.sp,vertical: DimensionHelper.dimens_20.sp),
            child: Column(
              children: [
                SizedBox(height: DimensionHelper.dimens_30.h,),
                CustomText(
                  alignment: Alignment.centerLeft,
                  text: StringHelper.hello,
                  spacingLetter: 4,
                  fontsize: FontHelper.font_50,
                  fontFamily: GoogleFonts.galindo().fontFamily,
                ),
                CustomText(
                  alignment: Alignment.centerLeft,
                  text: StringHelper.sUpNow,
                  spacingLetter: 4,
                  fontsize: FontHelper.font_60,
                  fontFamily: GoogleFonts.germaniaOne().fontFamily,
                ),
                SizedBox(height: DimensionHelper.dimens_40.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomText(
                      alignment: Alignment.centerLeft,
                      text: StringHelper.aHAAS,
                      spacingLetter: 2,
                      fontsize: FontHelper.font_24,
                      fontFamily: GoogleFonts.oleoScriptSwashCaps().fontFamily,
                    ),
                    CustomButton(
                      callback: () {
                        context.go("/signin");
                      },
                      height: DimensionHelper.dimens_60.h,
                      width: DimensionHelper.dimens_170.w,
                      cText: false,
                      text: StringHelper.login,
                    )
                  ],
                ),
                SizedBox(height:  AHelperFunction.screenSize(context).height * .15,),
                BlocConsumer<UserBloc, UserState>(
  listener: (context, state) {
    if(state is UserErrorState){
      Utils().toastMessage(state.error.toString());
    }
    if(state is UserSuccessState){
      context.go("/nav");
      Utils().toastMessage("SignUp Completed Successfully....");

    }
  },
  builder: (context, state) {
    return Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CustomTextfield(
                          controller: nameCon,
                          hintText: StringHelper.eName,
                          validatore: (value) {
                            return AValidator.validateEmptyText("Name", value);
                          },
                          preIcon: Icons.person,
                          inputType: TextInputType.name,
                        ),
                        SizedBox(height: DimensionHelper.dimens_60.h,),
                        CustomTextfield(
                          controller: emailCon,
                          hintText: StringHelper.eEmail,
                          validatore: (value) {
                            return AValidator.validateEmail(value);
                          },
                          preIcon: Icons.mail,
                          inputType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: DimensionHelper.dimens_60.h,),
                        BlocBuilder<ToggleBloc,ToggleState>(
                          builder: (context, state) {
                            if(state is ToggleButtonSate){
                              return CustomTextfield(
                                preIcon: Icons.password,
                                hide: state.isToggle,
                                controller: passCon,
                                hintText: StringHelper.ePass,
                                validatore: (value) {
                                  return AValidator.validatePassword(value);
                                },
                                suffixIcon:IconButton(onPressed: (){
                                  context.read<ToggleBloc>().add(ToggleButtonEvent());
                                }, icon: Icon(state.isToggle?Iconsax.eye_slash:Iconsax.eye,color: Colors.white,size: 40,)),
                                inputType: TextInputType.emailAddress,
                              );
                            }
                            return SizedBox();
                          },
                        ),
                        SizedBox(height: DimensionHelper.dimens_60.h,),
                        CustomTextfield(
                          maxLength: 10,
                          controller: phoneCon,
                          hintText: StringHelper.ePNumber,
                          validatore: (value) {
                            return AValidator.validateEmptyText("PhoneNumber", value);
                          },
                          preIcon: Icons.phone,
                            prefixText: "+91 ",
                          inputType: TextInputType.phone
                        ),
                        SizedBox(height:  AHelperFunction.screenSize(context).height * .08,),
                        state is UserLoadingState?Center(child: SpinKitFadingCircle(color: Colors.green,),):CustomButton(
                          color: Colors.lightBlue,
                          text: StringHelper.signUp,
                          callback: () {
                            if(formKey.currentState!.validate()){
                              final entity = UserModel(
                                  id: "",
                                  name: nameCon.text.toString(),
                                  email: emailCon.text.trim(),
                                  password: passCon.text.toString(),
                                  phone: phoneCon.text.toString()
                              );
                              context.read<UserBloc>().add(UserSignUpEvent(entity: entity));
                            }
                          },
                          height: DimensionHelper.dimens_60.h,
                          width: DimensionHelper.dimens_300.w,
                          isIcon: true,
                        )
                      ],
                    ));
  },
)
              ],
            ),),
        ),
      ),
    );
  }
}
