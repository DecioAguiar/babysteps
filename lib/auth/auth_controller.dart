class AuthController {
  bool isLoggedIn = false;

  bool login(String username, String password) {
    // Simulate a login process
    if (username == 'user' && password == 'senha') {
      isLoggedIn = true;
      return true;
    }
    return false;
  }

  void logout() {
    // Simulate a logout process
    isLoggedIn = false;
  }

  bool checkAuthStatus() {
    // Check if the user is logged in
    return isLoggedIn;
  }
}