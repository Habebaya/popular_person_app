import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';

class PopularPersonImageScreen extends StatelessWidget {
  final String selectedImage;

  const PopularPersonImageScreen({Key? key, required this.selectedImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(selectedImage),
              IconButton(
                  onPressed: () async {
                    await GallerySaver.saveImage(selectedImage);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Downloaded"),
                    ));
                  },
                  icon: const Icon(
                    Icons.download,
                    color: Colors.blue,
                    size: 40,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
