
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_newspaper/model/data_model.dart';
import 'package:get/get.dart';

class DatabaseHandler{

 DatabaseReference userData = FirebaseDatabase.instance.ref(FirebaseAuth.instance.currentUser!.uid.toString());

  void storeUserName(String userName){

    userData.set({"userName": userName });

  }

  void addBookmark(DataModel model){

    var random = Random();
    const allChars='AaBbCcDdlMmNnOoPpQqRGgHhIiJj465juds9576fhaf453765ydfgajKkL234567890';
    final key = List.generate(50, (index) => allChars[random.nextInt(allChars.length)]).join();

    try {
      userData.child(key).set(model.toMap()).then((value) => print("Success")).onError((error, stackTrace) => printError);
    }catch(e){
      print(e);
    }

  }

}