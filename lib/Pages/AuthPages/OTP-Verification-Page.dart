import 'package:flutter/material.dart';
import 'package:fluttermachinetest/Pages/HomePage.dart';

import '../../Reusable-Widgets/custom-Toast.dart';
import '../../Services/Auth-API-Service/Auth-APIs.dart';
import '../../Utils/User-Preference-Data.dart';

class Otpverificationpage extends StatefulWidget {
  Otpverificationpage({super.key,required this.number,required this.name,required this.email,required this.password});

  final String number;
  final String name;
  final String email;
  final String password;

  @override
  State<Otpverificationpage> createState() => _OtpverificationpageState();
}

class _OtpverificationpageState extends State<Otpverificationpage> {
  final TextEditingController otp1 = TextEditingController();

  final TextEditingController otp2 = TextEditingController();

  final TextEditingController otp3 = TextEditingController();

  final TextEditingController otp4 = TextEditingController();

  final TextEditingController otp5 = TextEditingController();

  final TextEditingController otp6 = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),

            Image.asset('lib/Assets/calleylogo.png',height: 130),

            const SizedBox(height: 15),

            const Text(
              'Email OTP Verification',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const Text(
              'Please ensure that the email id is mentioned is valid as we have sent an OTP to your mail.',
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.center,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (var controller in [otp1, otp2, otp3, otp4, otp5, otp6])
                  Expanded(
                    child: otpBox(controller),
                  ),
              ],
            ),

            Text('+91 ${widget.number}'),

            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t receive OTP code?'),

                TextButton(onPressed: () {}, child: Text('Resend OTP')),
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
                    :() async{


                  final otp = otp1.text + otp2.text + otp3.text + otp4.text + otp5.text + otp6.text;

                  if (otp.length < 6) {
                    showCustomToast(context, 'Please enter complete OTP');
                    return;
                  }

                  setState(() {
                    _isLoading = true;
                  });

                  print(otp);
                  final otpStatus = await AuthAPIs.verifyOTP(widget.email, otp);

                  if(otpStatus['message'] == 'OTP Verfied' && context.mounted){


                     print(otpStatus['message']);

                     await UserPreferencesData.saveLoginStatus(true);
                     await UserPreferencesData.saveEmail(widget.email);
                     await UserPreferencesData.saveName(widget.name);

                     setState(() {
                       _isLoading = false;
                     });

                     if(context.mounted) {
                       Navigator.push(
                         context,
                         MaterialPageRoute(
                             builder: (context) =>
                                 Homepage()
                         ),
                       );

                       showCustomToast(context, 'Registered successfully!!!');
                     }

                   }else{

                     if(context.mounted) {
                      showCustomToast(context, '${otpStatus['message']},Field to register!!!');
                     }
                   }

                   setState(() {
                     _isLoading = false;
                   });

                },
                child:_isLoading ? CircularProgressIndicator() : Text(
                  'Verify OTP',
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

  Widget otpBox(TextEditingController contr) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 50,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextField(
          controller: contr,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          maxLength: 1,
          decoration: const InputDecoration(
            counterText: '',
            border: InputBorder.none,
          ),
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
