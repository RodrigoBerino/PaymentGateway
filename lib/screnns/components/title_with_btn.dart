import 'package:flutter/material.dart';
import 'package:paygateway/constants.dart';

class TitleWithBtn extends StatelessWidget {
  const TitleWithBtn({super.key, required this.title, required this.press});

  final String title;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: <Widget>[
          TitleWithCustom(textLabel: title),
          Spacer(),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: kPrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () => press(),
            child: Text("More", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

class TitleWithCustom extends StatelessWidget {
  const TitleWithCustom({super.key, required this.textLabel});

  final String textLabel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: kDefaultPadding / 4),
            child: Text(
              textLabel,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(right: kDefaultPadding / 4),
              height: 7,
            ),
          ),
        ],
      ),
    );
  }
}
