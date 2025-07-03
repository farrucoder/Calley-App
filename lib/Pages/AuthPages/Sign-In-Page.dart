import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttermachinetest/Pages/AuthPages/Sign-Up-Page.dart';
import 'package:fluttermachinetest/Pages/HomePage.dart';
import 'package:fluttermachinetest/Reusable-Widgets/custom-Toast.dart';
import 'package:fluttermachinetest/Services/Auth-API-Service/Auth-APIs.dart';
import 'package:fluttermachinetest/Utils/validation-Check.dart';

import '../../Utils/User-Preference-Data.dart';

class Signinpage extends StatefulWidget {
  Signinpage({super.key});

  @override
  State<Signinpage> createState() => _SigninpageState();
}

class _SigninpageState extends State<Signinpage> {
  final TextEditingController emailContr = TextEditingController();

  final TextEditingController passwordContr = TextEditingController();

  bool _passObsecure = false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),

            Image.asset('lib/Assets/calleylogo.png', height: 130),

            const SizedBox(height: 15),
            const Text(
              'Welcome',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const Text(
              'Please sign-in to continue',
              style: TextStyle(fontSize: 15),
            ),

            const SizedBox(height: 10),
            inputWidget('Email address', emailContr, Icons.email),
            const SizedBox(height: 15),
            inputWidget('Password', passwordContr, CupertinoIcons.eye, () {
              setState(() {
                _passObsecure = !_passObsecure;
              });
            }),

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text('Forgot Password?'),
              ),
            ),

            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account?'),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Signuppage()),
                    );
                  },
                  child: Text('Sign Up'),
                ),
              ],
            ),

            const SizedBox(height: 10),

            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.blue[600]),
                ),
                onPressed: _isLoading
                    ? null
                    : () async {
                        if (!ValidationCheck.isFormValidLogin(
                          email: emailContr.text,
                          password: passwordContr.text,
                          context: context,
                        )) {
                          return;
                        }

                        setState(() {
                          _isLoading = true;
                        });

                        final response = await AuthAPIs.loginUser(
                          emailContr.text,
                          passwordContr.text,
                        );


                        if (context.mounted && response['message'] == 'Login successful') {

                          final userId = response['user']['_id'];
                          final userName = response['user']['username'];

                          await UserPreferencesData.saveLoginStatus(true);
                          await UserPreferencesData.saveName(userName);
                          await UserPreferencesData.saveUserId(userId);


                          await UserPreferencesData.saveLoginStatus(true);
                          await UserPreferencesData.saveEmail(emailContr.text);


                          setState(() {
                            _isLoading = false;
                          });

                          if (context.mounted) {
                            emailContr.clear();
                            passwordContr.clear();

                            showCustomToast(context, 'Sign in successfully');
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Homepage()
                              ),
                            );
                          }
                        } else {
                          if (context.mounted) {
                            print(response['message']);
                            showCustomToast(context, response['message']);
                          }

                          setState(() {
                            _isLoading = false;
                          });
                        }
                      },
                child: _isLoading
                    ? CircularProgressIndicator()
                    : Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget inputWidget(
    String hinText,
    TextEditingController contr,
    IconData icon, [
    VoidCallback? onTap,
  ]) {
    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              textAlign: TextAlign.center,
              controller: contr,
              obscureText: hinText == 'Password' ? _passObsecure : false,
              decoration: InputDecoration(
                hintText: hinText,
                border: InputBorder.none,
                isCollapsed: true,
              ),
            ),
          ),

          if (hinText == 'Password')
            InkWell(
              onTap: onTap,
              child: Icon(
                _passObsecure ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
              ),
            )
          else
            Icon(icon),
        ],
      ),
    );
  }
}
