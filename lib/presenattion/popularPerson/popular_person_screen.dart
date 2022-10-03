import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/business_logic/popular_person_provider.dart';

class PopularPersonScreen extends StatefulWidget {
  const PopularPersonScreen({Key? key}) : super(key: key);

  @override
  State<PopularPersonScreen> createState() => _PopularPersonScreenState();
}

class _PopularPersonScreenState extends State<PopularPersonScreen> {
  late PopularPersonProvider popularPersonProvider;
  Future? _future;

  @override
  void initState() {
    super.initState();
    popularPersonProvider =
        Provider.of<PopularPersonProvider>(context, listen: false);
    _future = popularPersonProvider.getAllPopularPerson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("PopularPerson"),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: _future,
            builder: (c, s) {
              if (s.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            crossAxisSpacing: 2.0,
                            mainAxisSpacing: 2.0,
                            childAspectRatio: 0.5),
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: popularPersonProvider.popularPersonList.length,
                    itemBuilder: (ctx, index) {
                      return Text(popularPersonProvider
                          .popularPersonList[index].name
                          .toString());
                    });
              }
            }));
  }
}