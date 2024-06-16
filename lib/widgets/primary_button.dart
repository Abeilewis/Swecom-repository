import 'package:flutter/cupertino.dart';
import 'package:swecom_app/theme/app_colors.dart';
import 'package:swecom_app/theme/app_styles.dart';

class PrimaryButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onClick;

  const PrimaryButton({required this.buttonText, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
            child: Text(
          buttonText,
          style: AppStyles.buttons
              .copyWith(color: AppColors.white, fontWeight: FontWeight.w600),
        )),
      ),
    );
  }
}
