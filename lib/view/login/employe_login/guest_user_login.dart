import 'dart:convert';
import 'package:aiims_telephone_directory/component/bgimage.dart';
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

import '../../../utils/textField_validation.dart';
import '../../../utils/utils.dart';
import '../../otp_screen.dart';

class GuestLoginScreen extends StatefulWidget {
  @override
  _GuestLoginScreenState createState() => _GuestLoginScreenState();
}

class _GuestLoginScreenState extends State<GuestLoginScreen> {
  final TextEditingController _phoneController = TextEditingController(); // Phone Number Controller
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _phoneController.dispose(); // Dispose of controller when no longer needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: CustomImageContainer(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 25, right: 25),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  ImagePath.login,
                  height: 200.h,
                  width: 200.h,
                ),
                // Changed title to reflect guest verification
                Text(
                  "Guest User Verification",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.h,
                ),
                // Updated instruction text for phone number
                Text(
                  "Please register your phone number.",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30.h,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Phone number input field with validation
                      MyTextForm(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10), // Limit phone number to 10 digits
                          FilteringTextInputFormatter.digitsOnly, // Only allow numeric input
                        ],
                        label: "Phone Number",
                        prefixIcon: Icon(
                          Icons.phone,
                          size: 28.sp,
                          color: Colors.green.shade600,
                        ),
                        controller: _phoneController,
                        onChanged: (value) {},
                        validator: true,
                        // Validate phone number (10 digits and required)
                        validatorFunc: Utils.phoneValidator(),
                        keyboardType: TextInputType.phone, // Phone number keyboard
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: BlocListener<GetOtpCubit, GetOtpState>(
                          listener: (context, state) {
                            if (state is GetOtpLoading) {
                              Utils.showLoadingProgress(context); // Show loading spinner
                            }
                            if (state is GetOtpLoaded) {
                              Navigator.pop(context); // Remove loading spinner
                              // Navigate to OTP screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OTPScreen(
                                    empId: _phoneController.text.trim(), // Use phone number as empId for guest users
                                    otp: state.otp,
                                  ),
                                ),
                              );
                            }
                            if (state is GetOtpError) {
                              Navigator.pop(context); // Remove loading spinner
                              MySncakbar.snackbarToast(state.error); // Show error message
                            }
                          },
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green.shade600,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // Trigger OTP fetch via BLoC for the phone number
                                BlocProvider.of<GetOtpCubit>(context).getOtp(
                                  empId: _phoneController.text.trim(), // Use phone number as the ID for guest users
                                );
                              } else {
                                MySncakbar.snackbarToast(
                                  'Invalid Phone Number', // Display validation error message
                                );
                              }
                            },
                            // Button text updated to reflect guest action
                            child: Text("Get Otp"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
