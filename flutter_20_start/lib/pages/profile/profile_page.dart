import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_20_start/providers/user_Provider.dart';
import 'package:flutter_20_start/services/auth_service.dart';
import 'package:flutter_20_start/services/firestore_service.dart';
import 'package:flutter_20_start/widgets/ColorsField/colorsField.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _newProfileImage;

  final picker = ImagePicker();

  Future pickProfileImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _newProfileImage = File(pickedFile.path);
      });
      await uploadImage();
    }
  }

  Future uploadImage() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    if (userProvider.user == null || _newProfileImage == null) return;

    try {
      final firestore = FirestoreService();

      // Upload image to Firebase Storage and get URL
      String imageUrl = await firestore.uploadProfileImage(
        uid: userProvider.user!.uid,
        image: _newProfileImage!,
      );

      // Update Firestore
      await firestore.updateProfileImage(
        uid: userProvider.user!.uid,
        imageUrl: imageUrl,
      );

      // Update Provider
      userProvider.updateImage(imageUrl);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Profile image updated!")));
    } catch (e) {
      print("Error uploading image: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Failed to upload image: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Profile"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colorsfield.customBlackColorField(),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: pickProfileImage,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: _newProfileImage != null
                            ? FileImage(_newProfileImage!)
                            : (userProvider.imageUrl != null &&
                                      userProvider.imageUrl!.isNotEmpty
                                  ? NetworkImage(userProvider.imageUrl!)
                                        as ImageProvider
                                  : null),
                        child:
                            (_newProfileImage == null &&
                                (userProvider.imageUrl == null ||
                                    userProvider.imageUrl!.isEmpty))
                            ? const Icon(Icons.add_a_photo, size: 50)
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
              Text("Profile Page"),
              SizedBox(height: 20),
              userProvider.user != null
                  ? Text("Hello  ${userProvider.name}")
                  : Text("No user logged in"),
              Text("phoneNumber: ${userProvider.phoneNumber}"),

              SizedBox(height: 90),
              ElevatedButton(
                onPressed: () async {
                  await AuthService().logOut();
                  userProvider.clearUser();

                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: Text("LOG OUT"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
