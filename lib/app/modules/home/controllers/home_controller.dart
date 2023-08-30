import 'package:acc_task/app/modules/home/api/banner_api.dart';
import 'package:acc_task/app/modules/home/api/types_of_movies_api.dart';
import 'package:acc_task/app/modules/home/model/banners_model.dart';
import 'package:acc_task/app/modules/home/model/types_of_movies_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  @override
  void onInit() {
    getBanners();
    getTypesOfMovies();
    super.onInit();
  }

  Rxn<BannersModel> bannersModel = Rxn<BannersModel>();
  Rxn<TypesOfMoviesModel> typesOfMoviesModel = Rxn<TypesOfMoviesModel>();

  getBanners() async {
    bannersModel.value = await BannerApi().getBanners();
  }

  getTypesOfMovies() async {
    typesOfMoviesModel.value = await TypesOfMoviesApi().getTypesOfMovies();
  }
}
