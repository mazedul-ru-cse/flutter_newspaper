import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_newspaper/progress/progress_indicator.dart';
import 'package:flutter_newspaper/screen/dashboard.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import '../database/database_handler.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {


  //Text edit field key
  final nameFieldKey = GlobalKey<FormState>();
  final emailFieldKey = GlobalKey<FormState>();
  final passwordFieldKey = GlobalKey<FormState>();

  //Text editing controller
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/register.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: Stack(children: [

          Container(
            padding: const EdgeInsets.only(left: 35, top: 80),
            child: const Text(
              "Create\nAccount",
              style: TextStyle(color: Colors.white, fontSize: 33),
            ),
          ),

          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  right: 35,
                  left: 35,
                  top: MediaQuery.of(context).size.height * 0.27),
              child: Column(children: [

                getNameField(),
                const SizedBox(
                  height: 30,
                ),

                getEmailField(),

                const SizedBox(
                  height: 30,
                ),


                getPasswordField(),

                const SizedBox(
                  height: 40,
                ),


                //registration button
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: const Color(0xff4c505b),
                        child: IconButton(
                          color: Colors.white,
                          onPressed: ()=>registrationButton(),
                          icon: const Icon(Icons.arrow_forward),
                        ),
                      ),
                    ]),

                const SizedBox(
                  height: 40,
                ),

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'login');
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ]),
              ]),
            ),
          ),
        ]),
      ),
    );
  }

  Widget getNameField(){

    return Form(

      key: nameFieldKey,

      child: TextFormField(
        controller: nameController,
        keyboardType: TextInputType.text,
        obscureText: false,

        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Name is required.';
          }
          return null;
        },

        decoration: InputDecoration(
            fillColor: Colors.grey.shade100,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),

            labelText: 'Name'),


      ),
    );
  }

  Widget getEmailField(){
    return  Form(

      key: emailFieldKey,

      child: TextFormField(
        controller: emailController,
        keyboardType: TextInputType.text,
        obscureText: false,

        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Email is required.';
          }
          return null;
        },

        decoration: InputDecoration(
            fillColor: Colors.grey.shade100,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),

            labelText: 'Email'),


      ),
    );
  }

  Widget getPasswordField(){

    return  Form(

      key: passwordFieldKey,

      child: TextFormField(
        controller: passwordController,
        keyboardType: TextInputType.text,
        obscureText: false,

        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Password is required.';
          }
          return null;
        },

        decoration: InputDecoration(
            fillColor: Colors.grey.shade100,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),

            labelText: 'Password'),


      ),
    );
  }

  void registrationButton(){

    if(nameFieldKey.currentState!.validate() && emailFieldKey.currentState!.validate() && passwordFieldKey.currentState!.validate()){


      CustomProgressIndicator progressIndicator = CustomProgressIndicator(context);

      //Show progress bar
      progressIndicator.showDialog("Please wait", SimpleFontelicoProgressDialogType.threelines);

      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text

      ).then((value) {


        try {
          progressIndicator.hideDialog();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Dashboard()));
        }catch(e){
          print("Exception : $e");
        }

        //Store user name
        DatabaseHandler().storeUserName(nameController.text);
        //Redirect to login screen
        //Hide progressbar

        log("<--- Account registration : $value");
      }

      ).onError((error, stackTrace) {

        //Hide progressbar
        progressIndicator.hideDialog();

        log("<--- Account registration : $error");

      });
    }

  }

}
