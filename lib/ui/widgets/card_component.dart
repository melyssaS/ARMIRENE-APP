import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_projects_view/controllers/user_controller.dart';

// class CardEvent extends StatefulWidget {
//   UserController userController = Get.find<UserController>();
//   final Map<String, dynamic> user;
//   CardEvent({super.key, required this.user});

//   @override
//   State<CardEvent> createState() => _CardEventState();
// }

// class _CardEventState extends State<CardEvent> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Card(
//         child: Column(
//           children: [
//             ListTile(
//               leading: Icon(Icons.people),
//               subtitle: Text(widget.user['idNumber']),
//               title: Text(
//                   "${widget.user['firstName']} ${widget.user['lastName']}"),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 TextButton(
//                   onPressed: () {},
//                   child: Text("Edit"),
//                 ),
//                 IconButton(
//                     onPressed: () async {
//                       await widget.userController.deleteUser(widget.user);
//                     },
//                     icon: const Icon(Icons.delete)),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//     ;
//   }
// }

class CardEvent extends StatelessWidget {
  CardEvent({super.key, required this.user, required this.onPressed});
  UserController userController = Get.find<UserController>();
  final Map<String, dynamic> user;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.people),
              subtitle: Text(user['idNumber']),
              title: Text("${user['firstName']} ${user['lastName']}"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text("Edit"),
                ),
                IconButton(
                    onPressed: () async {
                      await onPressed();
                    },
                    icon: const Icon(Icons.delete)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
