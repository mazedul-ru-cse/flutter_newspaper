import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_newspaper/controller/news_controller.dart';
import 'package:flutter_newspaper/widget/widget_components.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {


  //Instance of WidgetComponents
  late WidgetComponents components;

  NewsController controller = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop:onBackPressed,
      child: Scaffold(
        body: SafeArea(
            child: getBody()
        ),
      )
    );
  }


  Widget getBody(){

    components = WidgetComponents();

    return Card(

      margin: const EdgeInsets.only(top: 0,left: 8,right: 8),

      color: const Color(0xfff1f5fe),
      elevation: 2,

      child: Column(

        children: [

          //Newspaper Name and searchbar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                //news name and date
                components.getNewsNameAndDate(),

                //search and setting button
                components.getSearchAndSettingButton(),

              ],

            ),
          ),


          //News category search
          components.getNewsCategory(context,controller),

          const SizedBox(height: 10),


          // News title list
          Expanded(

              child: GetBuilder<NewsController>(
                init: NewsController(),
                builder: (newsController){

                  if(!newsController.isLoading){
                    return const Center(child: CircularProgressIndicator());
                  }

                  return ListView.builder(
                    itemCount: newsController.news.length,
                    itemBuilder: (context,index){

                      return Card(
                        margin: const EdgeInsets.only(top: 2),
                        elevation: 0,
                        child: ListTile(
                          leading: SizedBox(
                            width: 90,
                            child: Card(

                              elevation: 2,
                                child: newsController.news[index].urlToImage == null ?Image.asset("assets/images/image_not_found.png"):Image.network(newsController.news[index].urlToImage.toString(),fit: BoxFit.fill,)),
                          ),
                          title: Text(newsController.news[index].title.toString(),style: GoogleFonts.acme(fontSize: 15)),
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(newsController.news[index].author.toString(),style: GoogleFonts.abel(fontSize: 10)),
                              Text(newsController.news[index].publishedAt.toString(),style: GoogleFonts.abel(fontSize: 10)),
                            ],
                          ),
                        ),
                      );
                    },

                  );
                }
              )
          ),

          //Show news title list
          const SizedBox(height: 10),

        ],

      ),
    );
  }

  // Back button alert
  Future<bool> onBackPressed() async {

    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('Do you want to exit?.'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => SystemNavigator.pop(),
            child: const Text('Yes'),
          ),
        ],
      ),
    ) ?? false;
  }
}

