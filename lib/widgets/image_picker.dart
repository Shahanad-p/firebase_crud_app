import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerFrom extends StatefulWidget {
  const ImagePickerFrom({Key? key}) : super(key: key);

  @override
  State<ImagePickerFrom> createState() => _ImagePickerFromState();
}

class _ImagePickerFromState extends State<ImagePickerFrom> {
  File? _image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 220, 209, 209),
            border: Border.all(),
            borderRadius: BorderRadius.circular(20),
          ),
          margin: EdgeInsets.only(left: 80, right: 80),
          height: 130,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              onTap: () {
                showBottomSheet(
                  context: context,
                  builder: ((builder) => Container(
                        height: 120,
                        color: Colors.grey,
                        width: double.infinity,
                        child: Column(
                          children: [
                            SizedBox(height: 10),
                            Text(
                              'Choose Image From',
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {
                                    _getImage(ImageSource.gallery);
                                  },
                                  icon: Icon(Icons.image),
                                  label: Text('Gallery'),
                                ),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    _getImage(ImageSource.camera);
                                  },
                                  icon: Icon(Icons.camera),
                                  label: Text('Camera'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                );
              },
              child: _image == null
                  ? Image.asset(
                      'assets/hakon-sataoen-qyfco1nfMtg-unsplash.jpg',
                      fit: BoxFit.cover,
                    )
                  : Image.file(
                      _image!,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }
}
