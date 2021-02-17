import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:covid_static/src/api/model/model_country_list.dart';
import 'package:covid_static/src/widgets/widget_home.dart';
import 'package:simple_flutter_i18n/simple_flutter_i18n.dart';

class CountryPage extends StatefulWidget {
  final CountryListModel countryModel;

  const CountryPage({Key key, @required this.countryModel}) : super(key: key);
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  CountryListModel country;

  @override
  void initState() {
    country = widget.countryModel;
    // Provider.of<I18n>(context, listen: false).load(fallback: MyLocal.pt);
    // Provider.of<I18n>(context, listen: false).setLocale(MyLocal.myLocal);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final language = Provider.of<I18n>(context).lang;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.blueAccent,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 110,
                          height: 80,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: NetworkImage(country.countryInfo.flag),
                                  fit: BoxFit.fill)),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 160,
                          height: 120,
                          child: Center(
                            child: Text(language[country.country],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32,
                                    color: Colors.white)),
                          ),
                        )
                      ],
                    )),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.8,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  child: Container(
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 25),
                            child: Text(
                                language['Dados do(a) '] +
                                    language[country.country],
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.black)),
                          ),
                          Center(child: _containersData(language)),
                        ],
                      ),
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _containersData(language) {
    return Container(
      color: Colors.white,
      height: (MediaQuery.of(context).size.height * 0.8) - 100,
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: CardHome(
              color: Colors.blueAccent,
              title: language['Total de Casos'],
              total: country.cases,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: CardHome(
              color: Colors.deepPurpleAccent,
              title: language['Casos Ativos'],
              total: country.active,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: CardHome(
              color: Colors.greenAccent,
              title: language['Recuperados'],
              total: country.recovered,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: CardHome(
              color: Colors.redAccent,
              title: language['Mortes'],
              total: country.deaths,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: CardHome(
              color: Colors.cyan[200],
              title: language['Novos Casos'],
              total: country.todayCases,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: CardHome(
              color: Colors.grey[800],
              title: language['Novas mortes'],
              total: country.todayDeaths,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: CardHome(
              color: Colors.red,
              title: language['casos críticos'],
              total: country.critical,
            ),
          ),
        ],
      ),
    );
  }
}
