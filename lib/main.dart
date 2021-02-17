import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:covid_static/src/i18n/data.dart';
import 'package:covid_static/thema/colors.dart';
import 'package:simple_flutter_i18n/registry.dart';
import 'package:simple_flutter_i18n/simple_flutter_i18n.dart';
import 'src/pages/home.dart';
import 'package:provider/provider.dart';

//void main() => runApp(MyApp());

void main() {
  I18nRegistry.register('en', MyLocal.en);
  I18nRegistry.register('pt', MyLocal.pt);

  I18nRegistry.setInitialLanguage(MyLocal.pt);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (dd) => I18n())],
      child: MaterialApp(
        title: 'Covid - 19',
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', "US"),
          const Locale('pt', "BR"),
        ],
        theme: ThemeData(
            brightness: Brightness.light,
            secondaryHeaderColor: Colors.blue,
            primaryColor: Colors.lightBlueAccent,
            buttonColor: Colors.blue,
            accentColor: Colors.blue,
            scaffoldBackgroundColor: LightColor.background),
        debugShowCheckedModeBanner: false,
        home: Splash(),
      ),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 4)).then((_) {
      Navigator.of(context)
          .pushReplacement(CupertinoPageRoute(builder: (context) => Home()));
    });
    super.initState();
  }

  void getLocal(context) {
    setState(() {
      Locale myLocale = Localizations.localeOf(context);
      String ml = myLocale.toString();
      MyLocal.myLocal = (ml[0] + ml[1]);
      Provider.of<I18n>(context, listen: false).load(fallback: MyLocal.pt);
      Provider.of<I18n>(context, listen: false).setLocale(MyLocal.myLocal);
    });
  }

  @override
  Widget build(BuildContext context) {
    getLocal(context);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'images/splash.png',
                fit: BoxFit.fill,
              ),
            ),
            Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 250.0),
              child: CircularProgressIndicator(),
            ))
          ],
        ),
      ),
    );
  }
}
