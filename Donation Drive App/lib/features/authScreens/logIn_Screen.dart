import 'package:donation_drive/widgets/ButtonsField/loginButtonField.dart';
import 'package:donation_drive/widgets/ColorsField/ColorField.dart';
import 'package:donation_drive/widgets/ForgotPasswordField/forgotPasswordField.dart';
import 'package:donation_drive/widgets/InputField/logIn_InputField.dart';
import 'package:donation_drive/widgets/RememberMeField/rememberMeField.dart';
import 'package:donation_drive/widgets/TextStyleField/headingField.dart';
import 'package:donation_drive/widgets/TextStyleField/textField.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final TextEditingController EmailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

bool tohide = false;
bool isHidden = true;
bool isRemember = false;
const String ISLOGGEDIN = "";

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  void checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool(ISLOGGEDIN) ?? false;
    if (isLoggedIn) {
      // Navigator.pushReplacementNamed(context, "/dashboard");
      print("User is already logged in");
    } else {
      print("User is not logged in");
    }
  }

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
                  style: ShortTextField.Heading_1(),
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
                          controller: EmailController,
                          labeltext: "Email Address",
                          text: "admin@example.com",
                          tohide: tohide,
                        ),
                        SizedBox(height: 20),
                        LoginInputfield.AdminPassword(
                          controller: passwordController,
                          labeltext: "Password",
                          text: "Enter your password",
                          tohide: isHidden,
                          onToggle: () => setState(() {
                            isHidden = !isHidden;
                          }),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Remembermefield.build(
                                value: isRemember,
                                onChanged: (val) {
                                  setState(() {
                                    isRemember = val ?? false;
                                  });
                                },
                              ),
                              // SizedBox(width: 20),
                              Forgotpasswordfield.build(
                                onTap: () {
                                  print("Forgot Password");
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Buttonsfield.Loginbuttonfield(
                          text: "Sign In",
                          onPressed: () async {
                            String email = EmailController.text.trim();
                            String password = passwordController.text.trim();
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();

                            if (EmailController.text == "admin@exam```3ple.com" &&
                                passwordController.text == "admin123") {
                              await prefs.setBool(ISLOGGEDIN, true);
                              // Navigator.pushReplacementNamed(context, "/dashboard");
                              print("Login Successful");
                            } else {
                              print("Invalid email or password");
                            }
                          },
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Donation Management System",
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "v1.0",
                      style: TextStyle(color: ColorsField.MainColorField()),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
