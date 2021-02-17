import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
    int cases;
    int deaths;
    int recovered;
    int updated;
    int active;

    HomeModel({
        this.cases,
        this.deaths,
        this.recovered,
        this.updated,
        this.active,
    });

    factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        cases: json["cases"],
        deaths: json["deaths"],
        recovered: json["recovered"],
        updated: json["updated"],
        active: json["active"],
    );

    Map<String, dynamic> toJson() => {
        "cases": cases,
        "deaths": deaths,
        "recovered": recovered,
        "updated": updated,
        "active": active,
    };
}
