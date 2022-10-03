import 'package:flutter/material.dart';
class PopularPersonImageScreen extends StatelessWidget {
  final String selectedImage;
   const PopularPersonImageScreen({Key? key,required this.selectedImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.black54,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Hero(
              tag: "currentImage",
                child: Image.network(selectedImage)),
            IconButton(onPressed: (){
              print("Download");
            }, icon: Icon(Icons.download,color: Colors.blue,size: 40,))
          ],
        ),
      ),
    );
  }
}
