import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_newspaper/data/constant_data.dart';
import 'package:flutter_newspaper/model/data_model.dart';

class ApiService{

  Future<List<DataModel>> fetch(String keyword)async{

    //Api url
    String url = 'https://newsapi.org/v2/everything?q=$keyword&apiKey=828a663204a3485bbcb1413a6ab3a306';


    try {
      HttpClient httpClient = HttpClient();

      HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));

      //Set request header
      request.headers.set('X-Api-Key', xApiKay);
      request.headers.set('Authorization', apiAuthorization);

      //Get response
      HttpClientResponse response = await request.close();

      //Decode response
      String serverReplay = await response.transform(utf8.decoder).join();

      // Closed request
      httpClient.close();

      final data = jsonDecode(serverReplay);

      if (data["status"].toString().contains("ok")) {
        List item = data["articles"];
        List<DataModel> news = <DataModel>[];

        for (var element in item) {
          news.add(DataModel.formJson(element));
        }
        return news;
      }
      else {
        return [];
      }
    }catch(e){
      log("Api call error : $e");
      return [];
    }

  }
}