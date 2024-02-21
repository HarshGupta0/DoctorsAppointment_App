// import 'package:flutter/material.dart';
// import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
// class phonecall extends StatefulWidget {
//   phonecall({super.key});
//   @override
//   State<phonecall> createState() => _phonecallState();
// }
//
// class _phonecallState extends State<phonecall> {
//   final TextEditingController _numberCtrl = TextEditingController();
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _numberCtrl.text = "8505063481";
//   }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Plugin example app'),
//         ),
//         body: Column(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 controller: _numberCtrl,
//                 decoration: const InputDecoration(labelText: "Phone Number"),
//                 keyboardType: TextInputType.number,
//               ),
//             ),
//             ElevatedButton(
//               child: const Text("Test Call"),
//               onPressed: () async {
//                 String phoneNumber = _numberCtrl.text.trim();
//                 if (phoneNumber.isNotEmpty) {
//                   FlutterPhoneDirectCaller.callNumber(phoneNumber);
//                 } else {
//                   // Handle empty phone number case
//                   print("Phone number is empty");
//                 }
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
