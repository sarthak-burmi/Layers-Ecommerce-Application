import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_application_2/Screens/buynowpage.dart';
import 'package:flutter_application_2/Screens/drawer.dart';
import 'package:flutter_application_2/Screens/home_page.dart';
import 'package:flutter_application_2/models/custom_skin_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:image_picker/image_picker.dart';

class CustomSkinPage extends StatefulWidget {
  const CustomSkinPage({super.key});

  @override
  State<CustomSkinPage> createState() => _CustomSkinPageState();
}

class _CustomSkinPageState extends State<CustomSkinPage> {
  final picker = ImagePicker();
  late File? _imageFile = null;
  late String? imageUrl = null;
  String? _selectedBrand;
  String? _selectedModel;
  bool isUploading = false;
  Future getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = File(pickedFile!.path);
    });
  }

  Future uploadImage() async {
    setState(() {
      isUploading = true;
    });

    final User? user = FirebaseAuth.instance.currentUser;
    final String uid = user!.uid;

    //final String fileName = 'skin_image.png';
    final Reference skinImageRef = FirebaseStorage.instance
        .ref()
        .child('usersdata')
        .child(uid)
        .child('skins');

    await skinImageRef.putFile(_imageFile!);

    final String imageUrl = await skinImageRef.getDownloadURL();

    final DocumentReference userDocRef =
        FirebaseFirestore.instance.collection('usersdata').doc(uid);

    final CollectionReference customSkinsRef =
        userDocRef.collection('CustomSkins');

    final DocumentReference customSkinDocRef = customSkinsRef.doc();

    await customSkinDocRef.set({
      'customSkinImageUrl': imageUrl,
      'Brand Selected': _selectedBrand,
      'Model Selected': _selectedModel,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: mydrawer(),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey),
                child: IconButton(
                  icon: const Icon(Icons.more_horiz,
                      color: Colors.black // Change Custom Drawer Icon Color
                      ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                ),
              ),
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            ),
          ),
        ],
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        title: Text("Custom Skins", style: GoogleFonts.roboto()),
        iconTheme: IconThemeData.fallback(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 450,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 50, right: 50),
                child: RichText(
                  text: TextSpan(
                    text: 'Get Your',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                    children: [
                      TextSpan(
                        text: ' Own Custom Skin',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 60, right: 60),
              child: Column(
                children: [
                  RichText(
                    text: TextSpan(
                      text: "Select ",
                      style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                      children: [
                        TextSpan(
                          text: 'Brand',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: DropdownButton<String>(
                        value: _selectedBrand,
                        onChanged: (value) {
                          setState(() {
                            _selectedBrand = value;
                            _selectedModel = null;
                          });
                        },
                        items: [
                          'Apple',
                          'Samsung',
                          'Oneplus',
                          'Nothing',
                          'Oppo',
                          'IQOO',
                          'Realme',
                          'Vivo',
                          'Mi'
                        ]
                            .map<DropdownMenuItem<String>>(
                                (brand) => DropdownMenuItem<String>(
                                      value: brand,
                                      child: Text(brand),
                                    ))
                            .toList(),
                        hint: RichText(
                          text: TextSpan(
                            text: "   Select ",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                            children: [
                              TextSpan(
                                text: 'Brand',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  if (_selectedBrand != null)
                    ModelsDropdown(
                      selectedBrand: _selectedBrand,
                      onModelSelected: (value) {
                        setState(() {
                          _selectedModel = value;
                        });
                      },
                    ),
                  SizedBox(height: 25.0),
                  if (_selectedModel != null)
                    Container(
                      height: 50,
                      width: 310,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'Selected Model: $_selectedModel',
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Column(
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 250,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange, // Background color
                          ),
                          onPressed: getImage,
                          child: Text(
                            'Upload Image',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      _imageFile == null
                          ? Container(
                              height: 300,
                              width: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: RichText(
                                  text: TextSpan(
                                    text: 'No Skin',
                                    style: TextStyle(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                    children: [
                                      TextSpan(
                                        text: ' Selected',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              height: 300,
                              width: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: SizedBox(
                                  child: Image.file(
                                _imageFile!,
                                // height: 200,
                                // width: 200,
                              ))),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange, // Background color
                          ),
                          onPressed: () async {
                            if (_imageFile == null ||
                                _selectedBrand == null ||
                                _selectedModel == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  backgroundColor: Colors.red,
                                  behavior: SnackBarBehavior.floating,
                                  margin: EdgeInsets.only(
                                      bottom: 720, left: 10, right: 10),
                                  content: Row(
                                    children: [
                                      Text("Please Select all Fields Above"),
                                      SizedBox(width: 5),
                                      CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 12,
                                          child: Icon(Icons.block,
                                              color: Colors.red)),
                                    ],
                                  ),
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            } else {
                              uploadImage();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  backgroundColor: Colors.green,
                                  behavior: SnackBarBehavior.floating,
                                  margin: EdgeInsets.only(
                                      bottom: 720, left: 10, right: 10),
                                  content: Row(
                                    children: [
                                      Text(
                                          "Recived Your Image We will Contact You soon"),
                                      SizedBox(width: 5),
                                      CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 12,
                                          child: Icon(
                                            Icons.check,
                                            color: Colors.green,
                                          )),
                                    ],
                                  ),
                                  duration: Duration(seconds: 3),
                                ),
                              );

                              Navigator.pushNamed(context, '/home');
                            }
                          },
                          child: Text(
                            "Submit Your Request",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
