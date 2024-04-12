// import 'package:flutter/material.dart';
// import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';

// class ClientPaymentsCreatePaypalPage extends StatefulWidget {
//   @override
//   State<ClientPaymentsCreatePaypalPage> createState() =>
//       _ClientPaymentsCreatePaypalPageState();
// }

// class _ClientPaymentsCreatePaypalPageState
//     extends State<ClientPaymentsCreatePaypalPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "PayPal Checkout",
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//       body: Center(
//         child: TextButton(
//           onPressed: () async {
//             Navigator.of(context).push(MaterialPageRoute(
//               builder: (BuildContext context) => PaypalCheckout(
//                 sandboxMode: true,
//                 clientId:
//                     "AWf6ojNUUzSLL57itieTvpsVrq_Rd9gaeagNSi1WbUuwMjwQju2bkQ5TIFHg_7SwN-lr2TNinrAmmbtx",
//                 secretKey:
//                     "EIMWAe4DLox0IO7cE2yvwXgVhcHOEN-eomiEr0i7ZeDf2eVWvZxfM5HiqYb5bRLdbdw_0PpJywx0sOD9",
//                 returnURL: "success.snippetcoder.com",
//                 cancelURL: "cancel.snippetcoder.com",
//                 transactions: const [
//                   {
//                     "amount": {
//                       "total": 20,
//                       "currency": "USD",
//                       "details": {
//                         "subtotal": 20,
//                         "shipping": 0,
//                         "shipping_discount": 0
//                       }
//                     },
//                     "description": "The payment transaction description.",
//                     "item_list": {
//                       "items": [
//                         {
//                           "name": "Apple",
//                           "quantity": 4,
//                           "price": 20,
//                           "currency": "USD"
//                         },
//                         {
//                           "name": "Pineapple",
//                           "quantity": 5,
//                           "price": 20,
//                           "currency": "USD"
//                         }
//                       ],
//                     }
//                   }
//                 ],
//                 note: "Contact us for any questions on your order.",
//                 onSuccess: (Map params) async {
//                   print("onSuccess: $params");
//                 },
//                 onError: (error) {
//                   print("onError: $error");
//                   Navigator.pop(context);
//                 },
//                 onCancel: () {
//                   print('cancelled:');
//                 },
//               ),
//             ));
//           },
//           style: TextButton.styleFrom(
//             backgroundColor: Colors.blue,
//             foregroundColor: Colors.white,
//             shape: const BeveledRectangleBorder(
//               borderRadius: BorderRadius.all(
//                 Radius.circular(1),
//               ),
//             ),
//           ),
//           child: const Text('Pagar con Paypal'),
//         ),
//       ),
//     );
//   }
// }
