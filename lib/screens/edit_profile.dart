import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as fStorage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../constants/color_constants.dart';
import '../data/repositories/user_provider.dart';
import '../data/user_data.dart';
import 'drawer.dart';
import '../widgets/edit_profile_widget.dart';
import '../widgets/user_profile_widget.dart';
import 'package:inmy_head/constants/font_constants.dart';

class EditProfile extends ConsumerStatefulWidget {
  const EditProfile({super.key});

  @override
  ConsumerState<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends ConsumerState<EditProfile> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final userData = UserData();

  File? _image;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  String? imageController;

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
      setState(() {});
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    setState(() {
      _image = File(selectedImage!.path);
    });
  }

  @override
  void initState() {
    super.initState();
    final watchValue = ref.read(userDataProvider).value;
    imageController = watchValue.get('Image');
    downloadURL = imageController!;
    nameController = TextEditingController(text: watchValue.get('Name'));
    emailController = TextEditingController(text: watchValue.get('Email'));
    phoneController =
        TextEditingController(text: watchValue.get('Phone Number').toString());
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
                      color: ColorManager.secondryColor,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'journal');
                      },
                      icon: const Icon(Icons.close_sharp, size: FontSize.s40),
                      color: ColorManager.secondryColor,
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
                        onTap: () async {
                          await getImage();
                          // updateImageInFirestore();
                        },
                        child: downloadURL.isNotEmpty
                            ? CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(downloadURL))
                            : CircleAvatar(
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
                              profileText: 'Name',
                              color: ColorManager.secondryColor),
                          const SizedBox(height: 5.0),
                          EditFormField(
                            formFieldText: "Your Name",
                            controller: nameController,
                          ),
                          ProfileText(
                              profileText: 'Email',
                              color: ColorManager.secondryColor),
                          const SizedBox(height: 5.0),
                          EditFormField(
                            formFieldText: 'Your Email',
                            controller: emailController,
                          ),
                          ProfileText(
                              profileText: 'Phone Number',
                              color: ColorManager.secondryColor),
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
                            backgroundColor: ColorManager.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            padding: const EdgeInsets.all(8),
                          ),
                          onPressed: () {
                            userData
                                .updateUserDetails(
                                    nameController.text,
                                    emailController.text,
                                    phoneController.text,
                                    downloadURL)
                                .then(
                                  (value) => ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('Your Data has been Updated'),
                                    ),
                                  ),
                                );
                            userData.updateEmail(emailController.text).then(
                                  (value) => ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('Your Data has been Updated'),
                                    ),
                                  ),
                                );
                            Navigator.pushNamed(context, 'journal');
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
