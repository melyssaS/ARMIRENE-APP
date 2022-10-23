import 'package:flutter/material.dart';
import 'package:flutter_projects_view/controllers/user_controller.dart';
import 'package:flutter_projects_view/domain/repositories/user_repository.dart';
import 'package:flutter_projects_view/ui/pages/home_screen.dart';
import 'package:flutter_projects_view/ui/pages/initial_screen.dart';
import 'package:flutter_projects_view/ui/pages/add_screen.dart';
import 'package:flutter_projects_view/ui/pages/edit_screen.dart';
import 'package:flutter_projects_view/domain/use_case/user_manager.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserController(), fenix: true);
    Get.lazyPut(() => UserRepository(), fenix: true);
    Get.lazyPut(() => UserManager(), fenix: true);
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBinding(),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AddScreen(),
    );
  }
}
