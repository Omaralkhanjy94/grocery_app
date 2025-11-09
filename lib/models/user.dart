class User {
  String email;
  String password;
  String? name;
  String? avatarImagePath;
  String? phoneNumber;
  User(
    this.email,
    this.password, {
    this.name,
    this.avatarImagePath,
    this.phoneNumber,
  });
}
