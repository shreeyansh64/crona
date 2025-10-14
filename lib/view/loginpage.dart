import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:crona/widgets/loginform.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 220,
        centerTitle: false,
        backgroundColor: Color.fromARGB(255, 235, 250, 246),
        title: Column(
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
                  height: 130, 
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Positioned(
                        top: -52,
                        left: 190,
                        child: SvgPicture.asset(
                          'assets/images/signup_man.svg',
                          height: 330,
                          width: 220,
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
      body: LoginForm(),
    );
  }
}
