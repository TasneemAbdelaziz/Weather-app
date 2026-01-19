// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class AlertDialogToGoout extends StatelessWidget {
//   const AlertDialogToGoout({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: Text("Prediction Result"),
//         content: Text(result == 1 ? "Yes, it's suitable to go out!" : "Better stay in today."),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text("OK"),
//           ),
//         ],
//       ),
//     );
//   }
// }

// endDrawer: SizedBox(
//   width: 200,
//   child:
// Drawer(
//   child: ListView(
//     children: const [
//       DrawerHeader(
//         decoration: BoxDecoration(color: Colors.blue),
//         child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
//       ),
//       ListTile(
//         leading: Icon(Icons.logout),
//         title: Text('Log out'),
//       ),
//       ListTile(
//         leading: Icon(Icons.settings),
//         title: Text('Settings'),
//       ),
//     ],
//   ),
// ),
// ),