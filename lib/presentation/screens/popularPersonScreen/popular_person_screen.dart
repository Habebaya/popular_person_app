import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/business_logic/popular_person_provider.dart';
import 'package:task/presentation/screens/popularPersonScreen/popular_person_item.dart';

class PopularPersonScreen extends StatefulWidget {
  const PopularPersonScreen({Key? key}) : super(key: key);

  @override
  State<PopularPersonScreen> createState() => _PopularPersonScreenState();
}

class _PopularPersonScreenState extends State<PopularPersonScreen> {
  late PopularPersonProvider popularPersonProvider;
  Future? _future;
  int page = 1;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    popularPersonProvider =
        Provider.of<PopularPersonProvider>(context, listen: false);
    _future = popularPersonProvider.getAllPopularPerson(page);
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        page += 1;
        await popularPersonProvider.getAllPopularPerson(page);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Popular Person"),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: FutureBuilder(
            future: _future,
            builder: (c, s) {
              if (s.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return GridView.builder(
                    controller: scrollController,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 300,
                            crossAxisSpacing: 0.5,
                            mainAxisSpacing: 1,
                            childAspectRatio: 0.8),
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: Provider.of<PopularPersonProvider>(context).popularPersonList.length,
                    itemBuilder: (ctx, index) {
                      return PopularPersonItem(
                        popularPerson:
                            popularPersonProvider.popularPersonList[index],
                      );
                    });
              }
            }));
  }
}
