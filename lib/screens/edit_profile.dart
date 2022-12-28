import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../constants/constants.dart';
import '../model/user_model.dart';
import 'drawer.dart';
import '../widgets/edit_profile_widget.dart';
import '../widgets/user_profile_widget.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController phoneController = TextEditingController();

class _EditProfileState extends State<EditProfile> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  File? _image;
  String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
  String downloadURL = '';
  Future getImage() async {
    XFile? selectedImage;
    selectedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

    //Get a refrence to storage root
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImage = referenceRoot.child('images');

    //Create a reference for the image to be stored
    Reference referenceImageToUpload = referenceDirImage.child(uniqueFileName);

    try {
      //Store the file in the storage
      await referenceImageToUpload.putFile(File(selectedImage!.path));
      //Success: get the download URL for the image
      downloadURL = await referenceImageToUpload.getDownloadURL();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }

    setState(() {
      _image = File(selectedImage!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      key: _globalKey,
      drawer: const NavigationDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        _globalKey.currentState?.openDrawer();
                      },
                      icon: const Icon(Icons.menu, size: FontSize.s40),
                      color: ColorManager.black,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'journal');
                      },
                      icon: const Icon(Icons.close_sharp, size: FontSize.s40),
                      color: ColorManager.black,
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 2, bottom: 10),
                        child: ProfileHeader(profileName: 'Edit Profile'),
                      ),
                      GestureDetector(
                        onTap: () {
                          getImage();
                        },
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: _image == null
                              ? const AssetImage('images/300.png')
                              : FileImage(_image!) as ImageProvider,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProfileText(
                              profileText: 'Name', color: ColorManager.black),
                          const SizedBox(height: 5.0),
                          EditFormField(
                            formFieldText: "Your Name",
                            controller: nameController,
                          ),
                          ProfileText(
                              profileText: 'Email', color: ColorManager.black),
                          const SizedBox(height: 5.0),
                          EditFormField(
                            formFieldText: 'Your Email',
                            controller: emailController,
                          ),
                          ProfileText(
                              profileText: 'Phone Number',
                              color: ColorManager.black),
                          const SizedBox(height: 5.0),
                          EditFormField(
                            formFieldText: 'Your Phone Number',
                            controller: phoneController,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 100.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorManager.darkPurple,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            padding: const EdgeInsets.all(8),
                          ),
                          onPressed: () {
                            updateUserDetails(
                                    nameController.text,
                                    emailController.text,
                                    phoneController.text,
                                    downloadURL)
                                .then(
                              (value) =>
                                  ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Your Data has been Updated'),
                                ),
                              ),
                            );
                            Navigator.pushNamed(context, 'userProfile');
                            nameController.clear();
                            emailController.clear();
                            phoneController.clear();
                          },
                          child: Text(
                            'Save',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: ColorManager.white,
                                fontWeight: FontWeightManager.bold,
                                fontSize: FontSize.s25),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
