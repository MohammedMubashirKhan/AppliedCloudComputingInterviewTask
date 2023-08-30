import 'dart:convert';
import 'dart:developer';

import 'package:acc_task/app/modules/home/model/banners_model.dart';
import 'package:http/http.dart' as http;

class BannerApi {
  getBanners() async {
    var url =
        Uri.parse("https://mocki.io/v1/783f8c69-af91-45ff-87df-e675c3f11fef");
    print(url);
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    var bannersjson = jsonDecode(response.body);
    log("$bannersjson");
    BannersModel bannersModel = BannersModel.fromJson(bannersjson);

    return bannersModel;
  }
}
