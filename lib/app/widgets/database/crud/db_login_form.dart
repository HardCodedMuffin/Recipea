// import 'package:flutter/material.dart';
// import 'package:recipea_app/app/utils/config/theme.dart';
// import 'package:recipea_app/app/ui/recipe_manager/view/db_dashboard_screen.dart';
// import 'package:recipea_app/app/utils/database.dart';
// import 'package:recipea_app/app/utils/db_validator.dart';
//
// import '../../custom_form_field.dart';
//
// class DbLoginForm extends StatefulWidget {
//   final FocusNode focusNode;
//
//   const DbLoginForm({
//     Key? key,
//     required this.focusNode,
//   }) : super(key: key);
//   @override
//   _DbLoginFormState createState() => _DbLoginFormState();
// }
//
// class _DbLoginFormState extends State<DbLoginForm> {
//   final TextEditingController _uidController = TextEditingController();
//
//   final _loginInFormKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _loginInFormKey,
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(
//               left: 8.0,
//               right: 8.0,
//               bottom: 24.0,
//             ),
//             child: Column(
//               children: [
//                 CustomFormField(
//                   controller: _uidController,
//                   focusNode: widget.focusNode,
//                   keyboardType: TextInputType.text,
//                   inputAction: TextInputAction.done,
//                   validator: (value) => DbValidator.validateUserID(
//                     uid: value,
//                   ),
//                   fillColor: Theme.of(context).scaffoldBackgroundColor,
//                   label: 'User ID',
//                   hint: 'Enter your unique identifier',
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(left: 0.0, right: 0.0),
//             child: Container(
//               width: double.maxFinite,
//               child: ElevatedButton(
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all(
//                     Palette.firebaseOrange,
//                   ),
//                   shape: MaterialStateProperty.all(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//                 onPressed: () {
//                   widget.focusNode.unfocus();
//
//                   if (_loginInFormKey.currentState!.validate()) {
//                     Database.userUid = _uidController.text;
//
//                     Navigator.of(context).pushReplacement(
//                       MaterialPageRoute(
//                         builder: (context) => DbDashboardScreen(),
//                       ),
//                     );
//                   }
//                 },
//                 child: Padding(
//                   padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
//                   child: Text(
//                     'LOGIN',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Palette.firebaseGrey,
//                       letterSpacing: 2,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
