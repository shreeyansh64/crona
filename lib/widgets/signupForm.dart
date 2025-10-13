import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, right: 25, left: 25),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text(
                "Welcome back!",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  fontSize: 32,
                ),
              ),
            ),
            SizedBox(height: 44),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(CupertinoIcons.person_circle, size: 30),
                prefixIconColor: Color.fromARGB(255, 102, 102, 102),
                hint: Text(
                  "Username or Email",
                  style: TextStyle(
                    color: Color.fromARGB(255, 102, 102, 102),
                    fontFamily: 'Roboto',
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 32),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock, size: 30),
                prefixIconColor: Color.fromARGB(255, 102, 102, 102),
                hint: Text(
                  "Password",
                  style: TextStyle(
                    color: Color.fromARGB(255, 102, 102, 102),
                    fontFamily: 'Roboto',
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 9),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Color.fromARGB(255, 23, 119, 92),
                      fontFamily: 'Roboto',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 40, 199, 154),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                ),
                onPressed: () {},
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "or",
              style: TextStyle(
                color: Color.fromARGB(255, 102, 102, 102),
                fontFamily: 'Roboto',
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Color.fromARGB(255, 39, 199, 153)),
                ),
                onPressed: () {},
                child: Text(
                  "Login with OTP",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 39, 199, 153),
                  ),
                ),
              ),
            ),
            SizedBox(height: 13),
            Text.rich(
              TextSpan(
                text: "Don't have an account?",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Roboto',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                children: [
                  TextSpan(
                    text: " Sign Up",
                    style: TextStyle(
                      color: Color.fromARGB(255, 29, 149, 115),
                      fontFamily: 'Roboto',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 160,)
          ],
        ),
      ),
    );
  }
}
