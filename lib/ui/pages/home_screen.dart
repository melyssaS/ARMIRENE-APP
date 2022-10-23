import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_projects_view/controllers/user_controller.dart';
import 'package:flutter_projects_view/ui/widgets/search_component.dart';
import 'package:flutter_projects_view/ui/widgets/card_component.dart';
import 'package:flutter_projects_view/ui/pages/add_screen.dart';

class HomeScreen extends StatefulWidget {
  UserController userController = Get.find<UserController>();
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // List<Map<String, dynamic>> users = await widget.userController.getAllUsers()
    //  print(widget.userController.getAllUsers());
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddScreen()),
            );
          }),
      body: SizedBox(
          child: FutureBuilder(
        future: getCards(),
        builder: (BuildContext context, AsyncSnapshot<List<Widget>> snapshot) {
          if (snapshot.hasData) {
            final cards = snapshot.data ?? [];
            //cards.insert(0, SearchField());
            return Column(children: [SearchField(), ...cards]);
          }
          return Column(children: [SearchField()]);
        },
      )),
    ));
  }

  Future<List<Widget>> getCards() async {
    final users = await widget.userController.getAllUsers();
    final usersList = List.generate(
        users.length,
        (index) => CardEvent(
            user: users[index],
            onPressed: () async {
              await widget.userController.deleteUser(users[index]);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            })).toList();
    // usersList.insert(0, SearchField());
    return usersList;
  }
}
