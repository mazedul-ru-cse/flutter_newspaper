import 'package:flutter_newspaper/api/api_service.dart';
import 'package:get/get.dart';

import '../model/data_model.dart';

class NewsController extends GetxController{

  //News list
  List<DataModel> news = <DataModel>[];

  bool isLoading = false;

  @override
  void onInit() {

    initialize();
    super.onInit();
  }

  void initialize() async{

    isLoading = false;
    news = await ApiService().fetch("keyword");
    isLoading = true;
    update();

  }

  Future<void> newsCategory(String category) async {

    isLoading = false;
    news = await ApiService().fetch(category);
    isLoading = true;
    update();
  }

}