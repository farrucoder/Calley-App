import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttermachinetest/Pages/AuthPages/OTP-Verification-Page.dart';
import 'package:fluttermachinetest/Pages/AuthPages/Sign-In-Page.dart';
import 'package:fluttermachinetest/Reusable-Widgets/custom-Toast.dart';
import 'package:fluttermachinetest/Services/Auth-API-Service/Auth-APIs.dart';
import '../../Utils/validation-Check.dart';

class Signuppage extends StatefulWidget {
  Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  final TextEditingController emailContr = TextEditingController();

  final TextEditingController passwordContr = TextEditingController();

  final TextEditingController nameContr = TextEditingController();

  final TextEditingController numberlContr = TextEditingController();

  bool _isLoading = false;

  bool _passObsecure = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),

            Image.asset('lib/Assets/calleylogo.png',height: 130),

            const SizedBox(height: 15),
            const Text(
              'Welcome!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const Text(
              'Please register to continue',
              style: TextStyle(fontSize: 15),
            ),

            const SizedBox(height: 10),
            inputWidget('Name', nameContr,CupertinoIcons.person),
            const SizedBox(height: 10),
            inputWidget('Email address', emailContr,Icons.email_outlined),
            const SizedBox(height: 10),
            inputWidget('Password', passwordContr,CupertinoIcons.eye,(){
              setState(() {
                _passObsecure = !_passObsecure;
              });
            }),
            const SizedBox(height: 15),
            Container(
              height: 40,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text('+91'),
            ),
            const SizedBox(height: 15),
            inputWidget('Mobile number', numberlContr,Icons.call),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(value: false, onChanged: (v) {}),
                const Text('I agree to the'),

                TextButton(
                  onPressed: () {},
                  child: Text('Terms and Conditions'),
                ),
              ],
            ),

            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?'),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Signinpage()),
                    );
                  },
                  child: Text('Sign In'),
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
                onPressed: _isLoading ? null : ()async {

                  if(!ValidationCheck.isFormValidSignup(email: emailContr.text,
                      password: passwordContr.text, name: nameContr.text
                      ,number: numberlContr.text,context: context)){
                    return;
                  }


                  setState(() {
                    _isLoading = true;
                  });

                  final userStatus = await AuthAPIs.registerUser(nameContr.text, emailContr.text, passwordContr.text);


                  final otpStatus = await AuthAPIs.sendOTP(emailContr.text);

                  if(context.mounted && userStatus['message'] == 'User registered' && otpStatus['message'] == 'OTP sent'){

                   // print(status['message']);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Otpverificationpage(number: numberlContr.text,email: emailContr.text,
                                password: passwordContr.text, name: nameContr.text
                            ),
                      ),
                    );

                    showCustomToast(context, 'OTP has been send!!!');

                    nameContr.clear();
                    emailContr.clear();
                    passwordContr.clear();
                    nameContr.clear();

                    setState(() {
                      _isLoading = false;
                    });

                  }else{

                    if(context.mounted) {
                     showCustomToast(context, '${otpStatus['message']},Field to send OTP!!!');
                    }
                  }

                  setState(() {
                    _isLoading = false;
                  });

                },
                child: _isLoading ? CircularProgressIndicator() : Text(
                  'Sign Up',
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

  Widget inputWidget(String hinText, TextEditingController contr,IconData icon,[VoidCallback? onTap]) {
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
              controller: contr,
              textAlign: TextAlign.center,
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
                _passObsecure ? CupertinoIcons.eye_slash :  CupertinoIcons.eye,
              ),
            )
          else
            Icon(icon),
        ],
      )
    );
  }
}
