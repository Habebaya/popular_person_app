import 'package:flutter/material.dart';
import 'package:task/constant/api.dart';
import 'package:task/data/models/popular_person_model.dart';

class PopularPersonItem extends StatelessWidget {
  final PopularPerson popularPerson;

  const PopularPersonItem({Key? key, required this.popularPerson})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridTile(
        footer: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.black54,
          alignment: Alignment.bottomCenter,
          child: Text(
            '${popularPerson.name}',
            style: const TextStyle(
              height: 1.3,
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        child: Hero(
            tag: popularPerson.id,
            child: Container(
              color: Colors.white,
              child: Image.network(
                  APIConstants.imageBaseUrl + '${popularPerson.profilePath}',
                  fit: BoxFit.cover),
            )),
      ),
    );
  }
}
