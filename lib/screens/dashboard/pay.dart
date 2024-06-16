import 'package:cinetpay/cinetpay.dart';
import 'package:flutter/material.dart';
import 'package:swecom_app/screens/helper/widgets.dart';
import 'package:swecom_app/theme/app_colors.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  TextEditingController amountController = TextEditingController();
  Map<String, dynamic>? response;
  Color? color;
  IconData? icon;
  String? message;
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return CinetPayCheckout(
      title: 'Payment Checkout',
      titleStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      titleBackgroundColor: AppColors.primaryColor,
      configData: <String, dynamic>{
        'apikey': '137739369364d5f75ca311d8.02786779',
        'site_id': int.parse("639688"),
        'notify_url': 'https://cinetpay.com'
      },
      paymentData: <String, dynamic>{
        'transaction_id': DateTime.now().toString(),
        'amount': "100",
        'currency': 'XAF',
        'channels': 'ALL',
        'description': 'Payment test',
      },
      waitResponse: (data) {
        if (mounted) {
          setState(() {
            response = data;
            print(response);
            icon = data['status'] == 'ACCEPTED'
                ? Icons.check_circle
                : Icons.mood_bad_rounded;
            color =
                data['status'] == 'ACCEPTED' ? Colors.green : Colors.redAccent;
            show = true;
            Navigator.pop(context);
          });
        }
      },
      onError: (data) {
        if (mounted) {
          setState(() {
            response = data;
            message = response!['description'];
            print(response);
            icon = Icons.warning_rounded;
            color = Colors.yellowAccent;
            show = true;
            Navigator.pop(context);

          });
        }
      },
    );
  }
}
