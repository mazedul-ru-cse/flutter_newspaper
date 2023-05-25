import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_newspaper/database/database_handler.dart';
import 'package:google_fonts/google_fonts.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {


  String userName = "";

  @override
  void initState() {

    setUsername();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    String? userEmail = FirebaseAuth.instance.currentUser?.email.toString();

    return SafeArea(

      child: Drawer(
        width: MediaQuery.of(context).size.width*0.8,
        child: ListView(

          children: [


            UserAccountsDrawerHeader(
              currentAccountPicture: Image.asset("assets/images/user.png",),
              accountName: Text(userName,style:GoogleFonts.acme(fontSize: 18)),
              accountEmail: Text(userEmail.toString(),style:GoogleFonts.abel(fontSize: 15)),),

            GestureDetector(
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, "bookmarks");
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

  void setUsername() async {

    String? data = await DatabaseHandler().getUserName();
    setState(() {
      userName = data!;
    });


  }
}
