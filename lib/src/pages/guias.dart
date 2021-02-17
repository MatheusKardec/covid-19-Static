import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:covid_static/src/pages/detail_page.dart';
import 'package:covid_static/thema/colors.dart';
import 'package:simple_flutter_i18n/simple_flutter_i18n.dart';

class GuiaPage extends StatefulWidget {
  @override
  _GuiaPageState createState() => _GuiaPageState();
}

class _GuiaPageState extends State<GuiaPage> {
  @override
  Widget build(BuildContext context) {
    final language = Provider.of<I18n>(context).lang;
    return Scaffold(
        body: Container(
      color: Colors.blueAccent,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 44.0),
              child: Text('Covid - 19',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      color: Colors.white)),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.75,
              decoration: BoxDecoration(
                  color: LightColor.background,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 38.0),
                    child: _guidesList(
                      language,
                      'O novo Coronavírus (COVID-19)',
                      'https://raw.githubusercontent.com/hifiaz/covid19/master/lib/images/icon.png',
                      """   O que é coronavírus? (COVID-19)

    Coronavírus é uma família de vírus que causam infecções respiratórias. O novo agente do coronavírus (SARS-CoV-2) foi descoberto em 31 de dezembro de 2019, após casos registrados na China, e provoca a doença chamada de coronavírus (COVID-19).

Os coronavírus humanos foram isolados pela primeira vez em 1937. No entanto, apenas em 1965, o vírus foi descrito como coronavírus, em decorrência do perfil na microscopia, parecendo uma coroa.

A maioria das pessoas é infectada com os coronavírus comuns ao longo da vida, sendo as crianças pequenas mais propensas a se infectarem com o tipo mais comum do vírus. Os coronavírus mais comuns que infectam humanos são o alpha coronavírus 229E e NL63 e beta coronavírus OC43, HKU1.
                        
                        """,
                    ),
                  ),
                  _guidesList(
                    language,
                    'Sintomas do Covid-19',
                    'https://assets.website-files.com/5d9ba0eb5f6edb77992a99d0/5e6ba59fdba261a201c5b215_iconfinder___fever_high_temperature_5925230.png',
                    """   Quais são os sintomas ?

    Os sintomas mais comuns do COVID-19 são febre, cansaço e tosse seca. Alguns pacientes podem ter dores, congestão nasal, corrimento nasal, dor de garganta ou diarréia. Esses sintomas geralmente são leves e começam gradualmente. Algumas pessoas são infectadas, mas não desenvolvem sintomas e não se sentem mal. A maioria das pessoas (cerca de 80%) se recupera da doença sem precisar de tratamento especial. Cerca de 1 em cada 6 pessoas que recebe COVID-19 fica gravemente doente e desenvolve dificuldade em respirar. As pessoas idosas e as que têm problemas médicos subjacentes, como pressão alta, problemas cardíacos ou diabetes, têm maior probabilidade de desenvolver doenças graves. Pessoas com febre, tosse e dificuldade em respirar devem procurar atendimento médico.
                        """,
                  ),
                  _guidesList(
                    language,
                    'Como prevenir a doença',
                    'https://assets.website-files.com/5d9ba0eb5f6edb77992a99d0/5e6225c94527706d7845b736_iconfinder_water-wash-hand-WASHING-healthcare_5859234.png',
                    """Medidas de proteção para todos
Fique atento às informações mais recentes sobre o surto de COVID-19, disponíveis no site da OMS e por meio de sua autoridade nacional e local de saúde pública. Muitos países ao redor do mundo já viram casos de COVID-19 e vários ocorreram surtos. As autoridades da China e de alguns outros países conseguiram retardar ou interromper seus surtos. No entanto, a situação é imprevisível, portanto verifique regularmente as últimas notícias.

Você pode reduzir suas chances de ser infectado ou espalhar o COVID-19 tomando algumas precauções simples:


* Limpe regularmente e cuidadosamente as mãos com um esfregão à base de álcool ou lave-as com água e sabão.
Por quê? Lavar as mãos com água e sabão ou usar álcool nas mãos mata vírus que podem estar nas suas mãos.


* Mantenha pelo menos 1 metro de distância entre você e qualquer pessoa que esteja tossindo ou espirrando.
Por quê? Quando alguém tosse ou espirra, pulveriza pequenas gotas líquidas do nariz ou da boca, que podem conter vírus. Se você estiver muito próximo, poderá respirar as gotículas, incluindo o vírus COVID-19, se a pessoa que tossir tiver a doença.


* Evite tocar nos olhos, nariz e boca.
Por quê? As mãos tocam muitas superfícies e podem pegar vírus. Uma vez contaminadas, as mãos podem transferir o vírus para os olhos, nariz ou boca. A partir daí, o vírus pode entrar no seu corpo e deixá-lo doente.


* Certifique-se de que você e as pessoas ao seu redor seguem uma boa higiene respiratória. Isso significa cobrir a boca e o nariz com o cotovelo ou o tecido dobrado quando tossir ou espirrar. Em seguida, descarte o tecido usado imediatamente.
Por quê? Gotas espalham vírus. Ao seguir uma boa higiene respiratória, você protege as pessoas ao seu redor contra vírus como resfriado, gripe e COVID-19.


* Fique em casa se não se sentir bem. Se você tiver febre, tosse e dificuldade em respirar, procure atendimento médico e ligue com antecedência. Siga as instruções da sua autoridade sanitária local.
Por quê? As autoridades nacionais e locais terão as informações mais atualizadas sobre a situação em sua área. Ligar com antecedência permitirá que seu médico o direcione rapidamente para o centro de saúde certo. Isso também irá protegê-lo e ajudar a evitar a propagação de vírus e outras infecções.


* Mantenha-se atualizado sobre os pontos de acesso mais recentes do COVID-19 (cidades ou áreas locais onde o COVID-19 está se espalhando amplamente). Se possível, evite viajar para lugares - especialmente se for uma pessoa idosa ou tiver diabetes, doenças cardíacas ou pulmonares.
Por quê? Você tem uma chance maior de pegar o COVID-19 em uma dessas áreas.


Medidas de proteção para pessoas que estão ou visitaram recentemente (há 14 dias) áreas em que o COVID-19 está se espalhando


* Siga as orientações descritas acima (medidas de proteção para todos)


* Auto-isolar-se ficando em casa se você começar a se sentir mal, mesmo com sintomas leves como dor de cabeça, febre baixa (37,3 C ou mais) e corrimento nasal leve, até você se recuperar. Se for essencial que alguém lhe traga suprimentos ou saia, por exemplo, para comprar comida, use uma máscara para evitar infectar outras pessoas.
Por quê? Evitar o contato com outras pessoas e as visitas às instalações médicas permitirá que essas instalações funcionem com mais eficácia e ajudará a proteger você e outras pessoas contra possíveis COVID-19 e outros vírus.


* Se você desenvolver febre, tosse e dificuldade em respirar, procure orientação médica imediatamente, pois isso pode ocorrer devido a uma infecção respiratória ou outra condição séria. Ligue com antecedência e informe seu provedor de qualquer viagem recente ou entre em contato com os viajantes.
Por quê? Ligar com antecedência permitirá que seu médico o direcione rapidamente para o centro de saúde certo. Isso também ajudará a evitar a possível propagação do COVID-19 e outros vírus.
                        
                        """,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Widget _guidesList(language, String nome, String image, String texto) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: GestureDetector(
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
                      language[nome],
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
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailPage(
                    texto: language[texto],
                    title: language[nome],
                  )));
        },
      ),
    );
  }
}
