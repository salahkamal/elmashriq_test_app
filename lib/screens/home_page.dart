import 'package:elmashriqtestapp/services/login_service.dart';
import 'package:elmashriqtestapp/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        pageName: 'hassabLabs',
        context: context,
      ),
      body: HomePageBody(),
    );
  }
}

class HomePageBody extends StatelessWidget {
  const HomePageBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Locale myLocale = Localizations.localeOf(context);
    ScreenUtil.init(context,
        width: 392.72727272727275,
        height: 737.4545454545455,
        allowFontScaling: false);
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              color: Color(0xffFDBA35),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => LoginPage(),
                        ),
                      ),
                      child: Image.asset('assets/images/login.png'),
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Image.asset('assets/images/logo.png'),
                        Consumer<LoginService>(
                          builder: (context, loginSer, child) {
                            return Text(
                              loginSer.authData.data.name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xff4EAE4E),
                                fontSize: ScreenUtil().setSp(20),
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        )
                      ],
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    child: Image.asset('assets/images/main.png'),
                    flex: 1,
                  ),
                ],
              ),
            ),
            flex: 1,
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Color(0xff474747),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                              child: Image.asset('assets/images/1.jpeg')),
                          flex: 1,
                        ),
                        Expanded(
                          child: Container(
                              child: Image.asset('assets/images/2.jpeg')),
                          flex: 1,
                        ),
                        Expanded(
                          child: Container(
                              child: Image.asset('assets/images/3.jpeg')),
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                              child: Image.asset('assets/images/4.jpeg')),
                          flex: 1,
                        ),
                        Expanded(
                          child: Container(
                              child: Image.asset('assets/images/5.jpeg')),
                          flex: 1,
                        ),
                        Expanded(
                          child: Container(
                              child: Image.asset('assets/images/6.jpeg')),
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                              child: Image.asset('assets/images/7.jpeg')),
                          flex: 1,
                        ),
                        Expanded(
                          child: Container(
                              child: Image.asset('assets/images/8.jpeg')),
                          flex: 1,
                        ),
                        Expanded(
                          child: Container(
                              child: Image.asset('assets/images/9.jpeg')),
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
