import 'package:flutter/material.dart';
import 'package:paygateway/components/my_bottom_bar.dart';
import 'package:paygateway/constants.dart';
import 'package:paygateway/screnns/components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      bottomNavigationBar: MyBottomBar(),
    );
  }
}

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: kPrimaryColor,
    elevation: 0,
    leading: IconButton(
      icon: Icon(Icons.menu, color: Colors.white),
      onPressed: () {},
    ),
  );
}
