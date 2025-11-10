import 'dart:io';

import '../core/packages_manager/ui_imports.dart';
import '../core/packages_manager/network_imports.dart';
import '../core/packages_manager/state_imports.dart';

bool onNameDoubleTap = false;
bool hasInternet = true;
File? localImage;

class UserInfoWidget extends StatelessWidget {
  UserInfoWidget({super.key});

  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserInfoCubit(user: context.read<UserInfoCubit>().user)..loadUserInfo(),
      child: GestureDetector(
        onTapMove: (details) {
          FocusScope.of(context).unfocus();
          // setState(() {
          //   onNameDoubleTap = false;
          // });
          context.read<UserInfoCubit>().onNameDoubleTap = false;
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 5,
          children: [
            SizedBox(
              height: 150,
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                          image:
                              context.read<UserInfoCubit>().avatarImagePath! !=
                                  ""
                              ? context.read<UserInfoCubit>().localImage != null
                                    ? FileImage(
                                        context
                                            .read<UserInfoCubit>()
                                            .localImage!,
                                      )
                                    : hasInternet
                                    ? NetworkImage(
                                        context
                                            .read<UserInfoCubit>()
                                            .avatarImagePath!,
                                      )
                                    : const AssetImage(
                                            'assets/images/userImageEmpty.jpg',
                                          )
                                          as ImageProvider
                              : const AssetImage(
                                      'assets/images/userImageEmpty.jpg',
                                    )
                                    as ImageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 89,
                    right: 125,
                    child: IconButton(
                      onPressed: () {
                        () async {
                          if (userLoggedIn) {
                            //implement image picker
                            // Add this import at the top of the file:
                            final ImagePicker picker = ImagePicker();

                            final ImageSource? source =
                                await showModalBottomSheet<ImageSource?>(
                                  context: context,
                                  builder: (ctx) => SafeArea(
                                    child: Wrap(
                                      children: [
                                        ListTile(
                                          leading: Icon(Icons.photo_library),
                                          title: Text('Choose from gallery'),
                                          onTap: () => Navigator.of(
                                            ctx,
                                          ).pop(ImageSource.gallery),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.camera_alt),
                                          title: Text('Take a photo'),
                                          onTap: () => Navigator.of(
                                            ctx,
                                          ).pop(ImageSource.camera),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.close),
                                          title: Text('Cancel'),
                                          onTap: () => Navigator.of(ctx).pop(),
                                        ),
                                      ],
                                    ),
                                  ),
                                );

                            if (source == null) return;

                            final XFile? picked = await picker.pickImage(
                              source: source,
                              maxWidth: 1200,
                              imageQuality: 85,
                            );
                            if (picked == null) return;

                            final bytes = await picked.readAsBytes();
                            final dir =
                                await getApplicationDocumentsDirectory();
                            final file = File('${dir.path}/profile_image.jpg');
                            await file.writeAsBytes(bytes, flush: true);

                            //   setState(() {
                            //     localImage = file;
                            //     hasInternet =
                            //         true; // user just provided a local image
                            //   });
                            context.read<UserInfoCubit>().localImage = file;
                          } else {
                            Go.toName('/login');
                          }
                        };
                      },
                      icon: CircleAvatar(
                        radius: 25,
                        backgroundColor: Color(0xFF28B446),
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // User Name with Double Tap to Edit
            InkWell(
              onDoubleTap: () {
                if (userLoggedIn) {
                  // setState(() {
                  //   onNameDoubleTap = !onNameDoubleTap;
                  // });
                  context.read<UserInfoCubit>().onNameDoubleTap = !context
                      .read<UserInfoCubit>()
                      .onNameDoubleTap;
                } else {
                  Go.toName('/login');
                }
              },
              child: !context.read<UserInfoCubit>().onNameDoubleTap
                  ? Text(
                      context.read<UserInfoCubit>().name ??
                          "Double Tap to edit your name",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Enter your name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                        ),
                        onSubmitted: (value) {
                          context.read<UserInfoCubit>().name =
                              nameController.text;
                        },
                      ),
                    ),
            ),
            InkWell(
              onDoubleTap: () {
                if (userLoggedIn) {
                  context.read<UserInfoCubit>().toggleEmailEdit();
                } else {
                  Go.toName('/login');
                }
              },
              child: Text(
                context.read<UserInfoCubit>().email!.isNotEmpty
                    ? "${context.read<UserInfoCubit>().email!.substring(0, 3)}...${context.read<UserInfoCubit>().email!.substring(context.read<UserInfoCubit>().email!.indexOf('@') - 2, context.read<UserInfoCubit>().email!.length)}"
                    : "No Email|Double Tap to edit your email",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Color(0xFF868889),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
