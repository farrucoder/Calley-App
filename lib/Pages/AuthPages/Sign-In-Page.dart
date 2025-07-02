import 'package:flutter/material.dart';


class Signinpage extends StatelessWidget {
   Signinpage({super.key});

  final TextEditingController emailContr = TextEditingController();
  final TextEditingController passwordContr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const Spacer(),
            const Text('Welcome',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
            const Text('Please sign-in to continue',style:TextStyle(fontSize: 15)),

            const SizedBox(height: 10),
            inputWidget('Email address',emailContr),
            const SizedBox(height: 15),
            inputWidget('Password',passwordContr),

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(onPressed: (){

              }, child: Text('Forgot Password?')),
            ),

            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account?'),

                  TextButton(onPressed: (){

                  }, child: Text('Sign Up')),
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
                  onPressed: (){

                  }, child: Text('Sign In',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
            ),
          ],
        ),
      ),
    );
  }

  Widget inputWidget(String hinText,TextEditingController contr){
    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        textAlign: TextAlign.center,
        controller: contr,
        decoration: InputDecoration(
          hintText: hinText,
          border: InputBorder.none,
          isCollapsed: true,
        ),
      ),
    );
  }
}
