import 'package:ecommerce/myTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldItem extends StatelessWidget {
  String fieldName;
  String hintText;
  Widget? suffixIcon;
  bool isObsecure;
  var keyBoardType;
  String? Function(String?)? validator;
  TextEditingController controller;

  TextFieldItem(
      {required this.fieldName,
      required this.hintText,
      required this.controller,
      this.isObsecure = false,
      this.keyBoardType,
      this.suffixIcon,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          fieldName,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontSize: 18.sp),
        ),
        Padding(
          padding: EdgeInsets.only(top: 24.h, bottom: 20.h),
          child: TextFormField(
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r)),
                hintText: hintText,
                hintStyle: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: MyTheme.greyColor),
                suffixIcon: suffixIcon),
            style: TextStyle(color: Colors.black),
            validator: validator,
            obscureText: isObsecure,
            keyboardType: keyBoardType,
          ),
        ),
      ],
    );
  }
}
