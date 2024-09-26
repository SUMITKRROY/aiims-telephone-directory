import 'dart:convert';
import 'package:aiims_telephone_directory/component/bgimage.dart';
import 'package:aiims_telephone_directory/component/myText.dart';
import 'package:aiims_telephone_directory/component/myTextForm.dart';
import 'package:aiims_telephone_directory/helper/validation_checker.dart';
import 'package:aiims_telephone_directory/modal_view/get_otp/get_otp_cubit.dart';
import 'package:aiims_telephone_directory/route/pageroute.dart';
import 'package:aiims_telephone_directory/utils/image.dart';
import 'package:aiims_telephone_directory/view/widget/scaffold_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/utils.dart';
import 'otp_screen.dart';

class LoginTypeScreen extends StatefulWidget {
  const LoginTypeScreen({super.key});

  @override
  _LoginTypeScreenState createState() => _LoginTypeScreenState();
}

class _LoginTypeScreenState extends State<LoginTypeScreen> {
  final TextEditingController _empController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool showOtpField = false;

  @override
  void dispose() {
    _empController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: CustomImageContainer(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          height: MediaQuery.of(context).size.height, // Set height to full screen
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center vertically
            children: [
              Text(
                "Select Your Login Type",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.h), // Space below title

              // User Login Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade600,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 50.w),
                ),
                onPressed: () {
                  Navigator.pushNamed(context,RoutePath.guestLoginScreen);
                },
                child: MyText(label: "User Login"),
              ),

              SizedBox(height: 15.h), // Space between buttons

              // Employee Login Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade600,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 50.w),
                ),
                onPressed: () {  Navigator.pushNamed(context,RoutePath.login);},
                child: MyText(label: "Employee Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

