import 'package:flutter/material.dart';
import 'package:paygateway/constants.dart';
import 'package:paygateway/screnns/components/featured_plants.dart';
import 'package:paygateway/screnns/components/header_with_searchbox.dart';
import 'package:paygateway/screnns/components/recomended_plants.dart';
import 'package:paygateway/screnns/components/title_with_btn.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          TitleWithBtn(title: "Recommended", press: () {}),
          RecomendedPlant(),
          TitleWithBtn(title: "Featured Plants", press: () {}),
          FeaturedPlants(),
          SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}
