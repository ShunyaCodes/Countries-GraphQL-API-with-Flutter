import 'package:flutter/material.dart';
import 'package:countries/model/Country.dart';

class HomeCountryItem extends StatelessWidget {
  final Country country;

  HomeCountryItem({@required this.country});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          children: [
            Item(title: "Code", description: country?.code),
            Item(title: "Flag", description: country?.emoji),
            Item(title: "Languages", description: country?.languages),
            Item(title: "Name", description: country?.name),
            Item(title: "Currency", description: country?.currency),
            Item(title: "Native", description: country?.native),
            Item(title: "Capital", description: country?.capital),
            Item(title: "Continent", description: country?.continent),
            Item(title: "Phone", description: country?.phone)
          ],
        ));
  }

  Item({String title, description}) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$title',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 15),
            ),
            Spacer(),
            Text(
              '$description',
              style: TextStyle(fontSize: 15),
            ),
          ],
        ));
  }
}
