class AuthServices {
  Future<bool> login(String username, String password) async {
    await Future.delayed(Duration(seconds: 2));
    return true;
  }

  Future<bool> register(String username, String password) async {
    await Future.delayed(Duration(seconds: 2));
    return true;
  }
}
