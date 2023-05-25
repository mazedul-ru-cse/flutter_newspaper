
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_newspaper/model/data_model.dart';
import 'package:get/get.dart';

class DatabaseHandler{

 DatabaseReference userData = FirebaseDatabase.instance.ref(FirebaseAuth.instance.currentUser!.uid.toString());

  void storeUserName(String userName){

    userData.set({"userName": userName });

  }

  void addBookmark(BuildContext context,DataModel model){

    var random = Random();
    const allChars='AaBbCcDdlMmNnOoPpQqRGgHhIiJj465juds9576fhaf453765ydfgajKkL234567890';
    final key = List.generate(50, (index) => allChars[random.nextInt(allChars.length)]).join();

    try {
      userData.child("bookmarks").child(key).set(model.toMap()).then((value) => showMessage(context)).onError((error, stackTrace) => printError);
    }catch(e){
      print(e);
    }

  }

  void deleteBookmark(String id){

    userData.child("bookmarks").child(id).remove();
  }

 void showMessage(BuildContext context) async {
   await showDialog(
   context: context,
   builder: (context) =>
       AlertDialog(
         title: const Text("Server message"),
         content: const Text("Added on bookmarks",
             style: TextStyle(fontSize: 16)),

         actions: <Widget>[
           TextButton(
             onPressed: () {
               Navigator.of(context).pop();
             },
             child: const Text('Ok'),
           ),
         ],
       ),
   );
 }

 DatabaseReference databaseRef(){
    return userData.child("bookmarks");
 }

 Future<String?> getUserName() async {

    DatabaseEvent event = await userData.child("userName").once();
    return event.snapshot.value.toString();

 }



}
