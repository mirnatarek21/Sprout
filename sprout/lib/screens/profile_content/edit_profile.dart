import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sprout/constants.dart';
import 'package:sprout/utils/custom_app_button.dart';
import 'package:sprout/utils/navigation_bar.dart';
import 'package:sprout/utils/profile_input_form.dart';
import 'dart:io';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  void _onTabTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/notifications');
        break;
      case 2:
        Navigator.pushNamed(context, '/community');
        break;
      case 3:
        break;
    }
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();

  final ImagePicker picker = ImagePicker();
  File? _image;

  Future<void> pickImage() async {
    var image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) return;

    setState(() {
      _image = File(image.path);
    });
  }

  Future<void> pickGalleryImage() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;

    setState(() {
      _image = File(image.path);
    });
  }

  void _showImagePickerOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () {
                  pickGalleryImage();
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  pickImage();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Avatar with Camera Icon
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      width: 170,
                      height: 170,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: buttonColor,
                          width: 2.0, // Border width
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.grey[200],
                        backgroundImage: _image != null
                            ? FileImage(_image!)
                            : const AssetImage('assets/images/profile.jpg')
                                as ImageProvider,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.camera_alt),
                      onPressed: () => _showImagePickerOptions(context),
                      iconSize: 30,
                      color: buttonColor,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Name Label and Input Field
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                controller: _nameController,
                hintText: 'Name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Email',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                controller: _emailController,
                hintText: 'Email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Current Password Label and Input Field
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Current Password',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                controller: _passwordController,
                hintText: 'Current Password',
                isPassword: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Date of Birth Label and Input Field
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Date of Birth',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                controller: _dobController,
                hintText: 'Date of Birth',
                isDate: true,
                onSuffixIconTap: () async {
                  DateTime? selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                  );
                  if (selectedDate != null) {
                    _dobController.text =
                        "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select your date of birth';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Country Label and Input Field
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Country/Region',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                controller: _countryController,
                hintText: 'Country/Region',
                isDropdown: true,
                dropdownItems: ['USA', 'Canada', 'India', 'Australia'],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select your country';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              CustomAppButton(label: "Save Changes", onTap: () {})
            ],
          ),
        ),
      ),
      //bottomNavigationBar: const NavigateBar(),
    );
  }
}
