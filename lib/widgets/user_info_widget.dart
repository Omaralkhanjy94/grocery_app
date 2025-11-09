// import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;

// import '../core/packages_manager/ui_imports.dart';
// import '../core/packages_manager/data_imports.dart';
// import '../core/packages_manager/network_imports.dart';
// // import '../core/packages_manager/extensions_imports.dart';

// bool onNameDoubleTap = false;
// bool hasInternet = true;
// File? localImage;

// class UserInfoWidget extends StatelessWidget {
//   UserInfoWidget({super.key});

//   ///User Model obIject
//   final User user = User(
//     currentUserEmail!,
//     currentUserPassword!,
//     avatarImagePath:
//         "https://www.aljazeera.net/wp-content/uploads/2025/03/shutterstock_732700972-1742995170.jpg?resize=1920%2C1440",
//   );

//   final TextEditingController nameController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _initImage();
//   }

//   Future<void> _initImage() async {
//     // التحقق من توفر الإنترنت
//     hasInternet = await _checkInternetConnection();

//     // اسم الملف المحلي
//     const fileName = 'profile_image.jpg';

//     // مجلد التخزين المحلي
//     final dir = await getApplicationDocumentsDirectory();
//     final filePath = '${dir.path}/$fileName';
//     final file = File(filePath);
//     if (hasInternet) {
//       // تحميل الصورة من الإنترنت وتخزينها
//       final downloadedFile = await _downloadAndSaveImage(
//         user.avatarImagePath!,
//         fileName,
//       );
//       setState(() => localImage = downloadedFile);
//     } else if (await file.exists()) {
//       // إذا كانت الصورة محفوظة مسبقًا
//       setState(() => localImage = file);
//     } else {
//       // لا يوجد إنترنت ولا صورة محفوظة
//       setState(() => localImage = null);
//     }
//   }

//   Future<bool> _checkInternetConnection() async {
//     final connectivityResult = await Connectivity().checkConnectivity();
//     bool b = false;
//     for (int ic = 0; ic < connectivityResult.length; ic++) {
//       b = connectivityResult[ic] != ConnectivityResult.none;
//     }
//     return b;
//   }

//   Future<File> _downloadAndSaveImage(String imageUrl, String fileName) async {
//     final dir = await getApplicationDocumentsDirectory();
//     final filePath = '${dir.path}/$fileName';

//     final response = await http.get(Uri.parse(imageUrl));
//     final file = File(filePath);
//     await file.writeAsBytes(response.bodyBytes);
//     return file;
//   }

//   ImageProvider _getImageProvider() {
//     if (localImage != null) {
//       // الصورة محفوظة محليًا
//       if (kDebugMode) {
//         print("Loading image from local storage: ${localImage!.toString()}");
//       }
//       return FileImage(localImage!);
//     } else if (hasInternet && userLoggedIn) {
//       // يوجد إنترنت ولكن لم تُحفظ الصورة بعد
//       try {
//         return NetworkImage(user.avatarImagePath!);
//       } on Exception catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(
//               "The avatar url is unvalid: $e",
//               style: GoogleFonts.poppins(fontSize: 30),
//             ),
//           ),
//         );
//         return const AssetImage('assets/images/userImageEmpty.jpg');
//       }
//     } else {
//       // لا يوجد إنترنت ولا صورة محفوظة
//       return const AssetImage('assets/images/userImageEmpty.jpg');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTapMove: (details) {
//         FocusScope.of(context).unfocus();
//         setState(() {
//           onNameDoubleTap = false;
//         });
//       },
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         spacing: 5,
//         children: [
//           SizedBox(
//             height: 150,
//             child: Stack(
//               children: [
//                 Center(
//                   child: Container(
//                     height: 120,
//                     width: 120,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(100),
//                       image: DecorationImage(
//                         image: user.avatarImagePath! != ""
//                             ? _getImageProvider()
//                             : const AssetImage(
//                                     'assets/images/userImageEmpty.jpg',
//                                   )
//                                   as ImageProvider,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ),

