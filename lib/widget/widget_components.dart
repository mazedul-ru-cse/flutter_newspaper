import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../data/constant_data.dart';

class WidgetComponents {


  Widget getNewsNameAndDate(){

    String date = DateFormat("MMM, EEE, yyyy").format(DateTime.now());

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text("Top News",style: GoogleFonts.abel(fontSize: 20,fontWeight: FontWeight.bold,wordSpacing: 2)),
        Text(date,style: GoogleFonts.abel(fontSize: 15),),
      ],
    );
  }

  Widget getSearchAndSettingButton(){


    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IconButton(onPressed: (){}, icon: Icon(Icons.search)),
        IconButton(onPressed: ()=>drawerKey.currentState?.openEndDrawer(), icon: Icon(Icons.settings)),
      ],
    );
  }

}
