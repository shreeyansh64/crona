import 'package:crona/models/registermodel.dart';
import 'package:crona/services/registerservice.dart';
import 'package:crona/view/loginpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:crona/view/dashboard.dart';

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
  bool _isLoading = false;
  final _usernameFocus = FocusNode();
  final _passFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _confpassFocus = FocusNode();
  bool _obscure = true;
  bool _obscureconf = true;

  RegisterModel? result;
  final registerService = RegisterService();

Future<void> register(String username, String email, String password) async {
  setState(() {
    _isLoading = true;
  });

  final data = await registerService.registerUser(
    username: username,
    email: email,
    password: password,
  );

  if (data != null) {
    setState(() {
      result = data;
      _isLoading = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          data.success
              ? 'Registration successful! Welcome, ${data.data?.username}'
              : 'Registration failed: ${data.message}',
        ),
        backgroundColor: data.success ? Colors.green : Colors.red,
        duration: Duration(seconds: 2),
      ),
    );

    if (data.success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Dashboard()),
      );
    }
  } else {
    setState(() {
      _isLoading = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Registration request failed. Please try again.'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ),
    );
  }
}

  @override
  void initState() {
    super.initState();
    _usernameFocus.addListener(() => setState(() {}));
    _passFocus.addListener(() => setState(() {}));
    _emailFocus.addListener(() => setState(() {}));
    _confpassFocus.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _usernameFocus.dispose();
    _passFocus.dispose();
    _emailFocus.dispose();
    _confpassFocus.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _confpassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, right: 25, left: 25),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text(
                "Sign Up",
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
              controller: _usernameController,
              focusNode: _usernameFocus,
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
              controller: _emailController,
              focusNode: _emailFocus,
              decoration: InputDecoration(
                prefixIcon: Icon(CupertinoIcons.mail, size: 30),
                prefixIconColor: _emailFocus.hasFocus
                    ? Color.fromARGB(255, 126, 222, 195)
                    : Color.fromARGB(255, 102, 102, 102),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: _emailFocus.hasFocus
                        ? Color.fromARGB(255, 126, 222, 195)
                        : Color.fromARGB(255, 102, 102, 102),
                  ),
                ),
                hint: Text(
                  "Email",
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
                  "Enter Password",
                  style: TextStyle(
                    color: Color.fromARGB(255, 102, 102, 102),
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 32,),
            TextField(
              obscureText: _obscureconf,
              controller: _confpassController,
              focusNode: _confpassFocus,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock, size: 32),
                prefixIconColor: _confpassFocus.hasFocus
                    ? Color.fromARGB(255, 126, 222, 195)
                    : Color.fromARGB(255, 102, 102, 102),
                suffixIcon: _confpassController.text.isNotEmpty
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
                    color: _confpassFocus.hasFocus
                        ? Color.fromARGB(255, 126, 222, 195)
                        : Color.fromARGB(255, 102, 102, 102),
                  ),
                ),
                hint: Text(
                  "Confirm Password",
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
            SizedBox(height: 20),
            InkWell(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
              },
              child: Text.rich(
                TextSpan(
                  text: "Already have an account?",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                      text: " Log In",
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
            ),
            SizedBox(height: 130),
          ],
        ),
      ),
    );
  }
}
