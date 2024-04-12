// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:get/get.dart';
// import 'package:get/get_connect.dart';
// import 'package:http/http.dart' as http;

// class ClientStripePayment extends GetConnect {
//   Map<String, dynamic>? paymentIntentData;

//   Future<void> makePayment(BuildContext context) async {
//     try {
//       paymentIntentData = await createPaymentIntent('10', 'USD');
//       await Stripe.instance
//           .initPaymentSheet(
//               paymentSheetParameters: SetupPaymentSheetParameters(
//                   paymentIntentClientSecret:
//                       paymentIntentData!['client_secret'],
//                   applePay: true,
//                   googlePay: true,
//                   testEnv: true,
//                   style: ThemeMode.dark,
//                   merchantCountryCode: 'US',
//                   merchantDisplayName: 'Echnelapp'))
//           .then((value) => {});
//       showPaymentSheet(context);
//     } catch (e) {
//       print(e);
//     }
//   }

//   showPaymentSheet(BuildContext context) async {
//     try {
//       await Stripe.instance
//           .presentPaymentSheet()
//           .then((value) => {
//                 Get.snackbar('Transacción exitosa',
//                     'Tu pago fue procesado correctamente')
//               })
//           .onError((error, stackTrace) {
//         print('Error con la transacción: $error - $stackTrace');
//         throw ('$error');
//       });
//       paymentIntentData = null;
//     } on StripeException catch (e) {
//       print('Error de stripe $e');
//       showDialog(
//           context: context,
//           builder: (value) => AlertDialog(
//                 content: Text('Operación cancelada'),
//               ));
//     }
//   }

//   createPaymentIntent(String amount, String currency) async {
//     try {
//       Map<String, dynamic> body = {
//         'amount': calculateAmount(amount),
//         'currency': currency,
//         'payment_method_types[]': 'card'
//       };

//       var response = await http.post(
//           Uri.parse('https://api.stripe.com/v1/payment__intents'),
//           body: body,
//           headers: {
//             'Authorization':
//                 'Bearer sk_test_51ITEfNCkJDllD3Nbuhfa5F2g5HchrOyD92Yv2qctuHaVJOHgEkc1MAtxeYUeCNi1FPc4f0uYW34BRWeDBGl2QMAj00G1IsFV2a',
//             'Content-type': 'application/x-www-form-urlencoded'
//           });

//       return jsonDecode(response.body);
//     } catch (err) {
//       print(err);
//     }
//   }

//   String calculateAmount(String amount) {
//     final a = int.parse(amount) * 100;
//     return a.toString();
//   }
// }
