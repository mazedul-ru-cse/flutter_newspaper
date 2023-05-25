import 'package:flutter/material.dart';
import 'package:flutter_newspaper/database/database_handler.dart';
import 'package:flutter_newspaper/model/data_model.dart';
import 'package:flutter_newspaper/screen/news_presenter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Bookmarks extends StatefulWidget {
  const Bookmarks({Key? key}) : super(key: key);

  @override
  State<Bookmarks> createState() => _BookmarksState();
}

class _BookmarksState extends State<Bookmarks> {

  @override
  Widget build(BuildContext context) {

   return Scaffold(

     appBar: AppBar(
       title: Text("Bookmarks",style: GoogleFonts.acme(fontSize: 20),),
       centerTitle: true,
       automaticallyImplyLeading: true,
     ),

     body: Container(
         margin: const EdgeInsets.all(10),
         child: getBody()),

   );
  }

  Widget getBody(){

    return StreamBuilder(
      stream: DatabaseHandler().databaseRef().onValue,

       builder: (context,AsyncSnapshot snapshot ) {

         if(!snapshot.hasData){
           return const Center(child: CircularProgressIndicator());
         }else {


           if(snapshot.data?.snapshot.value == null){
             return const Center(child: Text("Empty"));
           }

            Map bookmarkMap = snapshot.data?.snapshot.value as Map;
            List<dynamic> bookmarkList = bookmarkMap.values.toList();
            List<dynamic> bookmarkId = bookmarkMap.keys.toList();

           return ListView.builder(
              itemCount: bookmarkList.length,
               itemBuilder: (context,index){

                return GestureDetector(
                  onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> NewsPresenter(newsUrl: bookmarkList[index]["url"]))),
                  child: ListTile(
                    leading: Text("${index+1}"),
                    title: Text(bookmarkList[index]["title"].toString(),style: GoogleFonts.acme(fontSize: 15)),
                    subtitle: Text(bookmarkList[index]["author"].toString(),style: GoogleFonts.abel(fontSize: 12)),

                    trailing: IconButton(icon: const Icon(Icons.delete,size: 20,),onPressed: ()=>DatabaseHandler().deleteBookmark(bookmarkId[index])),
                  ),
                );
              }
           );
         }
       }
    );
  }

}
