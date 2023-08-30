import 'dart:convert';
import 'dart:developer';

import 'package:acc_task/app/modules/home/model/types_of_movies_model.dart';
import 'package:http/http.dart' as http;

class TypesOfMoviesApi {
  getTypesOfMovies() async {
    var url =
        Uri.parse("https://mocki.io/v1/cead1ab5-8153-4557-a587-f6ebb2710769");
    print(url);
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    var bannersjson = jsonDecode(response.body);
    log("$bannersjson");
    TypesOfMoviesModel typesOfMoviesModel =
        TypesOfMoviesModel.fromJson(bannersjson);

    return typesOfMoviesModel;
  }
}
