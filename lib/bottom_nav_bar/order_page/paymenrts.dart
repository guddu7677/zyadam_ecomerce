import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Payments_page extends StatefulWidget {
  const Payments_page({super.key});

  @override
  State<Payments_page> createState() => _Payments_pageState();
}

class _Payments_pageState extends State<Payments_page> {
  late Razorpay _razorpay;
  TextEditingController amtController = TextEditingController();
  void openCheckout(ammount) async {
    ammount = ammount;
    100;
    var options = {
      "key": "rzp_live_ILgsfZCZoFIKMb",
      "ammount": ammount,
      "name": "nawalkishor",
      "prefill": {"contact": 865123456, "email": "test@gmail.com"},
      "external": {
        "wallets": ["paytm"]
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint("error:e");
    }
    void handlePaymentSuccess(PaymentSuccessResponse) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
