// import 'package:flutter/material.dart';
// import 'package:recipea_app/app/utils/config/theme.dart';
// import 'package:recipea_app/app/widgets/app_bar_title.dart';
// import 'package:recipea_app/app/widgets/database/crud/db_item_list.dart';
//
// import 'db_add_item_form.dart';
//
// class DbDashboardScreen extends StatefulWidget {
//   @override
//   _DbDashboardScreenState createState() => _DbDashboardScreenState();
// }
//
// class _DbDashboardScreenState extends State<DbDashboardScreen> {
//   final FocusNode _nameFocusNode = FocusNode();
//   final FocusNode _emailFocusNode = FocusNode();
//   final FocusNode _passwordFocusNode = FocusNode();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0.0,
//         backgroundColor: Colors.transparent,
//         title: FloatingActionButton(
//           onPressed: () {
//             Navigator.of(context).push(
//               MaterialPageRoute(
//                 builder: (context) => AddRecipePage(),
//               ),
//             );
//           },
//           backgroundColor: Theme.of(context).buttonColor,
//           child: Icon(
//             Icons.add,
//             color: Colors.white,
//             size: 32,
//           ),
//         ),
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.only(
//             left: 16.0,
//             right: 16.0,
//             bottom: 20.0,
//           ),
//           child: DbItemList(),
//         ),
//       ),
//     );
//   }
// }