//                 Positioned(
//                   top: 89,
//                   right: 125,
//                   child: IconButton(
//                     onPressed: () {
//                       () async {
//                         if (userLoggedIn) {
//                           //implement image picker
//                           // Add this import at the top of the file:
//                           final ImagePicker picker = ImagePicker();

//                           final ImageSource? source =
//                               await showModalBottomSheet<ImageSource?>(
//                                 context: context,
//                                 builder: (ctx) => SafeArea(
//                                   child: Wrap(
//                                     children: [
//                                       ListTile(
//                                         leading: Icon(Icons.photo_library),
//                                         title: Text('Choose from gallery'),
//                                         onTap: () => Navigator.of(
//                                           ctx,
//                                         ).pop(ImageSource.gallery),
//                                       ),
//                                       ListTile(
//                                         leading: Icon(Icons.camera_alt),
//                                         title: Text('Take a photo'),
//                                         onTap: () => Navigator.of(
//                                           ctx,
//                                         ).pop(ImageSource.camera),
//                                       ),
//                                       ListTile(
//                                         leading: Icon(Icons.close),
//                                         title: Text('Cancel'),
//                                         onTap: () => Navigator.of(ctx).pop(),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               );

//                           if (source == null) return;

//                           final XFile? picked = await picker.pickImage(
//                             source: source,
//                             maxWidth: 1200,
//                             imageQuality: 85,
//                           );
//                           if (picked == null) return;

//                           final bytes = await picked.readAsBytes();
//                           final dir = await getApplicationDocumentsDirectory();
//                           final file = File('${dir.path}/profile_image.jpg');
//                           await file.writeAsBytes(bytes, flush: true);

//                           setState(() {
//                             localImage = file;
//                             hasInternet =
//                                 true; // user just provided a local image
//                           });
//                         } else {
//                           Go.toName('/login');
//                         }
//                       };
//                     },
//                     icon: CircleAvatar(
//                       radius: 25,
//                       backgroundColor: Color(0xFF28B446),
//                       child: Icon(
//                         Icons.camera_alt,
//                         color: Colors.white,
//                         size: 12,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           // User Name with Double Tap to Edit
//           InkWell(
//             onDoubleTap: () {
//               if (userLoggedIn) {
//                 setState(() {
//                   onNameDoubleTap = !onNameDoubleTap;
//                 });
//               } else {
//                 Go.toName('/login');
//               }
//             },
//             child: !onNameDoubleTap
//                 ? Text(
//                     user.name ?? "Double Tap to edit your name",
//                     textAlign: TextAlign.center,
//                     style: GoogleFonts.poppins(
//                       fontSize: 15,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.black,
//                     ),
//                   )
//                 : Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 40),
//                     child: TextField(
//                       controller: nameController,
//                       decoration: InputDecoration(
//                         fillColor: Colors.white,
//                         filled: true,
//                         hintText: "Enter your name",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8),
//                           borderSide: BorderSide(color: Colors.grey, width: 1),
//                         ),
//                         contentPadding: EdgeInsets.symmetric(
//                           horizontal: 12,
//                           vertical: 8,
//                         ),
//                       ),
//                       onSubmitted: (value) {
//                         setState(() {
//                           onNameDoubleTap = false;
//                           user.name = nameController.text;
//                         });
//                       },
//                     ),
//                   ),
//           ),
//           InkWell(
//             onDoubleTap: () {
//               if (userLoggedIn) {
//                 setState(() {
//                   onNameDoubleTap = !onNameDoubleTap;
//                 });
//               } else {
//                 Go.toName('/login');
//               }
//             },
//             child: Text(
//               user.email.isNotEmpty
//                   ? "${user.email.substring(0, 3)}...${user.email.substring(user.email.indexOf('@') - 2, user.email.length)}"
//                   : "No Email|Double Tap to edit your email",
//               style: GoogleFonts.poppins(
//                 fontSize: 12,
//                 color: Color(0xFF868889),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
