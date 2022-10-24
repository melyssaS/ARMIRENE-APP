import 'package:flutter/material.dart';
import 'package:flutter_projects_view/ui/pages/edit_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_projects_view/controllers/user_controller.dart';

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
              subtitle: Text(user['email']),
              title: Text("${user['firstName']} ${user['lastName']}"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditScreen(user: user)),
                    );
                  },
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
