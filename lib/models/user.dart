class User {
  String id;
  String email;
  String password;
  String? name;
  String? avatarImagePath;
  String? phoneNumber;
  User(
    this.id,
    this.email,
    this.password, {
    this.name,
    this.avatarImagePath,
    this.phoneNumber,
  });
}

class UserPreferences {
  static const String userIdKey = 'user_id';
  static const String nameKey = 'name';
  static const String emailKey = 'email';
  static const String avatarUrlKey = 'avatar_url';
  static const String phoneNumberKey = 'phone_number';

  static User getUserFromMap(Map<String, dynamic> map) {
    return User(
      map[userIdKey] ?? '',
      map[emailKey] ?? '',
      '',
      name: map[nameKey],
      avatarImagePath: map[avatarUrlKey],
      phoneNumber: map[phoneNumberKey],
    );
  }

  static Map<String, String?> toMap(User user) {
    return {
      userIdKey: user.id,
      nameKey: user.name,
      emailKey: user.email,
      avatarUrlKey: user.avatarImagePath,
      phoneNumberKey: user.phoneNumber,
    };
  }
}
