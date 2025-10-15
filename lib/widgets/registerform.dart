import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confpassController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final _isLoading = false;
  final _usernameFocus = FocusNode();
  final _passFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _confpassFocus = FocusNode();
  bool _obscure = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, right: 25, left: 25),
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
                  fontSize: 40,
                ),
              ),
            ),
            SizedBox(height: 50),
            TextField(
              // controller: _usernameController,
              // focusNode: _usernameFocus,
              decoration: InputDecoration(
                prefixIcon: Icon(CupertinoIcons.person_circle, size: 35),
                prefixIconColor: _usernameFocus.hasFocus
                    ? Color.fromARGB(255, 126, 222, 195)
                    : Color.fromARGB(255, 102, 102, 102),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: _usernameFocus.hasFocus
                        ? Color.fromARGB(255, 126, 222, 195)
                        : Color.fromARGB(255, 102, 102, 102),
                  ),
                ),
                hint: Text(
                  "Username or Email",
                  style: TextStyle(
                    color: Color.fromARGB(255, 102, 102, 102),
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 32),
            TextField(
              obscureText: _obscure,
              controller: _passwordController,
              focusNode: _passFocus,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock, size: 32),
                prefixIconColor: _passFocus.hasFocus
                    ? Color.fromARGB(255, 126, 222, 195)
                    : Color.fromARGB(255, 102, 102, 102),
                suffixIcon: _passwordController.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(
                          _obscure ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscure = !_obscure;
                          });
                        },
                      )
                    : null,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: _passFocus.hasFocus
                        ? Color.fromARGB(255, 126, 222, 195)
                        : Color.fromARGB(255, 102, 102, 102),
                  ),
                ),
                hint: Text(
                  "Password",
                  style: TextStyle(
                    color: Color.fromARGB(255, 102, 102, 102),
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 40, 199, 154),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                ),
                onPressed: () {},
                child: _isLoading
                    ? SpinKitThreeBounce(color: Colors.black26, size: 20)
                    : Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
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
            SizedBox(height: 160),
          ],
        ),
      ),
    );
  }
}
