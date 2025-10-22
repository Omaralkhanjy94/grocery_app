class User {
  String email;
  String password;
  User(this.email, this.password);

  void addUser() {
    if (!users.contains(User(email, password))) {
      users.add(User(email, password));
    }
  }
}

List<User> users = [];
