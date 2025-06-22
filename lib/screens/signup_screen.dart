import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_new_app/cubit/user_cubit.dart';
import 'package:my_new_app/cubit/user_state.dart';
import 'package:my_new_app/widgets/already_have_anaccount.dart';
import 'package:my_new_app/widgets/custem_form_button.dart';
import 'package:my_new_app/widgets/custem_input_field.dart';
import 'package:my_new_app/widgets/page_header.dart';
import 'package:my_new_app/widgets/page_heading.dart';
import 'package:my_new_app/widgets/pick_image.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is SignUpFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errMessage)));
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xffEEF1F3),
            body: SingleChildScrollView(
              child: Form(
                key: context.read<UserCubit>().signUpFormKey,
                child: Column(
                  children: [
                    const PageHeader(),
                    const PageHeading(title: 'Sign-up'),

                    const PickImageWidget(),
                    const SizedBox(height: 16),

                    CustomInputField(
                      labelText: 'Name',
                      hintText: 'Your name',
                      isDense: true,
                      controller: context.read<UserCubit>().signUpName,
                    ),
                    const SizedBox(height: 16),

                    CustomInputField(
                      labelText: 'Email',
                      hintText: 'Your email',
                      isDense: true,
                      controller: context.read<UserCubit>().signUpEmail,
                    ),
                    const SizedBox(height: 16),

                    CustomInputField(
                      labelText: 'Phone number',
                      hintText: 'Your phone number ex:01234567890',
                      isDense: true,
                      controller: context.read<UserCubit>().signUpPhoneNumber,
                    ),
                    const SizedBox(height: 16),

                    CustomInputField(
                      labelText: 'Password',
                      hintText: 'Your password',
                      isDense: true,
                      obscureText: true,
                      suffixIcon: true,
                      controller: context.read<UserCubit>().signUpPassword,
                    ),

                    CustomInputField(
                      labelText: 'Confirm Password',
                      hintText: 'Confirm Your password',
                      isDense: true,
                      obscureText: true,
                      suffixIcon: true,
                      controller: context.read<UserCubit>().confirmPassword,
                    ),
                    const SizedBox(height: 22),

                    state is SignUpLoading
                        ? const CircularProgressIndicator()
                        : CustomFormButton(
                          innerText: 'Signup',
                          onPressed: () {
                            context.read<UserCubit>().signUp();
                          },
                        ),
                    const SizedBox(height: 18),

                    const AlreadyHaveAnAccountWidget(),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
