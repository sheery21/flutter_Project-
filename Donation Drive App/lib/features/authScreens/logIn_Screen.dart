import 'package:donation_drive/features/Controllers/logInController.dart';
import 'package:donation_drive/widgets/ButtonsField/loginButtonField.dart';
import 'package:donation_drive/widgets/ColorsField/ColorField.dart';
import 'package:donation_drive/widgets/ForgotPasswordField/forgotPasswordField.dart';
import 'package:donation_drive/widgets/InputField/logIn_InputField.dart';
import 'package:donation_drive/widgets/RememberMeField/rememberMeField.dart';
import 'package:donation_drive/widgets/TextStyleField/headingField.dart';
import 'package:donation_drive/widgets/TextStyleField/textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Logincontroller controller = Get.put(Logincontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Container(
            decoration: BoxDecoration(color: Color(0xFFF8F9FA)),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/ContainerLogin.png"),
                SizedBox(height: 20),
                Text("Welcome Back", style: TextStyleField.Heading_1()),
                SizedBox(height: 8),
                Text(
                  "Sign in to access your admin dashboard",
                  style: ShortTextField.mainShortText_1(),
                ),
                SizedBox(height: 25),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(22),
                    child: Column(
                      children: [
                        LoginInputfield.AdminEmail(
                          controller: controller.emailController,
                          labeltext: "Email Address",
                          text: "admin@example.com",
                          tohide: false,
                        ),

                        SizedBox(height: 20),

                        Obx(
                          () => LoginInputfield.AdminPassword(
                            controller: controller.passwordController,
                            text: "Enter your password",
                            labeltext: "Password",
                            tohide: controller.isHidden.value,
                            onToggle: controller.togglePassword,
                          ),
                        ),

                        SizedBox(height: 10),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => Remembermefield.build(
                                value: controller.isRemember.value,
                                onChanged: controller.toggleRemember,
                              ),
                            ),
                            Forgotpasswordfield.build(
                              onTap: () {
                                print("Forgot Password");
                              },
                            ),
                          ],
                        ),

                        SizedBox(height: 20),

                        Obx(
                          () => Buttonsfield.Loginbuttonfield(
                            text: controller.isLoading.value
                                ? "Loading..."
                                : "Sign In",
                            onPressed: controller.isLoading.value
                                ? () {} // 👈 NULL nahi de sakte agar VoidCallback required hai
                                : () {
                                    controller.login();
                                  },
                          ),
                        ),

                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
