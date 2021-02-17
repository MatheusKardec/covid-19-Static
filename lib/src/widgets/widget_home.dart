import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:covid_static/src/api/model/model_home.dart';
import 'package:intl/intl.dart';
import 'package:simple_flutter_i18n/simple_flutter_i18n.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  bool loaded = false;
  int cases;
  int deaths;
  int recovered;
  int updated;
  int active;

  @override
  void initState() {
    // Provider.of<I18n>(context, listen: false).load(fallback: MyLocal.pt);
    // Provider.of<I18n>(context, listen: false).setLocale(MyLocal.myLocal);
    getHome('https://corona.lmao.ninja/v3/covid-19/all').then((value) {
      setState(() {
        loaded = true;
      });
    }).catchError((value) {
      print('Deu Erro');
    });
    super.initState();
  }

  Future<HomeModel> getHome(String url) async {
    Dio dio = new Dio();
    var response = await dio.get(url);
    cases = response.data["cases"];
    deaths = response.data["deaths"];
    recovered = response.data["recovered"];
    updated = response.data["updated"];
    active = response.data["active"];
    return HomeModel.fromJson(response.data);
  }

  @override
  Widget build(BuildContext context) {
    final language = Provider.of<I18n>(context).lang;
    return loaded == false
        ? Container(
            height: 350, child: Center(child: CircularProgressIndicator()))
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CardHome(
                color: Colors.blueAccent,
                title: language['Total de Casos'],
                total: cases,
              ),
              CardHome(
                color: Colors.deepPurpleAccent,
                title: language['Casos Ativos'],
                total: active,
              ),
              CardHome(
                color: Colors.greenAccent,
                title: language['Recuperados'],
                total: recovered,
              ),
              CardHome(
                color: Colors.redAccent,
                title: language['Mortes'],
                total: deaths,
              ),
            ],
          );
  }
}

class CardHome extends StatelessWidget {
  final String title;
  final Color color;
  final int total;
  const CardHome({
    Key key,
    @required this.title,
    @required this.color,
    @required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.width * 0.218,
        margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.6),
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: Offset(0, 10))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
                child: Container(
              height: MediaQuery.of(context).size.width * 0.1,
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: RichText(
                  text: TextSpan(
                      text: '  $title  '.toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.5)),
                ),
              ),
            )),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Text(
                  (NumberFormat("#,###", "pt_BR").format(total)).toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 29),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
