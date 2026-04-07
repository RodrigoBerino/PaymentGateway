import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paygateway/constants.dart';
import 'package:paygateway/screnns/components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(), body: Body());
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          "/home/rbp/Documentos/projetos/paygateway/assets/icons/menu.svg",
        ),
        onPressed: () {},
      ),
    );
  }
}
