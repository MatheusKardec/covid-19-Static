import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:covid_static/src/i18n/data.dart';
import 'package:covid_static/src/pages/country_list.dart';
import 'package:covid_static/src/pages/guias.dart';
import 'package:covid_static/src/pages/homePage.dart';
import 'package:covid_static/src/pages/info.dart';
import 'package:simple_flutter_i18n/simple_flutter_i18n.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  final _pageController = PageController();

  @override
  void initState() {
    Provider.of<I18n>(context, listen: false).load(fallback: MyLocal.pt);
    Provider.of<I18n>(context, listen: false).setLocale(MyLocal.myLocal);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final language = Provider.of<I18n>(context).lang;
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: <Widget>[
          HomePage(),
          CountryList(),
          GuiaPage(),
          InfoPage(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  blurRadius: 20, color: Colors.blueAccent.withOpacity(0.7))
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                gap: 8,
                activeColor: Colors.white,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                duration: Duration(milliseconds: 800),
                tabBackgroundColor: Colors.blueAccent,
                tabs: [
                  GButton(
                      icon: Icons.home,
                      text: language['Início'],
                      iconColor: Colors.blueAccent),
                  GButton(
                      icon: Icons.format_list_numbered,
                      text: language['Lista'],
                      iconColor: Colors.blueAccent),
                  GButton(
                      icon: Icons.library_books,
                      text: language['Guias'],
                      iconColor: Colors.blueAccent),
                  GButton(
                      icon: Icons.settings,
                      text: language['Info'],
                      iconColor: Colors.blueAccent),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                    _pageController.animateToPage(_selectedIndex,
                        duration: Duration(milliseconds: 200),
                        curve: Curves.easeInOutCirc);
                  });
                }),
          ),
        ),
      ),
    );
  }
}
