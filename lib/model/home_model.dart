//config	Object	NonNull
//bannerList	Array	NonNull
//localNavList	Array	NonNull
//gridNav	Object	NonNull
//subNavList	Array	NonNull
//salesBox	Object	NonNull

import 'package:weixiao/model/common_model.dart';
import 'package:weixiao/model/config_model.dart';
import 'package:weixiao/model/grid_nav_model.dart';
import 'package:weixiao/model/sales_box_model.dart';

class TravelModel {
  final ConfigModel config;
  final List<CommonModel> bannerList;
  final List<CommonModel> localNavList;
  final List<CommonModel> subNavList;
  final GridNavModel gridNav;
  final SalesBoxModel salesBox;

  TravelModel(
      {this.config,
        this.bannerList,
        this.localNavList,
        this.subNavList,
        this.gridNav,
        this.salesBox});

  factory TravelModel.fromJson(Map<String, dynamic> json) {
    var localNavListJson = json['localNavList'] as List;
    List<CommonModel> localNavList =
    localNavListJson.map((i) => CommonModel.fromJson(i)).toList();

    var bannerListJson = json['bannerList'] as List;
    List<CommonModel> bannerList =
    bannerListJson.map((i) => CommonModel.fromJson(i)).toList();

    var subNavListJson = json['subNavList'] as List;
    List<CommonModel> subNavList =
    subNavListJson.map((i) => CommonModel.fromJson(i)).toList();

    return TravelModel(
      localNavList: localNavList,
      bannerList: bannerList,
      subNavList: subNavList,
      config: ConfigModel.fromJson(json['config']),
      gridNav: GridNavModel.fromJson(json['gridNav']),
      salesBox: SalesBoxModel.fromJson(json['salesBox']),
    );
  }

}
