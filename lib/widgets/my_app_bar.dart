import 'package:elmashriqtestapp/constants/lang_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../main.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String pageName;
  final context;

  MyAppBar({Key key, this.pageName, this.context}) : super(key: key) {
    ScreenUtil.init(context,
        width: 392.72727272727275,
        height: 737.4545454545455,
        allowFontScaling: false);
  }
  @override
  _MyAppBarState createState() => _MyAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: widget.preferredSize,
      child: AppBar(
        backgroundColor: Color(0xffFDBA35),
        centerTitle: widget.pageName == 'login' ? true : false,
        title: Text(
          getTranslated(context, widget.pageName),
          style: TextStyle(
              color: Color(0xff4EAE4E), fontSize: ScreenUtil().setSp(25)),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: DropdownButton(
              underline: SizedBox(),
              hint: Text(
                getTranslated(context, 'change_lang'),
                style: TextStyle(
                    color: Color(0xff4EAE4E), fontSize: ScreenUtil().setSp(15)),
              ),
              items: <DropdownMenuItem<String>>[
                DropdownMenuItem(
                  child: Text('عربي'),
                  value: 'ar',
                ),
                DropdownMenuItem(
                  child: Text('English'),
                  value: 'en',
                ),
              ],
              onChanged: (lang) {
                _changeLang(lang);
              },
              style: TextStyle(color: Colors.black),
              icon: Icon(
                Icons.language,
                color: Color(0xff4EAE4E),
                size: 23.w,
              ),
            ),
          )
        ],
      ),
    );
  }

  void _changeLang(lang) {
    Locale _temp;

    switch (lang) {
      case 'en':
        _temp = Locale('en', 'US');
        break;
      case 'ar':
        _temp = Locale('ar', 'EG');
        break;
    }

    MyApp.setLocale(context, _temp);
  }
}
