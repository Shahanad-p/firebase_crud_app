import 'package:flutter/material.dart';

class ImagePickerFrom extends StatefulWidget {
  const ImagePickerFrom({super.key});

  @override
  State<ImagePickerFrom> createState() => _ImagePickerFromState();
}

class _ImagePickerFromState extends State<ImagePickerFrom> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 220, 209, 209),
              border: Border.all(),
              borderRadius: BorderRadius.circular(20)),
          margin: EdgeInsets.only(left: 80, right: 80),
          height: 130,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              onTap: () {},
              child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      'assets/hakon-sataoen-qyfco1nfMtg-unsplash.jpg')),
            ),
          ),
        ),
      ],
    );
  }
}
