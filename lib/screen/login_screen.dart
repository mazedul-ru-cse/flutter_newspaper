import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_newspaper/data/constant_data.dart';
import 'package:flutter_newspaper/progress/progress_indicator.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  //Text edit field key
  final emailFieldKey = GlobalKey<FormState>();
  final passwordFieldKey = GlobalKey<FormState>();

  //Text editing controller
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // if(FirebaseAuth.instance.currentUser?.uid != null){
    //   Navigator.pushReplacementNamed(context, "dashboard");
    // }

  }

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/login.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Container(
            padding: const EdgeInsets.only(left: 35, top: 80),
            child: const Text(
              "Welcome\nBack",
              style: TextStyle(color: Colors.white, fontSize: 33),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  right: 35,
                  left: 35,
                  top: MediaQuery.of(context).size.height * 0.5),
              child: Column(children: [

                getEmailField(),

                const SizedBox(
                  height: 30,
                ),

                getPasswordField(),

                const SizedBox(
                  height: 40,
                ),

                //Login button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Sign In',
                      style: TextStyle(
                        color: Color(0xff4c505b),
                        fontSize: 27,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: const Color(0xff4c505b),
                      child: IconButton(
                        color: Colors.white,
                        onPressed: ()=> loginButton(),
                        icon: const Icon(Icons.arrow_forward),
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 40,
                ),

                //SignUp button
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: ()=> Navigator.pushNamed(context, 'register'),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                            color: Color(0xff4c505b),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot Password',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                            color: Color(0xff4c505b),
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

  Widget getEmailField(){

    return Form(

      key: emailFieldKey,

      child: TextFormField(
        keyboardType: TextInputType.text,
        obscureText: false,
        controller: emailController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Email is required.';
          }
          return null;
        },

        decoration: InputDecoration(
            fillColor: Colors.grey.shade100,
            filled: true,
            prefixIcon: Icon(
                Icons.email,
                color: Colors.black26
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),

            labelText: 'Email'),


      ),
    );
  }

  Widget getPasswordField(){

    return Form(

      key: passwordFieldKey,

      child: TextFormField(
        keyboardType: TextInputType.text,
        obscureText: true,
        controller: passwordController,

        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Password is required.';
          }
          return null;
        },

        decoration: InputDecoration(
            fillColor: Colors.grey.shade100,
            filled: true,
            prefixIcon: const Icon(
                Icons.lock_open,
                color: Colors.black26
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),

            labelText: 'Password'),


      ),
    );
  }


  void loginButton(){


    if(emailFieldKey.currentState!.validate() && passwordFieldKey.currentState!.validate()){


      CustomProgressIndicator progressIndicator = CustomProgressIndicator(context);

      //Show login progressbar
      progressIndicator.showDialog("Login", SimpleFontelicoProgressDialogType.threelines);

      //Login credential
      FirebaseAuth.instance.signInWithEmailAndPassword(

          email: emailController.text,
          password: passwordController.text

      ).then((value){

        //Hide login progressbar
        progressIndicator.hideDialog();
        log("<--- Login : $value");

        print(value.user?.uid.toString());

        token = value.user?.uid.toString();

        Navigator.pushReplacementNamed(context, "dashboard");
      }

      ).onError((error, stackTrace) {

        //Hide login progressbar
        progressIndicator.hideDialog();
        log("<--- Login failed : $error");
      });

    }

  }
}

