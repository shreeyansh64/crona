import 'package:crona/view/loginpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back,color: Colors.grey[700],)),
        title: Center(child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Text("Forgot Password",style: TextStyle(color: Colors.black ,fontSize: 40),),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          TextField(),
          SizedBox(height: 20,),
          TextField(),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){}, child: Text("Change Password"))
        ],),
      )
    );
  }
}