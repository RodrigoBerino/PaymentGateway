import 'package:flutter/material.dart';
import 'package:paygateway/constants.dart';
import 'package:paygateway/screnns/details/components/icon_card.dart';

class ImageAndIcons extends StatelessWidget {
  const ImageAndIcons({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding),
      child: SizedBox(
        height: size.height * 0.55,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        padding: EdgeInsets.symmetric(
                          horizontal: kDefaultPadding,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back, color: kPrimaryColor),
                      ),
                    ),
                    Spacer(),
                    IconCard(icon: Icons.wb_sunny),
                    IconCard(icon: Icons.water_drop),
                    IconCard(icon: Icons.thermostat),
                    IconCard(icon: Icons.eco),
                  ],
                ),
              ),
            ),

            Container(
              height: size.height * 0.55,
              width: size.width * 0.75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(64),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 60,
                    color: kPrimaryColor.withOpacity(0.25),
                  ),
                ],
                image: DecorationImage(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.cover,
                  image: AssetImage("assets/tech_images/image.png"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
