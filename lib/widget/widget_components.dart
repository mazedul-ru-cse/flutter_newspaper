
import 'package:flutter/material.dart';
import 'package:flutter_newspaper/api/api_service.dart';
import 'package:flutter_newspaper/controller/news_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class WidgetComponents{


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
        IconButton(onPressed: ()=>ApiService().fetch("bangladesh"), icon: Icon(Icons.settings)),
      ],
    );
  }


  Widget getNewsCategory(BuildContext context,NewsController controller){

    return SizedBox(
      height: 40,
      child: ListView(
        // This next line does the trick.
        scrollDirection: Axis.horizontal,
        children: <Widget>[


          // All category
          GestureDetector(
            onTap: ()=> controller.newsCategory("all"),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xff1e88e5)
              ),
              child: Center(child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("All",style: GoogleFonts.abel(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
              )),
            ),
          ),

          const SizedBox(width: 5,),

          //Business category
          GestureDetector(
            onTap: ()=> controller.newsCategory("business"),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff5499C7)
              ),
              child: Center(child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Business",style: GoogleFonts.abel(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
              )),
            ),
          ),

          const SizedBox(width: 5,),


          //National category
          GestureDetector(
            onTap: ()=> controller.newsCategory("bangladesh"),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff5499C7)
              ),
              child: Center(child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("National",style: GoogleFonts.abel(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
              )),
            ),
          ),

          const SizedBox(width: 5,),

          //Entertainment category
          GestureDetector(
            onTap: ()=> controller.newsCategory("entertainment"),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff5499C7)
              ),
              child: Center(child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Entertainment",style: GoogleFonts.abel(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
              )),
            ),
          ),


          const SizedBox(width: 5,),

          //Health category
          GestureDetector(
            onTap: ()=> controller.newsCategory("health"),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff5499C7)
              ),
              child: Center(child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Health",style: GoogleFonts.abel(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
              )),
            ),
          ),

          const SizedBox(width: 5,),

          //Sports category
          GestureDetector(
            onTap: ()=> controller.newsCategory("sports"),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff5499C7)
              ),
              child: Center(child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Sports",style: GoogleFonts.abel(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
              )),
            ),
          ),

          const SizedBox(width: 5,),

          //technology category
          GestureDetector(
            onTap: ()=> controller.newsCategory("technology"),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff5499C7)
              ),
              child: Center(child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Technology",style: GoogleFonts.abel(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
              )),
            ),
          ),

          const SizedBox(width: 5,),

          //Science category
          GestureDetector(
            onTap: ()=> controller.newsCategory("science"),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff5499C7)
              ),
              child: Center(child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Science",style: GoogleFonts.abel(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
              )),
            ),
          ),

          const SizedBox(width: 5,),

          //Politics category
          GestureDetector(
            onTap: ()=> controller.newsCategory("politics"),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff5499C7)
              ),
              child: Center(child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Politics",style: GoogleFonts.abel(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
              )),
            ),
          ),

          const SizedBox(width: 5,),

          //Video category
          GestureDetector(
            onTap: ()=> controller.newsCategory("video"),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff5499C7)
              ),
              child: Center(child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Videos",style: GoogleFonts.abel(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
              )),
            ),
          ),

          const SizedBox(width: 5,),

          //social medial category
          GestureDetector(
            onTap: ()=> controller.newsCategory("social medial"),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff5499C7)
              ),
              child: Center(child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Social Medial",style: GoogleFonts.abel(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
              )),
            ),
          ),

        ],
      ),
    );
  }


}