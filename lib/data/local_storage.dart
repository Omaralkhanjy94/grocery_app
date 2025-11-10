import 'package:grocery_app/models/user.dart';

class LocalStorage {
  static Future<Map<String, dynamic>> getUserData() async {
    // Simulate a delay
    await Future.delayed(Duration(seconds: 1));
    return {
      'id': '001',
      'email': 'omaralkhanji@gmail.com',
      'password': '123456',
      'name': 'Omar Alkhanji',
      'avatarImagePath': 'assets/images/userImageEmpty.jpg',
      'phoneNumber': '+962795372616',
    };
  }

  static User getUserFromMap(Map<String, dynamic> userMap) {
    return User(
      userMap['id'],
      userMap['email'],
      userMap['password'],
      name: userMap['name'],
      avatarImagePath: userMap['avatarImagePath'],
      phoneNumber: userMap['phoneNumber'],
    );
  }
}
