import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:movielisting/models/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserProvider with ChangeNotifier {
  List<User> _users = [];
  User? _easyLoginUser;
  bool? _isloggedIn = false;
  String? _signupErrorMessage;
  bool _signupError = false;
  String? _loginErrorMessage;
  bool _loginError = false;

  List<User> get users => _users;

  User? get easyLoginUser => _easyLoginUser;

  String? get loginErrorMessage => _loginErrorMessage;

  bool get loginError => _loginError;

  bool get isloggedIn => _isloggedIn!;

  String? get signupErrorMessage => _signupErrorMessage;

  bool get signupError => _signupError;

  UserProvider() {
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String filePath = '${appDocDir.path}/users.json';
    File file = File(filePath);

    if (await file.exists()) {
      String fileContent = await file.readAsString();
      List<dynamic> userList = json.decode(fileContent);
      _users = userList.map((json) => User.fromJson(json)).toList();

      // _easyLoginUser = _users.firstWhere((user) => user.easyLogin);

      notifyListeners();
    }
  }

  Future<bool> addUser(User newUser) async {
    try {
      _signupError = false;
      _signupErrorMessage = '';
      notifyListeners();
      var user = users.firstWhere(
        (user) => user.phone == newUser.phone,
        orElse: () {
          return User(
            name: '',
            password: '',
            email: '',
            phone: '',
            profession: '',
          );
        },
      );
      print(user);
      if (user.name != '') {
        _signupErrorMessage = 'Phone number already exists';
        _signupError = true;
        notifyListeners();
        return false;
      }
      user = users.firstWhere(
        (user) => user.email == newUser.email,
        orElse: () {
          return User(
            name: '',
            password: '',
            email: '',
            phone: '',
            profession: '',
          );
        },
      );
      if (user.email != '') {
        _signupErrorMessage = 'Email already exists';
        _signupError = true;
        notifyListeners();
        return false;
      }
      _users.add(newUser);
      await _saveUsers();
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> _saveUsers() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String filePath = '${appDocDir.path}/users.json';
    File file = File(filePath);

    List<Map<String, dynamic>> jsonList =
        _users.map((user) => user.toJson()).toList();
    await file.writeAsString(json.encode(jsonList));
  }

  Future<bool> checkCredentials(String name, String password) async {
    User? user = _users.firstWhere(
      (user) => user.name == name,
      orElse: () {
        return User(
          name: '',
          password: '',
          email: '',
          phone: '',
          profession: '',
        );
      },
    );

    if (user.name == '') {
      _loginErrorMessage = 'User not found';
      _loginError = true;
      notifyListeners();
      return false;
    }
    print(" user passowrd${user.password}");
    if (user.password != password) {
      _loginErrorMessage = 'Incorrect password';
      _loginError = true;
      print(users);
      notifyListeners();
      return false;
    }
    _isloggedIn = true;

    return true;
  }
}
