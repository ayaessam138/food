import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/Layout.dart';
import 'package:food/core/colors.dart';
import 'package:food/core/widght/Button.dart';
import 'package:food/core/widght/TexFormField.dart';
import 'package:food/core/widght/title.dart';
import 'package:food/features/Login/data/repo/logoinRepoImpl.dart';
import 'package:food/features/Login/persentation/controller/login_cubit.dart';
import 'package:food/features/SignUp/data/Model/authModel.dart';
import 'package:food/features/SignUp/persentation/Views/signUp.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  late GlobalKey<FormState> formKey1;
  @override
  void initState() {
    formKey1 = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(LogoInRepoImpl()),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSucess) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => AppLayout(),
                ));
          }
          if (state is LoginFail) {
            final snackBar = SnackBar(
              content: Text(state.erorrMessage),
              backgroundColor: (AppColors.secondary),
              action: SnackBarAction(
                label: 'dismiss',
                onPressed: () {
                  // Navigator.pop(context);
                },
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
                        title: 'Welcome',
                      ),
                      const PageTitle(
                        title: ' Back!',
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Form(
                        key: formKey1,
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
                              HintText: 'Username or Email',
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
                              suffix: BlocProvider.of<LoginCubit>(context)
                                      .isPasswordSeen
                                  ? IconButton(
                                      onPressed: () {
                                        BlocProvider.of<LoginCubit>(context)
                                            .showPassWord();
                                      },
                                      icon: const Icon(Icons.visibility_off),
                                    )
                                  : IconButton(
                                      onPressed: () {
                                        BlocProvider.of<LoginCubit>(context)
                                            .showPassWord();
                                      },
                                      icon: const Icon(
                                        Icons.remove_red_eye_outlined,
                                      )),
                              obscureText: BlocProvider.of<LoginCubit>(context)
                                  .isPasswordSeen,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: Text('Forget Password?',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.secondary))),
                        ],
                      ),
                      state is LoginLoading
                          ? const Center(child: CircularProgressIndicator())
                          : CustomButton(
                              widget: const Center(
                                child: Text('Login',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600)),
                              ),
                              onTap: () {
                                if (formKey1.currentState!.validate()) {
                                  AuthModel login = AuthModel(
                                      email: userName.text,
                                      password: password.text);
                                  BlocProvider.of<LoginCubit>(context)
                                      .login(signUp: login);
                                }
                              },
                              backGroundcolor: AppColors.primary,
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
                            'Create An Account',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                                fontSize: 16),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return SignUp();
                                },
                              ));
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.secondary),
                            ),
                          )
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
