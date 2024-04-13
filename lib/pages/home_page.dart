import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart' as tfl;
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  File? image;
  late ImagePicker imagePicker;
  var result = "result show here";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imagePicker = ImagePicker();
    loadModel();
  }

  //load model
  loadModel() async {
    final interpreter =
        await tfl.Interpreter.fromAsset('lib/converted_model.tflite');
  }

  chooseImage() async {
    XFile? selectedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (selectedImage != null) {
      image = File(selectedImage.path);

      setState(() {
        image;
      });
    }
  }

  captureImage() async {
    XFile? selectedImage =
        await imagePicker.pickImage(source: ImageSource.camera);
    if (selectedImage != null) {
      image = File(selectedImage.path);
    }
  }

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: signUserOut, icon: Icon(Icons.logout))],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image == null
                ? Icon(
                    Icons.image_rounded,
                    size: 30,
                  )
                : Image.file(image!),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    chooseImage();
                  },
                  child: Text('Upload'),
                ),
                ElevatedButton(
                  onPressed: () {
                    captureImage();
                  },
                  child: Text('Capture'),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    chooseImage();
                  },
                  child: Text('Predict'),
                ),
                Text(result),
              ],
            ),
          ],
        ),
        // child: Text(
        //   "Logged in as:" + user.email!,
        //   style: TextStyle(fontSize: 20),
        // ),
      ),
    );
  }
}
