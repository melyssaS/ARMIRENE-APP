import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';
import '../../data/datasources/user_local_datasource_sqflite.dart';
import '../entities/user.dart';

// here we call the corresponding local source
class UserRepository {
  late UserLocalDataSource localDataSource;

  UserRepository() {
    logInfo("Starting UserRepository");
    localDataSource = UserLocalDataSource();
  }

  Future<void> addUser(User user) async {
    await localDataSource.addUser(user);
  }

  Future<void> updateUser(User user) async {
    await localDataSource.updateUser(user);
  }

  Future<void> deleteUser(User user) async {
    await localDataSource.deleteUser("${user.id}");
  }

  Future<User> getUser(User user) async {
    return await localDataSource.getUser("${user.id}");
  }

  Future<int> countEmails(User user) async {
    return await localDataSource.countEmails(user);
  }

  Future<List<Map<String, dynamic>>> getAllUsers() async =>
      await localDataSource.getAllUsers();
}
