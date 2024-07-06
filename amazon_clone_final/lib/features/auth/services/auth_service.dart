import 'dart:convert';

import 'package:amazon_clone_final/constants/error_handling.dart';
import 'package:amazon_clone_final/constants/utils.dart';
import 'package:flutter/material.dart';
import '../../../constants/global_variables.dart';
import '../../../models/user.dart';
import 'package:http/http.dart' as http;

class AuthService {
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        password: password,
        address: '',
        type: '',
        token: 'token',
        email: email,
      );
      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            'Account created! Login with the same credentials!',
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'), // Corrected URL
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      print(res.body);
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          // Navigate to home screen or perform other actions
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}

