import 'package:ncov19_app/themes/color/light_color.dart';
import 'package:ncov19_app/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:responsive_screen/responsive_screen.dart';
import 'package:ncov19_app/utils/all_imports.dart';

class HomeCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  final Color iconColor;

  const HomeCard({Key key, @required this.title, @required this.subTitle, @required this.icon, @required this.iconColor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(context).wp;
    final Function hp = Screen(context).hp;
    return Container(
      height: hp(15),
      width: wp(40),
      padding: EdgeInsets.all(8),
      //margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: LightColor.cardBackground,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
           BoxShadow(
              color: Colors.grey[100],
              blurRadius: 1.0,
              spreadRadius: 3.5,
              offset: Offset(0.0, 3)),
        ],
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(icon, size: 14 * SizeConfig.imageSizeMultiplier, color: iconColor,),
                    SizedBox(width: hp(1)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: hp(1)),
                        Text(title, style: AppTheme.h2Style.copyWith(color: LightColor.darkgrey, fontWeight: FontWeight.bold, fontSize:  2.0 * SizeConfig.textMultiplier)),
                        //  Text(subTitle, style: AppTheme.h2Style.copyWith(color: LightColor.darkgrey.withOpacity(0.7), fontSize: 2.2 * SizeConfig.textMultiplier))
                      ],
                    )
                  ]
              ),
            )
          ]
      ),
    );
  }
}