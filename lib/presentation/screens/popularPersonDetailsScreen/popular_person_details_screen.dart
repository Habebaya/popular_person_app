import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/data/models/popular_person_model.dart';
import 'package:task/presentation/screens/popularPersonDetailsScreen/first_section.dart';
import 'package:task/presentation/screens/popularPersonDetailsScreen/second_section.dart';

import '../../../../business_logic/popular_person_provider.dart';

class PopularPersonDetailsScreen extends StatefulWidget {
  final PopularPerson popularPerson ;

 const  PopularPersonDetailsScreen({Key? key, required this.popularPerson})
      : super(key: key);

  @override
  State<PopularPersonDetailsScreen> createState() =>
      _PopularPersonDetailsScreenState();
}

class _PopularPersonDetailsScreenState
    extends State<PopularPersonDetailsScreen> {
  late PopularPersonProvider popularPersonProvider;
  Future? _future;

  @override
  void initState() {
    super.initState();
    popularPersonProvider =
        Provider.of<PopularPersonProvider>(context, listen: false);
    _future = popularPersonProvider.getPopularPerson(widget.popularPerson.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Popular Person Details"),
          centerTitle: true,
          backgroundColor: Colors.black,

        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                  future: _future,
                  builder: (c, s) {
                    if (s.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return FirstSection(popularPerson: popularPersonProvider.popularPerson);
                    }
                  }),
              SecondSection(popularPerson: widget.popularPerson)
            ],
          ),
        ));
  }
}
