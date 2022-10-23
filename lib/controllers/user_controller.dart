import 'package:flutter_projects_view/domain/use_case/user_manager.dart';
import 'package:get/get.dart';
import '../domain/entities/user.dart';
import '../domain/repositories/user_repository.dart';
import '../domain/use_case/user_manager.dart';

class UserController extends GetxController {
  UserManager _useCase = Get.find<UserManager>();

  final users = <User>[].obs;

  Future<User> getUser(Map<String, dynamic> user) async {
    return await _useCase.getUser(User.fromJson(user));
  }

  Future<void> addUser(Map<String, dynamic> user) async {
    await _useCase.addUser(User.fromJson(user));
  }

  Future<void> updateUser(Map<String, dynamic> user) async {
    await _useCase.updateUser(User.fromJson(user));
  }

  Future<void> deleteUser(Map<String, dynamic> user) async {
    await _useCase.deleteUser(User.fromJson(user));
  }

  Future<List<Map<String, dynamic>>> getAllUsers() async {
    return await _useCase.getAllUsers();
  }
}
