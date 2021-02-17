import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:simple_flutter_i18n/simple_flutter_i18n.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    final language = Provider.of<I18n>(context).lang;
    return Scaffold(
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
              child: Text('Informações do app',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      color: Colors.white)),
            ),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 38.0),
                child: _dataApp(
                    language['De onde são os dados utilizados no app ?'],
                    'https://cdn2.iconfinder.com/data/icons/whcompare-isometric-web-hosting-servers/50/secure-server-512.png',
                    language[
                        'Os dados utilizados no app vem do site worldometers que trás os dados atualizado sobre o o novo coronavírus(Covid - 19) em relação aos países que foram atingidos pelo vírus'],
                    language),
              ),
              _info(
                  language['Informações do app'],
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRHjkiALT-SFeRmxgPThfElFMRooEbqINOe2hUVu95aMi6LYbty',
                  language),
              _settings(
                  language['Configurações do app'],
                  'https://cdn3.iconfinder.com/data/icons/ringtone-music-instruments/512/blue-round-configuration-settings-gear-options-512.png',
                  language),
            ],
          )
        ],
      ),
    );
  }

  Widget _dataApp(String nome, String image, String msg, language) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: GestureDetector(
        onTap: () {
          Alert(
            context: context,
            //type: AlertType.warning,
            title: language['Dados'],
            desc: msg,
            buttons: [
              DialogButton(
                child: Text(
                  language["Ver site"],
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {
                  FlutterWebBrowser.openWebPage(
                      url: "https://www.worldometers.info/coronavirus/",
                      androidToolbarColor: Colors.deepPurple);
                },
                color: Color.fromRGBO(0, 179, 134, 1.0),
              ),
              DialogButton(
                child: Text(
                  language["Voltar"],
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                gradient: LinearGradient(
                    colors: [Colors.blue[900], Colors.lightBlueAccent]),
              )
            ],
          ).show();
        },
        child: Container(
          height: 120.0,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 8),
                child: Container(
                  width: 180,
                  height: 80,
                  child: Center(
                    child: Text(
                      nome,
                      maxLines: 5,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Container(
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: NetworkImage(image), fit: BoxFit.fill)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _info(String nome, String image, language) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: GestureDetector(
        onTap: () {
          Alert(
            context: context,
            //type: AlertType.warning,
            title: language['Informações do app'],
            desc: language['Versão do app: 1.0'],
            buttons: [
              DialogButton(
                child: Text(
                  language["Voltar"],
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(116, 116, 191, 1.0),
                  Color.fromRGBO(52, 138, 199, 1.0)
                ]),
              )
            ],
          ).show();
        },
        child: Container(
          height: 120,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 8),
                child: Container(
                  width: 180,
                  height: 80,
                  child: Center(
                    child: Text(
                      nome,
                      maxLines: 5,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Container(
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: NetworkImage(image), fit: BoxFit.fill)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _settings(String nome, String image, language) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: GestureDetector(
        onTap: () {
          Alert(
            context: context,
            //type: AlertType.warning,
            title: language['Idioma'],
            desc: language['Alterar o Idioma para'],
            buttons: [
              DialogButton(
                child: Text(
                  language["Inglês"],
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {
                  setState(() {
                    Provider.of<I18n>(context, listen: false).setLocale('en');
                    Navigator.pop(context);
                  });
                },
                gradient: LinearGradient(
                    colors: [Colors.blue[900], Colors.lightBlueAccent]),
              ),
              DialogButton(
                child: Text(
                  language["Português"],
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {
                  setState(() {
                    Provider.of<I18n>(context, listen: false).setLocale('pt');
                    Navigator.pop(context);
                  });
                },
                gradient: LinearGradient(colors: [Colors.green, Colors.green]),
              ),
            ],
          ).show();
        },
        child: Container(
          height: 120,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 8),
                child: Container(
                  width: 180,
                  height: 80,
                  child: Center(
                    child: Text(
                      nome,
                      maxLines: 5,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Container(
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: NetworkImage(image), fit: BoxFit.fill)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
