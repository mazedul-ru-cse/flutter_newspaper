import 'package:flutter/material.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class CustomProgressIndicator{

  late SimpleFontelicoProgressDialog progressDialog;
  BuildContext context;

  CustomProgressIndicator(this.context);

  // Show progress
  void showDialog(String message, SimpleFontelicoProgressDialogType type){

    progressDialog = SimpleFontelicoProgressDialog(context: context, barrierDimisable: true);
    progressDialog.show(message: message, type: type);

  }

  // hide progress
  void hideDialog(){

    Navigator.of(context, rootNavigator: true).pop();
  }


}