import 'package:flutter/material.dart';
import 'package:food_app/pages/devlivery_page.dart';
import 'package:food_app/widgets/buttons.dart';
import 'package:food_app/widgets/text.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  //payment

  void userTapped() {
    if (formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const HeaderText(
            text: "Confirm Payment",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DevliveryPage(),
                  ),
                );
              },
              child: const BodyText(text: "Yes"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const BodyText(text: "Cancel"),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const HeaderText(text: "Checkout"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CreditCardWidget(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: isCvvFocused,
                onCreditCardWidgetChange: (p0) {}),
            CreditCardForm(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                onCreditCardModelChange: (data) {
                  setState(() {
                    cardNumber = data.cardNumber;
                    cardHolderName = data.cardHolderName;
                    expiryDate = data.expiryDate;
                    cvvCode = data.cvvCode;
                  });
                },
                formKey: formKey),
            const Spacer(),
            FillButton(text: "Pay Now", ontap: userTapped),
            const SizedBox(
              height: 25,
            )
          ],
        ),
      ),
    );
  }
}
