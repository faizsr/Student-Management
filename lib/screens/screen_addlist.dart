import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_management/db/db_function.dart';
import 'package:student_management/model/model.dart';
import 'package:student_management/screens/screen_studentlist.dart';

class ScreenHome extends StatefulWidget {
  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final _formKey = GlobalKey<FormState>();
  final rollnoController = TextEditingController();
  final nameController = TextEditingController();
  final departmentController = TextEditingController();
  final phonenoController = TextEditingController();
  File? _selectedImage;

  void setImage(File image) {
    setState(() {
      _selectedImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    // String appTitle;

    // if (widget.update == true) {
    //   appTitle = 'Update Details';
    // } else {
    //   appTitle = 'Add New Student';
    // }
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: const Text(
            'Add New Student',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 23),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ScreenStudentList()));
              },
              icon: const Icon(Icons.person_search_outlined),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 15),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    //Getting image from gallery:

                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white10, width: 2),
                          borderRadius: BorderRadius.circular(100)),
                      child: CircleAvatar(
                        backgroundColor: const Color.fromARGB(255, 60, 60, 71),
                        radius: 65,
                        child: GestureDetector(
                          onTap: () async {
                            File? pickImage = await pickImageFromCamera();
                            setState(() {
                              _selectedImage = pickImage;
                            });
                          },
                          child: _selectedImage != null
                              ? ClipOval(
                                  child: Image.file(
                                    _selectedImage!,
                                    fit: BoxFit.cover,
                                    width: 140,
                                    height: 140,
                                  ),
                                )
                              : const Icon(
                                  Icons.add_a_photo_outlined,
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    // Name field:

                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: nameController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        labelText: 'Name',
                        labelStyle: const TextStyle(color: Colors.white54),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.white10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                              width: 2, color: Colors.lightBlue),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.white10),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                              width: 2, color: Colors.lightBlue),
                        ),
                        contentPadding: const EdgeInsets.only(
                            left: 20, top: 20, bottom: 20),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field is required';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    // Roll number field:

                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: rollnoController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Roll number',
                        labelStyle: const TextStyle(color: Colors.white54),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.white10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                              width: 2, color: Colors.lightBlue),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.white10),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                              width: 2, color: Colors.lightBlue),
                        ),
                        contentPadding: const EdgeInsets.only(
                            left: 20, top: 20, bottom: 20),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field is required';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    // Department field:

                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: departmentController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Department',
                        labelStyle: const TextStyle(color: Colors.white54),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                              width: 2, color: Colors.lightBlue),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.white10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.white10),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                              width: 2, color: Colors.lightBlue),
                        ),
                        contentPadding: const EdgeInsets.only(
                            left: 20, top: 20, bottom: 20),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field is required';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    // Phone number field:

                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: phonenoController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.white10),
                        ),
                        labelText: 'Phone number',
                        labelStyle: const TextStyle(color: Colors.white54),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.white10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                              width: 2, color: Colors.lightBlue),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                              width: 2, color: Colors.lightBlue),
                        ),
                        contentPadding: const EdgeInsets.only(
                            left: 20, top: 20, bottom: 20),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field is required';
                        }
                        final phoneRegExp = RegExp(r'^[0-9]{10}$');
                        if (!phoneRegExp.hasMatch(value)) {
                          return 'Invalid phone number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),

                    //Save button:

                    SizedBox(
                      height: 40,
                      width: 80,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            if (_selectedImage == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(
                                    "You must select an image",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              );
                              return;
                            }
                            final student = StudentModel(
                              rollno: rollnoController.text,
                              name: nameController.text,
                              department: departmentController.text,
                              phoneno: phonenoController.text,
                              imageurl: _selectedImage != null
                                  ? _selectedImage!.path
                                  : null,
                            );
                            await addStudent(student);

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.green,
                                content: Text(
                                  "Data Added Successfully",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                            rollnoController.clear();
                            nameController.clear();
                            departmentController.clear();
                            phonenoController.clear();
                            setState(() {
                              _selectedImage = null;
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 60, 60, 71),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text(
                          'SAVE',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<File?> pickImageFromCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      return File(pickedImage.path);
    }
    return null;
  }
}
