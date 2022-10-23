import 'package:get/get.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

// this file handles the business logic, calling the corresponding repository
class UserManager {
  UserRepository repository = Get.find<UserRepository>();

  Future<void> addUser(User user) async => await repository.addUser(user);

  Future<void> updateUser(User user) async => await repository.updateUser(user);

  Future<void> deleteUser(User user) async => await repository.deleteUser(user);

  Future<User> getUser(User user) async => await repository.getUser(user);

  Future<List<Map<String, dynamic>>> getAllUsers() async =>
      await repository.getAllUsers();
}
