import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/colors.dart';
import 'package:food/core/widght/Button.dart';
import 'package:food/core/widght/TexFormField.dart';
import 'package:food/core/widght/title.dart';
import 'package:food/features/Login/persentation/Views/Login.dart';
import 'package:food/features/SignUp/data/Model/authModel.dart';

import 'package:food/features/SignUp/domain/signUpRepoImpl.dart';
import 'package:food/features/SignUp/persentation/controller/signup_cubit.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  static String SignUpid = 'SignUp';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  late GlobalKey<FormState> formKey2;
  TextEditingController userName = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController confirmPassword = TextEditingController();
  @override
  void initState() {
    formKey2 = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(SignInRepoImpl()),
      child: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state is SignupSucess) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Login(),
                ));
          }
          if (state is SignupFail) {
            final snackBar = SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: (AppColors.secondary),
              action: SnackBarAction(
                label: 'dismiss',
                onPressed: () {},
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.white,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),
                      const PageTitle(
                        title: 'Create an',
                      ),
                      const PageTitle(
                        title: 'Account',
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Form(
                        key: formKey2,
                        child: Column(
                          children: [
                            textFormFieldWidghtWithIcon(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return ' Field can not be empty';
                                }
                                return null;
                              },
                              controller: userName,
                              onSaved: (String? val) {
                                userName.text = val!;
                              },
                              HintText: 'Email',
                              prefix: const Icon(Icons.person),
                              obscureText: false,
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            textFormFieldWidghtWithIcon(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return ' Field can not be empty';
                                }
                                return null;
                              },
                              controller: password,
                              onSaved: (String? val) {
                                password.text = val!;
                              },
                              HintText: 'Password',
                              prefix: const Icon(Icons.lock),
                              suffix: BlocProvider.of<SignupCubit>(context)
                                      .isPasswordSeen
                                  ? IconButton(
                                      onPressed: () {
                                        BlocProvider.of<SignupCubit>(context)
                                            .showPassWord();
                                      },
                                      icon: const Icon(Icons.visibility_off),
                                    )
                                  : IconButton(
                                      onPressed: () {
                                        BlocProvider.of<SignupCubit>(context)
                                            .showPassWord();
                                      },
                                      icon: const Icon(
                                        Icons.remove_red_eye_outlined,
                                      )),
                              obscureText: BlocProvider.of<SignupCubit>(context)
                                  .isPasswordSeen,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      state is SignIupLoading
                          ? const Center(child: CircularProgressIndicator())
                          : CustomButton(
                              onTap: () {
                                if (formKey2.currentState!.validate()) {
                                  AuthModel signUp = AuthModel(
                                      email: userName.text,
                                      password: password.text);
                                  BlocProvider.of<SignupCubit>(context)
                                      .sigIup(signUp: signUp);
                                }
                              },
                              backGroundcolor: AppColors.primary,
                              widget: Center(
                                child: Text('Create Account',
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w600)),
                              ),
                              height: 60,
                              width: double.infinity,
                            ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'I Already Have an Account',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 14),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return Login();
                                  },
                                ));
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.secondary),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
