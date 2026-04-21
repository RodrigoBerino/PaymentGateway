import 'package:flutter/material.dart';
import 'package:paygateway/constants.dart';

class MyBottomBar extends StatelessWidget {
  const MyBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: kDefaultPadding * 2,
        right: kDefaultPadding * 2,
        bottom: kDefaultPadding,
      ),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -10),
            blurRadius: 32,
            color: kPrimaryColor.withOpacity(0.32),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.home, color: kPrimaryColor),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(
              Icons.favorite_border,
              color: kPrimaryColor.withValues(alpha: 0.4),
            ),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(
              Icons.person_outline,
              color: kPrimaryColor.withValues(alpha: 0.4),
            ),
            onPressed: null,
          ),
        ],
      ),
    );
  }
}
