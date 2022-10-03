import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/business_logic/popular_person_provider.dart';
import 'package:task/constant/api.dart';
import 'package:task/data/models/popular_person_model.dart';
import 'package:task/presentation/screens/popularPersonDetailsScreen/image_screen.dart';

class SecondSection extends StatefulWidget {
  final PopularPerson popularPerson;

  const SecondSection({Key? key, required this.popularPerson})
      : super(key: key);

  @override
  State<SecondSection> createState() => _SecondSectionState();
}

class _SecondSectionState extends State<SecondSection> {
  late PopularPersonProvider popularPersonProvider;
  late String selectedImage;

  @override
  void initState() {
    super.initState();
    popularPersonProvider =
        Provider.of<PopularPersonProvider>(context, listen: false);
    popularPersonProvider.getPopularPersonImage(widget.popularPerson.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Text(
            "Images",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Consumer<PopularPersonProvider>(
            builder: (context, popularPersonProvider, _) => GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 6,
                    childAspectRatio: 0.63,
                    crossAxisCount: 3),
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.all(8),
                itemCount: popularPersonProvider.images.length,
                itemBuilder: (ctx, index) {
                  return InkWell(
                    onTap: () {
                      selectedImage = APIConstants.imageBaseUrl +
                          popularPersonProvider.images[index].filePath!;
                      Navigator.push(
                          context,
                      MaterialPageRoute(
                          builder: (context) => PopularPersonImageScreen(
                              selectedImage: selectedImage)));

                    },
                    child: Image.network(
                      APIConstants.imageBaseUrl +
                          popularPersonProvider.images[index].filePath!,
                    ),
                  );
                })),
      ],
    );
  }
}
