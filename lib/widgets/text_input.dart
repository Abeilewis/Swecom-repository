import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swecom_app/theme/app_colors.dart';
import 'package:swecom_app/theme/app_styles.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? placeholder;
  final Widget? sideIcon;
  final Function(String?)? onChange;
  final String? Function(String?)? validator;
  final bool obscureText;

  CustomTextField(
      {this.controller,
      this.placeholder,
      this.sideIcon,
      this.onChange,
      this.validator, this.obscureText = false});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          widget.sideIcon!,
          const SizedBox(
            width: 25,
          ),
          Expanded(
            child: TextFormField(
              controller: widget.controller,
              validator: widget.validator,
              obscureText: widget.obscureText,
              decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: widget.placeholder,
                  hintStyle: AppStyles.bodyText
                      .copyWith(color: AppColors.mediumGrey.withOpacity(0.7))),
            ),
          )
        ],
      ),
    );
  }
}
