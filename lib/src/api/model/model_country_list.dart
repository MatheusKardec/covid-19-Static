import 'dart:convert';

List<CountryListModel> countryListModelFromJson(String str) =>
    List<CountryListModel>.from(
        json.decode(str).map((x) => CountryListModel.fromJson(x)));

String countryListModelToJson(List<CountryListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryListModel {
  String country;
  CountryInfo countryInfo;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int active;
  int critical;
  double casesPerOneMillion;
  double deathsPerOneMillion;

  CountryListModel({
    this.country,
    this.countryInfo,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.active,
    this.critical,
    this.casesPerOneMillion,
    this.deathsPerOneMillion,
  });

  factory CountryListModel.fromJson(Map<String, dynamic> json) =>
      CountryListModel(
        country: json["country"],
        countryInfo: CountryInfo.fromJson(json["countryInfo"]),
        cases: json["cases"],
        todayCases: json["todayCases"],
        deaths: json["deaths"],
        todayDeaths: json["todayDeaths"],
        recovered: json["recovered"],
        active: json["active"],
        critical: json["critical"],
        casesPerOneMillion: json["casesPerOneMillion"] == null
            ? null
            : json["casesPerOneMillion"].toDouble(),
        deathsPerOneMillion: json["deathsPerOneMillion"] == null
            ? null
            : json["deathsPerOneMillion"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "countryInfo": countryInfo.toJson(),
        "cases": cases,
        "todayCases": todayCases,
        "deaths": deaths,
        "todayDeaths": todayDeaths,
        "recovered": recovered,
        "active": active,
        "critical": critical,
        "casesPerOneMillion":
            casesPerOneMillion == null ? null : casesPerOneMillion,
        "deathsPerOneMillion":
            deathsPerOneMillion == null ? null : deathsPerOneMillion,
      };
}

class CountryInfo {
  int id;
  String country;
  String iso2;
  String iso3;
  double lat;
  double long;
  String flag;

  CountryInfo({
    this.id,
    this.country,
    this.iso2,
    this.iso3,
    this.lat,
    this.long,
    this.flag,
  });

  factory CountryInfo.fromJson(Map<String, dynamic> json) => CountryInfo(
        id: json["_id"] == null ? null : json["_id"],
        country: json["country"] == null ? null : json["country"],
        iso2: json["iso2"] == null ? null : json["iso2"],
        iso3: json["iso3"] == null ? null : json["iso3"],
        lat: json["lat"].toDouble(),
        long: json["long"].toDouble(),
        flag: json["flag"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "country": country == null ? null : country,
        "iso2": iso2 == null ? null : iso2,
        "iso3": iso3 == null ? null : iso3,
        "lat": lat,
        "long": long,
        "flag": flag,
      };
}
