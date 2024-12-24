// import 'package:flutter/material.dart';
// import 'package:meternity_hub/screens/AuthScreen.dart';

// class Splashscreen extends StatelessWidget {
//   const Splashscreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     double ScreenWidht = MediaQuery.of(context).size.width;
//     Future.delayed(const Duration(seconds: 5), () {
//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => Authscreen()));
//     });
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(
//               width: ScreenWidht,
//               height: 550,
//               child: Image.asset(
//                 "images/main_logo.jpg",
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const SizedBox(
//               height: 25,
//             ),
//             const Text(
//               "Maternity Hub",
//               style: TextStyle(
//                   fontFamily: "Heading",
//                   fontSize: 39,
//                   fontWeight: FontWeight.w400),
//             ),
//             const SizedBox(
//               width: 209,
//               child: Divider(
//                 thickness: 0.7,
//                 color: Colors.black,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
