import 'package:flutter/material.dart';
import 'package:flutter_pokedex_app/constants/constants.dart';
import 'package:flutter_pokedex_app/constants/ui_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTitle extends StatefulWidget {
  AppTitle({Key? key}) : super(key: key);

  @override
  State<AppTitle> createState() => _AppTitleState();
}

class _AppTitleState extends State<AppTitle> {
  String imageUrl = "images/pokeball.png";
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UIHelper.getAppTitleWidgetHeight(),
      child: Stack(
        children: [
          Padding(
            padding: UIHelper.getDefaultPadding(),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  Constants.title,
                  style: Constants.getTitleTextStyle(),
                )),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              imageUrl,
              width: UIHelper.getImageWidgetHeight(),
              fit: BoxFit.fitWidth,
            ),
          )
        ],
      ),
    );
  }
}
