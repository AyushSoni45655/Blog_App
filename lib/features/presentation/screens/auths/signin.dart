import 'package:blog_app/core/constant/dimensionHelper.dart';
import 'package:blog_app/core/constant/fontsHelper.dart';
import 'package:blog_app/core/constant/helper_funcction.dart';
import 'package:blog_app/core/constant/stringHelper.dart';
import 'package:blog_app/core/constant/validation.dart';
import 'package:blog_app/core/utils/utility.dart';
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

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController emailCon;
  late TextEditingController passCon;
  @override
  void initState() {
    super.initState();
    emailCon = TextEditingController();
    passCon = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    passCon.clear();
    emailCon.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: DimensionHelper.dimens_40.sp,
              vertical: DimensionHelper.dimens_20.sp,
            ),
            child: Column(
              children: [
                SizedBox(height: DimensionHelper.dimens_30.h),
                CustomText(
                  alignment: Alignment.centerLeft,
                  text: StringHelper.hello,
                  spacingLetter: 4,
                  fontsize: FontHelper.font_50,
                  fontFamily: GoogleFonts.galindo().fontFamily,
                ),
                CustomText(
                  alignment: Alignment.centerLeft,
                  text: StringHelper.sInNow,
                  spacingLetter: 4,
                  fontsize: FontHelper.font_60,
                  fontFamily: GoogleFonts.germaniaOne().fontFamily,
                ),
                SizedBox(height: DimensionHelper.dimens_40.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomText(
                      alignment: Alignment.centerLeft,
                      text: StringHelper.nUser,
                      spacingLetter: 2,
                      fontsize: FontHelper.font_50,
                      fontFamily: GoogleFonts.oleoScriptSwashCaps().fontFamily,
                    ),
                    CustomButton(
                      callback: () {
                        context.go("/signup");
                      },
                      height: DimensionHelper.dimens_60.h,
                      width: DimensionHelper.dimens_180.w,
                      cText: false,
                      text: StringHelper.signUp,
                    ),
                  ],
                ),
                SizedBox(
                  height: AHelperFunction.screenSize(context).height * .15,
                ),
                BlocConsumer<UserBloc, UserState>(
                  listener: (context, state) {
                    if (state is UserErrorState) {
                      Utils().toastMessage(state.error.toString());
                    }
                    if (state is UserSuccessState) {
                      context.go("/nav");
                      Utils().toastMessage(
                        "SignIn ( Login ) Completed Successfully....",
                      );

                    }
                  },
                  builder: (context, state) {
                    return Form(
                      key: formKey,
                      child: Column(
                        children: [
                          CustomTextfield(
                            controller: emailCon,
                            hintText: StringHelper.eName,
                            validatore: (value) {
                              return AValidator.validateEmail(value);
                            },
                            preIcon: Icons.mail,
                            inputType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: DimensionHelper.dimens_60.h),
                          BlocBuilder<ToggleBloc, ToggleState>(
                            builder: (context, state) {
                              if (state is ToggleButtonSate) {
                                return CustomTextfield(
                                  preIcon: Icons.password,
                                  hide: state.isToggle,
                                  controller: passCon,
                                  hintText: StringHelper.ePass,
                                  validatore: (value) {
                                    return AValidator.validatePassword(value);
                                  },
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      context.read<ToggleBloc>().add(
                                        ToggleButtonEvent(),
                                      );
                                    },
                                    icon: Icon(
                                      state.isToggle
                                          ? Iconsax.eye_slash
                                          : Iconsax.eye,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                  ),
                                  inputType: TextInputType.emailAddress,
                                );
                              }
                              return SizedBox();
                            },
                          ),
                          SizedBox(
                            height:
                                AHelperFunction.screenSize(context).height *
                                .08,
                          ),
                          state is UserLoadingState
                              ? Center(
                                child: SpinKitFadingCircle(
                                  color: Colors.green,
                                  size: 40,
                                ),
                              )
                              : CustomButton(
                                color: Colors.lightBlue,
                                text: StringHelper.login,
                                callback: () {
                                  if (formKey.currentState!.validate()) {
                                    context.read<UserBloc>().add(
                                      UserSignInEvent(
                                        email: emailCon.text.trim(),
                                        password: passCon.text.toString(),
                                      ),
                                    );
                                  }
                                },
                                height: DimensionHelper.dimens_60.h,
                                width: DimensionHelper.dimens_300.w,
                                isIcon: true,
                              ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
