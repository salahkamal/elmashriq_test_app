import 'package:elmashriqtestapp/constants/lang_const.dart';
import 'package:elmashriqtestapp/models/user_data.dart';
import 'package:elmashriqtestapp/screens/home_page.dart';
import 'package:elmashriqtestapp/services/login_service.dart';
import 'package:elmashriqtestapp/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      appBar: MyAppBar(
        pageName: 'login',
        context: context,
      ),
      body: LoginPageBody(),
    );
  }
}

class LoginPageBody extends StatefulWidget {
  @override
  _LoginPageBodyState createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  final _loginForm = GlobalKey<FormState>();

  var _mailAddressValue = '';

  var _passwordValue = '';
  AuthData authData;
  bool syncing = false;

  void _saveForm() async {
    _loginForm.currentState.save();
    if (_loginForm.currentState.validate()) {
      await Provider.of<LoginService>(context)
          .userLogin(_mailAddressValue, _passwordValue);
      authData = Provider.of<LoginService>(context).authData;
      if (authData.success) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
      }
    }
    setState(() {
      syncing = false;
    });
    print(_mailAddressValue);
    print(_passwordValue);
  }

  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    ScreenUtil.init(context,
        width: 392.72727272727275,
        height: 737.4545454545455,
        allowFontScaling: false);
    final myModel = Provider.of<LoginService>(context, listen: false);

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(12.w),
      color: Color(0xffFDBA35),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Image.asset(
                'assets/images/logo.png',
                height: 150.h,
              ),
            ),
            SizedBox(
              height: myLocale.languageCode == 'ar' ? 5.h : 20.h,
            ),
            Text(
              getTranslated(context, 'welcome_hassab'),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(32),
                  fontWeight: FontWeight.bold,
                  color: Color(0xff4EAE4E)),
            ),
            SizedBox(
              height: myLocale.languageCode == 'ar' ? 25.h : 50.h,
              child: syncing
                  ? FittedBox(child: CircularProgressIndicator())
                  : Container(
                      child: Text(authData != null ? authData.message : ''),
                    ),
            ),
            Form(
              key: _loginForm,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(20),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      var emailRegex = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                      return emailRegex.hasMatch(value)
                          ? null
                          : getTranslated(context, 'mail_error');
                    },
                    onSaved: (newValue) {
                      _mailAddressValue = newValue;
                    },
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(30.w),
                        prefixIcon: Icon(
                          Icons.mail,
                          size: 30.w,
                          color: Color(0xff06797A),
                        ),
                        hintText: getTranslated(context, 'mail_hint'),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff4EAE4E)),
                        ),
                        hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(18))),
                  ),
                  SizedBox(
                    height: myLocale.languageCode == 'ar' ? 10.h : 20.h,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(25),
                    ),
                    validator: (value) {
                      return value.length >= 6
                          ? null
                          : getTranslated(context, 'pass_error');
                    },
                    onSaved: (newValue) {
                      _passwordValue = newValue;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(30.w),
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 30.w,
                        color: Color(0xff06797A),
                      ),
                      hintText: getTranslated(context, 'pass_hint'),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff4EAE4E)),
                      ),
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(18),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 45.h,
                  ),
                  FlatButton(
                    child: Text(
                      getTranslated(context, 'login'),
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil()
                              .setSp(28, allowFontScalingSelf: true)),
                    ),
                    color: Color(0xff474747),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: (MediaQuery.of(context).size.width / 2 -
                          (myLocale.languageCode == 'ar' ? 130 : 70)),
                      vertical: myLocale.languageCode == 'ar' ? 3.h : 10.h,
                    ),
                    onPressed: () async {
                      _loginForm.currentState.save();
                      if (_loginForm.currentState.validate()) {
                        setState(() {
                          syncing = true;
                        });
                        await myModel.userLogin(
                            _mailAddressValue, _passwordValue);
                        authData = myModel.authData;
                        print(authData.message);
                        if (authData.success) {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ));
                        } else {
                          setState(() {
                            syncing = false;
                          });
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
