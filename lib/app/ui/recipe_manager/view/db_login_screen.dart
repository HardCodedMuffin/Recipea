// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:recipea_app/app/utils/config/theme.dart';
// import 'package:recipea_app/app/widgets/database/crud/db_login_form.dart';
//
// class DbLoginScreen extends StatefulWidget {
//   @override
//   _DbLoginScreenState createState() => _DbLoginScreenState();
// }
//
// class _DbLoginScreenState extends State<DbLoginScreen> {
//   final FocusNode _uidFocusNode = FocusNode();
//
//   Future<FirebaseApp> _initializeFirebase() async {
//     FirebaseApp firebaseApp = await Firebase.initializeApp();
//
//     return firebaseApp;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => _uidFocusNode.unfocus(),
//       child: Scaffold(
//         backgroundColor: Palette.firebaseNavy,
//         body: SafeArea(
//           child: Stack(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(
//                   left: 16.0,
//                   right: 16.0,
//                   bottom: 20.0,
//                 ),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.max,
//                   children: [
//                     Row(),
//                     Expanded(
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Flexible(
//                             flex: 1,
//                             child: Image.asset(
//                               'assets/firebase_logo.png',
//                               height: 160,
//                             ),
//                           ),
//                           SizedBox(height: 20),
//                           Text(
//                             'FlutterFire',
//                             style: TextStyle(
//                               color: Palette.firebaseYellow,
//                               fontSize: 40,
//                             ),
//                           ),
//                           Text(
//                             'CRUD',
//                             style: TextStyle(
//                               color: Palette.firebaseOrange,
//                               fontSize: 40,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     FutureBuilder(
//                       future: _initializeFirebase(),
//                       builder: (context, snapshot) {
//                         if (snapshot.hasError) {
//                           return Text('Error initializing Firebase');
//                         } else if (snapshot.connectionState ==
//                             ConnectionState.done) {
//                           return DbLoginForm(focusNode: _uidFocusNode);
//                         }
//                         return CircularProgressIndicator(
//                           valueColor: AlwaysStoppedAnimation<Color>(
//                             Palette.firebaseOrange,
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 8.0, left: 8.0),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.black26,
//                       borderRadius: BorderRadius.circular(30.0),
//                     ),
//                     child: BackButton(),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
