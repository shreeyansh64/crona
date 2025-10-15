import 'package:crona/widgets/registerform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 263,
        centerTitle: false,
        backgroundColor: Color.fromARGB(255, 235, 250, 246),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [Icon(Icons.arrow_back,color: Color.fromARGB(255,69, 74, 73),)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/logo.svg',
                  height: 60,
                  width: 60,
                ),
                SizedBox(width: 12),
                SvgPicture.asset(
                  'assets/images/crona.svg',
                  height: 28,
                  width: 99,
                ),
              ],
            ),
            Stack(
              children: [
                SizedBox(
                  // color:Colors.black12,
                  height: 170, 
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Positioned(
                        top: -49,
                        left: 190,
                        child: SvgPicture.asset(
                          'assets/images/signup_man.svg',
                          height: 400,
                          width: 270,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: RegisterForm(),
    );
  }
}