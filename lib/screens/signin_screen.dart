import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_new_app/cubit/user_cubit.dart';
import 'package:my_new_app/cubit/user_state.dart';
import 'package:my_new_app/screens/profile_screen.dart';
import 'package:my_new_app/widgets/custem_form_button.dart';
import 'package:my_new_app/widgets/custem_input_field.dart';
import 'package:my_new_app/widgets/dont_have_anacount.dart';
import 'package:my_new_app/widgets/forget_pass.dart';
import 'package:my_new_app/widgets/page_header.dart';
import 'package:my_new_app/widgets/page_heading.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is SignInSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("success")));
            context.read<UserCubit>().getUserProfile();
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
          } else if (state is SignInFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errMessage)));
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xffEEF1F3),
            body: Column(
              children: [
                const PageHeader(),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    child: SingleChildScrollView(
                      child: Form(
                        key: context.read<UserCubit>().signInFormKey,
                        child: Column(
                          children: [
                            const PageHeading(title: 'Sign-in'),

                            CustomInputField(
                              labelText: 'Email',
                              hintText: 'Your email',
                              controller: context.read<UserCubit>().signInEmail,
                            ),
                            const SizedBox(height: 16),

                            CustomInputField(
                              labelText: 'Password',
                              hintText: 'Your password',
                              obscureText: true,
                              suffixIcon: true,
                              controller: context.read<UserCubit>().signInPassword,
                            ),
                            const SizedBox(height: 16),

                            ForgetPasswordWidget(size: size),
                            const SizedBox(height: 20),

                            state is SignInLoading
                                ? const CircularProgressIndicator()
                                : CustomFormButton(
                                  innerText: 'Sign In',
                                  onPressed: () {
                                    context.read<UserCubit>().signIn();
                                  },
                                ),
                            const SizedBox(height: 18),

                            DontHaveAnAccountWidget(size: size),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
