import 'package:flutter/material.dart';
import 'package:task/constant/api.dart';
import 'package:task/data/models/popular_person_model.dart';

class FirstSection extends StatelessWidget {
  final PopularPerson popularPerson;

  const FirstSection({Key? key, required this.popularPerson}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Hero(
                    tag: popularPerson.id.toString(),
                    child: Container(
                      padding: const EdgeInsets.only(right: 10,bottom: 10),
                      width: MediaQuery.of(context).size.width * 0.5,
                      color: Colors.white,
                      child: Image.network(
                        '${APIConstants.imageBaseUrl}${popularPerson.profilePath}',
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;

                          return Center(
                              child: Image.asset('assets/images/loading.gif'));
                        },
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset('assets/images/placeholder.jpeg'),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Known For",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            popularPerson.knownForDepartment!,
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Gender",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          popularPerson.gender == 2
                              ? const Text(
                                  "Male",
                                  style: const TextStyle(fontSize: 16),
                                )
                              : const Text(
                                  "Female",
                                  style: const TextStyle(fontSize: 16),
                                ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Birthday",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            popularPerson.birthday!,
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Place of Birth",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            popularPerson.birthday!,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ]),
                  ),
                )
              ],
            ),
          ),
          Center(
            child: Text(
              popularPerson.name!,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),

          const Text(
            "Biography",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(popularPerson.biography!,  style: const TextStyle(fontSize: 16,))
        ],
      ),
    );
  }
}
