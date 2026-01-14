import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_20_start/providers/user_Provider.dart';
import 'package:flutter_20_start/services/auth_service.dart';
import 'package:flutter_20_start/services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_20_start/widgets/ButtonField/butttonField.dart';
import 'package:flutter_20_start/widgets/ColorsField/colorsField.dart';
import 'package:flutter_20_start/widgets/InputField/inputField.dart';
import 'package:flutter_20_start/widgets/TextStyleField/TextStyleField.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class SignupScreens extends StatefulWidget {
  const SignupScreens({super.key});

  @override
  State<SignupScreens> createState() => _SignupScreensState();
}

class _SignupScreensState extends State<SignupScreens> {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController ConPassController = TextEditingController();

  String nametext = "Your name";
  String lastNametext = "Your last name";
  String emailtext = "Your email";
  String addresstext = "Your address";
  String passText = "Password";
  String phoneNumber = "Phone Number";
  String conPassText = "Confirm Password";

  bool hidePassword = true;
  bool isFormFilled = false;

  String? nameError;
  String? lastNameError;
  String? emailError;
  String? phoneNumberError;
  String? addressError;
  String? passError;
  String? conPassError;

  void checkForm() {
    setState(() {
      // Name validation
      nameError = nameController.text.isEmpty ? "Enter your name" : null;

      // Email validation
      if (emailController.text.isEmpty) {
        emailError = "Enter your email";
      } else if (!emailController.text.contains("@")) {
        emailError = "Enter a valid email";
      } else {
        emailError = null;
      }

      // Password validation
      if (passController.text.isEmpty) {
        passError = "Enter a password";
      } else if (passController.text.length < 6) {
        passError = "Password must be at least 6 characters";
      } else {
        passError = null;
      }

      // Confirm password validation
      if (ConPassController.text != passController.text) {
        conPassError = "Passwords do not match";
      } else {
        conPassError = null;
      }

      // Enable button only if all valid
      isFormFilled =
          nameError == null &&
          lastNameError == null &&
          addressError == null &&
          emailError == null &&
          phoneNumberError == null &&
          passError == null &&
          conPassError == null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(vertical: 50),
          decoration: BoxDecoration(color: Colorsfield.customColorField()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sign up with Email",
                style: Textstylefield.Custom_an_H3_TextStyleField(),
              ),
              const SizedBox(height: 30),
              InputFieldHelper.CustomTextField(
                controller: nameController,
                text: nametext,
                tohide: false,
                errorText: nameError,
                onChanged: (_) => checkForm(),
              ),
              const SizedBox(height: 30),
              InputFieldHelper.CustomTextField(
                controller: lastNameController,
                text: lastNametext,
                tohide: false,
                errorText: lastNameError,
                onChanged: (_) => checkForm(),
              ),
              const SizedBox(height: 20),
              InputFieldHelper.CustomTextField(
                controller: emailController,
                text: emailtext,
                tohide: false,
                errorText: emailError,
                onChanged: (_) => checkForm(),
              ),
              const SizedBox(height: 20),
              InputFieldHelper.CustomTextField(
                controller: addressController,
                text: addresstext,
                tohide: false,
                errorText: addressError,
                onChanged: (_) => checkForm(),
              ),
              const SizedBox(height: 20),
              InputFieldHelper.CustomNumbField(
                controller: phoneNumberController,
                text: phoneNumber,
                errorText: phoneNumberError,
                onChanged: (_) => checkForm(),
              ),
              const SizedBox(height: 20),
              InputFieldHelper.CustomPassTextField(
                controller: passController,
                text: passText,
                tohide: hidePassword,
                errorText: passError,
                onChanged: (_) => checkForm(),
                onTap: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
              ),
              const SizedBox(height: 20),
              InputFieldHelper.CustomPassTextField(
                controller: ConPassController,
                text: conPassText,
                tohide: hidePassword,
                errorText: conPassError,
                onChanged: (_) => checkForm(),
                onTap: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
              ),
              const SizedBox(height: 160),
              Butttonfield.Custom_LogInSignUp_ButtonField(
                text: "Sign Up",
                isEnabled: isFormFilled,
                onPressed: () async {
                  if (!isFormFilled) return;
                  try {
                    final auth = AuthService();
                    final firestore = FirestoreService();
                    User? user = await auth.signup(
                      emailController.text.trim(),
                      passController.text.trim(),
                      nameController.text.trim(),
                    );
                    if (user != null) {
                      await firestore.saveUser(
                        user: user,
                        name: nameController.text.trim(),
                        phoneNumber: phoneNumberController.text.trim(),
                        lastName: lastNameController.text.trim(),
                        address: addressController.text.trim(),
                        imageUrl: '',
                      );
                      if (!mounted) return;
                      Provider.of<UserProvider>(context, listen: false).setUser(
                        user: user,
                        name: nameController.text.trim(),
                        lastName: lastNameController.text.trim(),
                        email: user.email,
                        phoneNumber: phoneNumberController.text.trim(),
                        address: addressController.text.trim(),
                        imageUrl: '',
                      );
                    }
                    if (!mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Signup Successful")),
                    );
                    Navigator.pushReplacementNamed(context, "/login");
                  } catch (e) {
                    print("Error during signup: $e");
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(e.toString())));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
