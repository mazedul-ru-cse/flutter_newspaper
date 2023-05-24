import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_newspaper/progress/progress_indicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Drawer(
        width: MediaQuery.of(context).size.width*0.8,
        child: ListView(

          children: [


            UserAccountsDrawerHeader(
              currentAccountPicture: Image.asset("assets/images/user.png",),
              accountName: Text("M A Mazedul Islan",style:GoogleFonts.acme(fontSize: 18)),
              accountEmail: Text("mazedulislam4970@gmail.com",style:GoogleFonts.abel(fontSize: 15)),),

            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: ListTile(

                leading: Icon(Icons.star),
                title: Text("Bookmarks",style: GoogleFonts.abel(fontSize: 15),),

              ),
            ),

            GestureDetector(
              onTap: () async {

                //CustomProgressIndicator progressIndicator = CustomProgressIndicator(context);
               // progressIndicator.showDialog("SignOut...", SimpleFontelicoProgressDialogType.threelines);

                Navigator.pop(context);
                //SingOut
                FirebaseAuth.instance.signOut().then((value){
                //progressIndicator.hideDialog();
                  Navigator.pushReplacementNamed(context, "login");

                }).onError((error, stackTrace){
                  //progressIndicator.hideDialog();
                }
                );

              },
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text("SignOut",style: GoogleFonts.abel(fontSize: 15),),

              ),
            )
          ],
        ),
      ),

    );
  }
}
