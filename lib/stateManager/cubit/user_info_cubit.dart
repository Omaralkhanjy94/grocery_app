// User Info Cubit
import 'dart:io';
// Dart & Flutter Imports
import 'package:flutter/foundation.dart';
// Package Imports
import 'package:http/http.dart' as http;
// Project Imports
import 'package:grocery_app/core/packages_manager/data_imports.dart';
import 'package:grocery_app/core/packages_manager/network_imports.dart';
import 'package:grocery_app/core/packages_manager/ui_imports.dart';
// Models & Data Imports
import 'package:grocery_app/data/local_storage.dart';
import 'package:grocery_app/models/user.dart';
// State Imports
part 'user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  bool onNameDoubleTap = false;
  bool hasInternet = true;
  File? localImage;
  User? user; // Load user info from local storage or API
  BuildContext? currentContext;
  UserInfoCubit({this.currentContext, this.user}) : super(UserInfoInitial());

  Future<void> loadUserInfo() async {
    emit(UserInfoLoading());
    try {
      user = UserPreferences.getUserFromMap(await LocalStorage.getUserData());
      emit(UserInfoLoaded(user: user));
    } on Exception catch (e) {
      emit(UserInfoError(message: e.toString()));
    }
  }

  void toggleNameEdit() {
    onNameDoubleTap = !onNameDoubleTap;
    emit(UserInfoLoaded(user: user));
  }

  void updateUserInfo(User newUser) {
    user = newUser;
    try {
      emit(UserInfoLoaded(user: user));
    } on Exception catch (e) {
      emit(UserInfoError(message: e.toString()));
    }
  }

  void updateUserAvatar(File? newAvatar) {
    user!.avatarImagePath = newAvatar!.path;
    try {
      emit(UserInfoLoaded(user: user));
    } on Exception catch (e) {
      emit(UserInfoError(message: e.toString()));
    }
  }

  void updateUserName(String newName) {
    user!.name = newName;
    try {
      emit(UserInfoLoaded(user: user));
    } on Exception catch (e) {
      emit(UserInfoError(message: e.toString()));
    }
  }

  String? get email => user?.email;
  set email(String? newEmail) {
    user!.email = newEmail!;
    try {
      emit(UserInfoLoaded(user: user));
    } on Exception catch (e) {
      emit(UserInfoError(message: e.toString()));
    }
  }

  String? get avatarImagePath => user?.avatarImagePath;
  set avatarImagePath(String? newPath) {
    user!.avatarImagePath = newPath!;
    try {
      emit(UserInfoLoaded(user: user));
    } on Exception catch (e) {
      emit(UserInfoError(message: e.toString()));
    }
  }

  String? get name => user?.name;
  set name(String? newName) {
    _updateUserName(newName!);
  }

  /// Avatar Path Getter
  String get avatarPath => user!.avatarImagePath!;
  set avatarPath(String newPath) {
    _updateUserAvatar(File(newPath));
  }

  /// User Logged In Checker
  bool get userLoggedIn => user != null;

  /// Initialize Image
  Future<void> initImage() async {
    // التحقق من توفر الإنترنت
    hasInternet = await _checkInternetConnection();

    // اسم الملف المحلي
    const fileName = 'profile_image.jpg';

    // مجلد التخزين المحلي
    final dir = await getApplicationDocumentsDirectory();
    final filePath = '${dir.path}/$fileName';
    final file = File(filePath);
    if (hasInternet) {
      // تحميل الصورة من الإنترنت وتخزينها
      final downloadedFile = await _downloadAndSaveImage(avatarPath, fileName);
      //   setState(() => localImage = downloadedFile);
      //   context.read<UserInfoCubit>().localImage = downloadedFile;
      _updateLocalImage(downloadedFile);
    } else if (await file.exists()) {
      // إذا كانت الصورة محفوظة مسبقًا
      _updateLocalImage(file);
    } else {
      // لا يوجد إنترنت ولا صورة محفوظة
      _updateLocalImage(null);
    }
  }

  void _updateUserName(String newName) {
    user!.name = newName;
    try {
      emit(UserInfoLoaded(user: user));
    } on Exception catch (e) {
      emit(UserInfoError(message: e.toString()));
    }
  }

  void _updateUserEmail(String newEmail) {
    user!.email = newEmail;
    try {
      emit(UserInfoLoaded(user: user));
    } on Exception catch (e) {
      emit(UserInfoError(message: e.toString()));
    }
  }

  void _updateUserAvatar(File newAvatar) {
    user!.avatarImagePath = newAvatar.path;
    try {
      emit(UserInfoLoaded(user: user));
    } on Exception catch (e) {
      emit(UserInfoError(message: e.toString()));
    }
  }

  void _updateLocalImage(File? newImage) {
    localImage = newImage;
    try {
      emit(UserInfoLoaded(user: user));
    } on Exception catch (e) {
      emit(UserInfoError(message: e.toString()));
    }
  }

  Future<bool> _checkInternetConnection() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    bool b = false;
    for (int ic = 0; ic < connectivityResult.length; ic++) {
      b = connectivityResult[ic] != ConnectivityResult.none;
    }
    return b;
  }

  Future<File> _downloadAndSaveImage(String imageUrl, String fileName) async {
    final dir = await getApplicationDocumentsDirectory();
    final filePath = '${dir.path}/$fileName';

    final response = await http.get(Uri.parse(imageUrl));
    final file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return file;
  }

  ImageProvider _getImageProvider(BuildContext context) {
    if (localImage != null) {
      // الصورة محفوظة محليًا
      if (kDebugMode) {
        print("Loading image from local storage: ${localImage!.toString()}");
      }
      return FileImage(localImage!);
    } else if (hasInternet && userLoggedIn) {
      // يوجد إنترنت ولكن لم تُحفظ الصورة بعد
      try {
        return NetworkImage(user!.avatarImagePath!);
      } on Exception catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "The avatar url is unvalid: $e",
              style: GoogleFonts.poppins(fontSize: 30),
            ),
          ),
        );
        return const AssetImage('assets/images/userImageEmpty.jpg');
      }
    } else {
      // لا يوجد إنترنت ولا صورة محفوظة
      return const AssetImage('assets/images/userImageEmpty.jpg');
    }
  }

  ImageProvider get imageProvider => _getImageProvider(currentContext!);

  bool get onEmailDoubleTap => _onEmailDoubleTap;
  bool _onEmailDoubleTap = false;

  /// Toggle Email Edit
  void toggleEmailEdit() {
    _onEmailDoubleTap = !_onEmailDoubleTap;
    emit(UserInfoLoaded(user: user));
  }
}
