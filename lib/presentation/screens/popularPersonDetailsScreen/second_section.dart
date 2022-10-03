import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/business_logic/popular_person_provider.dart';
class SecondSection extends StatefulWidget {
  const SecondSection({Key? key}) : super(key: key);

  @override
  State<SecondSection> createState() => _SecondSectionState();
}

class _SecondSectionState extends State<SecondSection> {
  late PopularPersonProvider popularPersonProvider;
  Future? _future;

  @override
  void initState() {
    super.initState();
    popularPersonProvider =
        Provider.of<PopularPersonProvider>(context, listen: false);
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
