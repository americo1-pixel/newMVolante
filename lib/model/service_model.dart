import 'package:customer/model/admin_commission.dart';
import 'package:customer/model/language_title.dart';

class ServiceModel {
  String? image;
  bool? enable;
  bool? offerRate;
  bool? intercityType;
  bool? isAcNonAc;
  String? id;
  String? acCharge;
  String? nonAcCharge;
  String? basicFare;
  String? basicFareCharge;
  String? holdingMinute;
  String? holdingMinuteCharge;
  String? endNightTime;
  String? startNightTime;
  String? nightCharge;
  String? perMinuteCharge;
  List<LanguageTitle>? title;
  String? kmCharge;
  AdminCommission? adminCommission;

  ServiceModel(
      {this.image,
      this.enable,
      this.intercityType,
      this.isAcNonAc,
      this.offerRate,
      this.id,
      this.acCharge,
      this.nonAcCharge,
      this.basicFare,
      this.basicFareCharge,
      this.holdingMinute,
      this.holdingMinuteCharge,
      this.endNightTime,
      this.startNightTime,
      this.nightCharge,
      this.perMinuteCharge,
      this.title,
      this.kmCharge,
      this.adminCommission});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    enable = json['enable'];
    offerRate = json['offerRate'];
    id = json['id'];
    acCharge = json['acCharge'];
    nonAcCharge = json['nonAcCharge'];
    basicFare = json['basicFare'];
    basicFareCharge = json['basicFareCharge'];
    holdingMinute = json['holdingMinute'];
    holdingMinuteCharge = json['holdingMinuteCharge'];
    endNightTime = json['endNightTime'];
    startNightTime = json['startNightTime'];
    nightCharge = json['nightCharge'];
    perMinuteCharge = json['perMinuteCharge'];
    kmCharge = json['kmCharge'];
    intercityType = json['intercityType'];
    isAcNonAc = json['isAcNonAc'];
    adminCommission = json['adminCommission'] != null
        ? AdminCommission.fromJson(json['adminCommission'])
        : AdminCommission(isEnabled: true, amount: "", type: "");
    if (json['title'] != null) {
      title = <LanguageTitle>[];
      json['title'].forEach((v) {
        title!.add(LanguageTitle.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['enable'] = enable;
    data['offerRate'] = offerRate;
    data['id'] = id;
    data['acCharge'] = acCharge;
    data['nonAcCharge'] = nonAcCharge;
    data['basicFare'] = basicFare;
    data['basicFareCharge'] = basicFareCharge;
    data['holdingMinute'] = holdingMinute;
    data['holdingMinuteCharge'] = holdingMinuteCharge;
    data['endNightTime'] = endNightTime;
    data['startNightTime'] = startNightTime;
    data['nightCharge'] = nightCharge;
    data['perMinuteCharge'] = perMinuteCharge;
    data['title'] = title;
    data['kmCharge'] = kmCharge;
    data['intercityType'] = intercityType;
    data['isAcNonAc'] = isAcNonAc;
    if (title != null) {
      data['title'] = title!.map((v) => v.toJson()).toList();
    }

    if (adminCommission != null) {
      data['adminCommission'] = adminCommission!.toJson();
    }
    return data;
  }
}
