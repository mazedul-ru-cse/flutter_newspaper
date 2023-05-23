import 'dart:convert';
import 'dart:io';

import 'package:flutter_newspaper/data/constant_data.dart';

class ApiService{

  Future fetch(String keyword,)async{

    //Api url
    String url = 'https://newsapi.org/v2/everything?q=$keyword&apiKey=828a663204a3485bbcb1413a6ab3a306';


    HttpClient httpClient = HttpClient();

    HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));

    //Set request header
    request.headers.set('X-Api-Key', xApiKay);
    request.headers.set('Authorization', apiAuthorization);

    //Get response
    HttpClientResponse response = await request.close();
    String serverReplay = await response.transform(utf8.decoder).join();

    // Closed request
    httpClient.close();

    final data = jsonDecode(serverReplay);

    print("All news : ${data["articles"]}");


  }
}