import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_newspaper/controller/news_controller.dart';
import 'package:flutter_newspaper/widget/widget_components.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {


  //Instance of WidgetComponents
  late WidgetComponents components;


  @override
  void initState() {

    //Initialize
    super.initState();
  }

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
      margin: const EdgeInsets.only(top: 0,left: 5,right: 5),
      color: const Color(0xfff1f5fe),
      elevation: 2,

      child: Column(

        children: [

          //News title and searchbar
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

          Expanded(

              child: GetBuilder<NewsController>(
                init: NewsController(),
                builder: (newsController){

                  if(!newsController.isLoading){
                    return Center(child: CircularProgressIndicator());
                  }

                  return ListView.builder(
                    itemCount: newsController.news.length,
                    itemBuilder: (context,index){

                      return Card(
                        child: ListTile(
                          leading: Image.network(newsController.news[index].urlToImage.toString()),
                          title: Text(newsController.news[index].title.toString()),
                          subtitle: Text(newsController.news[index].publishedAt.toString()),
                        ),
                      );
                    },

                  );
                }
              )
          ),

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

