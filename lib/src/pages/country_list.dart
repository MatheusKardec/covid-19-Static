import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:covid_static/src/api/model/model_country_list.dart';
import 'package:covid_static/src/i18n/data.dart';
import 'package:covid_static/src/pages/country_page.dart';
import 'package:covid_static/thema/colors.dart';
import 'package:simple_flutter_i18n/simple_flutter_i18n.dart';

class CountryList extends StatefulWidget {
  @override
  _CountryListState createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {
  bool loaded = false;
  List<CountryListModel> _countryListModel;
  var _searchView = new TextEditingController();
  bool _fristSearch = true;
  String _query = "";
  List<CountryListModel> _filterList;

  _CountryListState() {
    _searchView.addListener(() {
      if (_searchView.text.isEmpty) {
        setState(() {
          _fristSearch = true;
          _query = "";
        });
      } else {
        setState(() {
          _fristSearch = false;
          _query = _searchView.text;
        });
      }
    });
  }

  @override
  void initState() {
    getHome('https://corona.lmao.ninja/v3/covid-19/countries').then((value) {
      setState(() {
        loaded = true;
        _countryListModel = value;
      });
    }).catchError((value) {});
    super.initState();
  }

  Future<List<CountryListModel>> getHome(String url) async {
    Dio dio = new Dio();
    var response = await dio.get(url);
    return List<CountryListModel>.from(
        response.data.map((x) => CountryListModel.fromJson(x)));
  }

  @override
  Widget build(BuildContext context) {
    final language = Provider.of<I18n>(context).lang;
    return Scaffold(
      backgroundColor: LightColor.background,
      body: Column(
        children: <Widget>[
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 34.0),
              child: Text(language['Lista de Países'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      color: Colors.white)),
            ),
          ),
          loaded == false ? Container() : _createSearchView(language),
          loaded == false
              ? Container(
                  height: 200,
                  child: Center(child: CircularProgressIndicator()))
              : _fristSearch
                  ? _countryList(context, language)
                  : _performSearch(context, language),
        ],
      ),
    );
  }

  Widget _performSearch(context, language) {
    _filterList = <CountryListModel>[];
    for (int i = 0; i < _countryListModel.length; i++) {
      var item = _countryListModel[i];
      var country = language[item.country];
      if (country.toString().toLowerCase().contains(_query.toLowerCase())) {
        _filterList.add(item);
      }
    }
    return _createFilteredListView(context, language);
  }

  Widget _createSearchView(language) {
    return new Container(
      child: Padding(
        padding:
            const EdgeInsets.only(bottom: 8.0, top: 16.0, left: 16, right: 16),
        child: TextField(
          cursorColor: Colors.lightBlueAccent,
          controller: _searchView,
          decoration: InputDecoration(
              prefixIcon: IconButton(
                  color: Colors.blue,
                  icon: Icon(
                    Icons.search,
                    size: 26.0,
                  ),
                  onPressed: () {}),
              contentPadding: EdgeInsets.only(left: 25.0),
              labelText: language['Paises'],
              hintText: language['Pesquise por um país'],
              hoverColor: Colors.lightBlueAccent,
              fillColor: Colors.lightBlueAccent,
              focusColor: Colors.lightBlueAccent,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0))),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _countryList(context, language) {
    return Flexible(
      child: new ListView.builder(
          itemCount: _countryListModel.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: GestureDetector(
                child: Container(
                  height: 110,
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 10,
                            spreadRadius: 1,
                            offset: Offset(0, 10))
                      ]),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: NetworkImage(
                                    _countryListModel[index].countryInfo.flag),
                                fit: BoxFit.fill)),
                      ),
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0, top: 8),
                            child: Container(
                              width: 180,
                              child: Text(
                                MyLocal.myLocal == 'pt'
                                    ? language[_countryListModel[index].country]
                                    : _countryListModel[index].country,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              //Colors
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      width: 6,
                                      height: 20,
                                      color: Colors.blueAccent,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Container(
                                        width: 6,
                                        height: 20,
                                        color: Colors.greenAccent,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Numeros

                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        (NumberFormat("#,###", "pt_BR").format(
                                                _countryListModel[index].cases))
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, top: 9.0),
                                      child: Text(
                                        (NumberFormat("#,###", "pt_BR").format(
                                                _countryListModel[index]
                                                    .recovered))
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //
                              Container(
                                width: 25,
                              ),
                              //Colors
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      width: 6,
                                      height: 20,
                                      color: Colors.deepPurpleAccent,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Container(
                                        width: 6,
                                        height: 20,
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Numeros

                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        (NumberFormat("#,###", "pt_BR").format(
                                                _countryListModel[index]
                                                    .active))
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, top: 9.0),
                                      child: Text(
                                        (NumberFormat("#,###", "pt_BR").format(
                                                _countryListModel[index]
                                                    .deaths))
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CountryPage(
                            countryModel: _countryListModel[index],
                          )));
                },
              ),
            );
          }),
    );
  }

  Widget _createFilteredListView(context, language) {
    return Flexible(
      child: new ListView.builder(
          itemCount: _filterList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: GestureDetector(
                child: Container(
                  height: 110,
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 10,
                            spreadRadius: 1,
                            offset: Offset(0, 10))
                      ]),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: NetworkImage(
                                    _filterList[index].countryInfo.flag),
                                fit: BoxFit.fill)),
                      ),
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0, top: 8),
                            child: Container(
                              width: 180,
                              child: Text(
                                MyLocal.myLocal == 'pt'
                                    ? language[_filterList[index].country]
                                    : _filterList[index].country,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              //Colors
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      width: 6,
                                      height: 20,
                                      color: Colors.blueAccent,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Container(
                                        width: 6,
                                        height: 20,
                                        color: Colors.greenAccent,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Numeros

                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        (NumberFormat("#,###", "pt_BR").format(
                                                _filterList[index].cases))
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, top: 9.0),
                                      child: Text(
                                        (NumberFormat("#,###", "pt_BR").format(
                                                _filterList[index].recovered))
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //
                              Container(
                                width: 25,
                              ),
                              //Colors
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      width: 6,
                                      height: 20,
                                      color: Colors.deepPurpleAccent,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Container(
                                        width: 6,
                                        height: 20,
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Numeros

                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        (NumberFormat("#,###", "pt_BR").format(
                                                _filterList[index].active))
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, top: 9.0),
                                      child: Text(
                                        (NumberFormat("#,###", "pt_BR").format(
                                                _filterList[index].deaths))
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CountryPage(
                            countryModel: _filterList[index],
                          )));
                },
              ),
            );
          }),
    );
  }
}
