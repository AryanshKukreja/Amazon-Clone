import 'package:flutter/material.dart';
import  'package:amazon_clone_final/main.dart';
import '../../../constants/global_variables.dart';

class AuthScreen extends StatefulWidget {
  static const String routeName ='/auth-screen';
  const AuthScreen( {Key? key}) :super (key:key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth=Auth.signup;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[400],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('Welcome', style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
              ),
              ListTile(
              title: const Text(
                  'Create Account',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )
              ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value:Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth =val!;
                    });
                  },
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}