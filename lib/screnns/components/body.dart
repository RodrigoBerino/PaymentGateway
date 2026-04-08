import 'package:flutter/material.dart';
import 'package:paygateway/constants.dart';
import 'package:paygateway/screnns/components/header_with_searchbox.dart';
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

          PlantCard(size: size),
        ],
      ),
    );
  }
}

class PlantCard extends StatelessWidget {
  const PlantCard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding / 2,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      width: size.width * 0.4,
      child: Column(
        children: [
          Image.asset("assets/images/image_1.png"),
          Container(
            padding: EdgeInsets.all(kDefaultPadding / 2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 50,
                  color: kPrimaryColor.withOpacity(0.25),
                ),
              ],
            ),
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Samantha\n".toUpperCase(),
                        style: Theme.of(context).textTheme.button,
                      ),
                      TextSpan(
                        text: "Russia".toUpperCase(),
                        style: TextStyle(
                          color: kPrimaryColor.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Text(
                  '\$440',
                  style: Theme.of(
                    context,
                  ).textTheme.button.copyWith(color: kPrimaryColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
