import 'package:flutter/material.dart';
import 'package:fluttermachinetest/Pages/AuthPages/OTP-Verification-Page.dart';
import 'package:fluttermachinetest/Pages/AuthPages/Sign-In-Page.dart';

class Signuppage extends StatelessWidget {
  Signuppage({super.key});

  final TextEditingController emailContr = TextEditingController();
  final TextEditingController passwordContr = TextEditingController();
  final TextEditingController nameContr = TextEditingController();
  final TextEditingController numberlContr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            const Text(
              'Welcome!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const Text(
              'Please register to continue',
              style: TextStyle(fontSize: 15),
            ),

            const SizedBox(height: 10),
            inputWidget('Name', nameContr),
            const SizedBox(height: 10),
            inputWidget('Email address', emailContr),
            const SizedBox(height: 10),
            inputWidget('Email address', emailContr),
            const SizedBox(height: 15),
            inputWidget('Password', passwordContr),
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
            inputWidget('Mobile number', numberlContr),

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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Otpverificationpage(number: numberlContr.text),
                    ),
                  );
                },
                child: Text(
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

  Widget inputWidget(String hinText, TextEditingController contr) {
    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        controller: contr,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: hinText,
          border: InputBorder.none,
          isCollapsed: true,
        ),
      ),
    );
  }
}
