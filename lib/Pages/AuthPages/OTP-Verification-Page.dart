import 'package:flutter/material.dart';

class Otpverificationpage extends StatelessWidget {
  Otpverificationpage({super.key,required this.number});

  final String number;
  final TextEditingController otp1 = TextEditingController();
  final TextEditingController otp2 = TextEditingController();
  final TextEditingController otp3 = TextEditingController();
  final TextEditingController otp4 = TextEditingController();
  final TextEditingController otp5 = TextEditingController();
  final TextEditingController otp6 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
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

            Text('+91 $number'),

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
                onPressed: () {

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
