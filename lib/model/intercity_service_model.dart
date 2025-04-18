
import 'package:customer/model/admin_commission.dart';
import 'package:customer/model/language_name.dart';

class IntercityServiceModel {
  String? image;
  bool? enable;
  String? kmCharge;
  List<LanguageName>? name;
  bool? offerRate;
  String? id;
  AdminCommission? adminCommission;

  IntercityServiceModel({this.image, this.enable, this.kmCharge, this.name, this.offerRate, this.id,this.adminCommission});

  IntercityServiceModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    enable = json['enable'];
    kmCharge = json['kmCharge'];
    if (json['name'] != null) {
      name = <LanguageName>[];
      json['name'].forEach((v) {
        name!.add(LanguageName.fromJson(v));
      });
    }
    adminCommission =
    json['adminCommission'] != null ? AdminCommission.fromJson(json['adminCommission']) : AdminCommission(isEnabled: true, amount: "", type: "");

    offerRate = json['offerRate'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['enable'] = enable;
    data['kmCharge'] = kmCharge;
    if (name != null) {
      data['name'] = name!.map((v) => v.toJson()).toList();
    }
    data['offerRate'] = offerRate;
    data['id'] = id;
    if (adminCommission != null) {
      data['adminCommission'] = adminCommission!.toJson();
    }
    return data;
  }
}
