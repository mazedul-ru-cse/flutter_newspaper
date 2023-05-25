import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_newspaper/controller/news_controller.dart';
import 'package:flutter_newspaper/database/database_handler.dart';
import 'package:flutter_newspaper/widget/settings.dart';
import 'package:flutter_newspaper/widget/widget_components.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/constant_data.dart';
import 'news_presenter.dart';

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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(

      onWillPop:onBackPressed,
      child: Scaffold(
        key: drawerKey,
        body: SafeArea(
            child: getBody()
        ),
        endDrawer: const Setting(),
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
          getNewsCategory(),

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

                      return GestureDetector(
                        onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsPresenter(newsUrl: newsController.news[index].url.toString()))),

                        child: Card(
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
                                Text(newsController.news[index].author.toString(),style: GoogleFonts.abel(fontSize: 12)),
                                Text(newsController.news[index].publishedAt.toString(),style: GoogleFonts.abel(fontSize: 12)),
                              ],
                            ),
                            trailing: IconButton(onPressed: ()=>DatabaseHandler().addBookmark(context, newsController.news[index]), icon: Icon(Icons.star,size: 20)),
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


  Widget getNewsCategory(){

    return SizedBox(
      height: 40,
      child: ListView(
        // This next line does the trick.
        scrollDirection: Axis.horizontal,
        children: <Widget>[


          // All category
          GestureDetector(
            onTap: (){
              controller.newsCategory("all");
              setCategoryButtonIndicator("all");
              },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:  all? Color(0xff1e88e5) : Color(0xff5499C7)
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
            onTap: (){
              controller.newsCategory("business");
              setCategoryButtonIndicator("business");
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:  business? Color(0xff1e88e5) : Color(0xff5499C7)
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
            onTap: (){
              controller.newsCategory("national");
              setCategoryButtonIndicator("national");
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:  national? Color(0xff1e88e5) : Color(0xff5499C7)
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
            onTap: (){
              controller.newsCategory("entertainment");
              setCategoryButtonIndicator("entertainment");
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:  entertainment? Color(0xff1e88e5) : Color(0xff5499C7)
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
            onTap: (){
              controller.newsCategory("health");
              setCategoryButtonIndicator("health");
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:  health? Color(0xff1e88e5) : Color(0xff5499C7)
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
            onTap: (){
              controller.newsCategory("sports");
              setCategoryButtonIndicator("sports");
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:  sports? Color(0xff1e88e5) : Color(0xff5499C7)
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
            onTap: (){
              controller.newsCategory("technology");
              setCategoryButtonIndicator("technology");
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:  technology? Color(0xff1e88e5) : Color(0xff5499C7)
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
            onTap: (){
              controller.newsCategory("science");
              setCategoryButtonIndicator("science");
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:  science? Color(0xff1e88e5) : Color(0xff5499C7)
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
            onTap: (){
              controller.newsCategory("politics");
              setCategoryButtonIndicator("politics");
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:  politics ? Color(0xff1e88e5) : Color(0xff5499C7)
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
            onTap: (){
              controller.newsCategory("video");
              setCategoryButtonIndicator("video");
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:  video ? Color(0xff1e88e5) : Color(0xff5499C7)

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
            onTap: (){
              controller.newsCategory("social media");
              setCategoryButtonIndicator("social media");
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:  socialMedia ? Color(0xff1e88e5) : Color(0xff5499C7)

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


  bool all = true;
  bool business = false;
  bool national = false;
  bool entertainment = false;
  bool health = false;
  bool sports = false;
  bool technology = false;
  bool science = false;
  bool politics = false;
  bool video = false;
  bool socialMedia = false;

  void setCategoryButtonIndicator(String indicator){

    switch(indicator){

      case "all": setState((){
        all = true;
        business = national = entertainment = health = sports = technology = science = video = politics = socialMedia = false;
      });

      break;

      case "business": setState((){
        business = true;
        all  = national = entertainment = health = sports = technology = science = video = politics = socialMedia = false;
      });
      break;


      case "national": setState((){
        national = true;
        all  = business = entertainment = health = sports = technology = science = video = politics = socialMedia = false;
      });
      break;


      case "entertainment": setState((){
        entertainment = true;
        all  = business = national = health = sports = technology = science = video = politics = socialMedia = false;
      });
      break;

      case "health": setState((){
        health = true;
        all  = business = national = entertainment = sports = technology = science = video = politics = socialMedia = false;
      });
      break;

      case "sports": setState((){
        sports = true;
        all  = business = national = entertainment = health = technology = science = video = politics = socialMedia = false;
      });
      break;

      case "technology": setState((){
        technology = true;
        all  = business = national = entertainment = health = sports = science = video =  politics = socialMedia = false;
      });
      break;

      case "science": setState((){
        science = true;
        all  = business = national = entertainment = health = sports = technology = video = politics = socialMedia = false;
      });
      break;

      case "video": setState((){
        video = true;
        all  = business = national = entertainment = health = sports = technology = science = politics = socialMedia = false;
      });
      break;


      case "social media": setState((){
        socialMedia = true;
        all = business = national = entertainment = health = sports = technology = science = video = politics = false;
      });

      case "politics": setState((){
        politics = true;
        all = business = national = entertainment = health = sports = technology = science = video = socialMedia = false;
      });

      break;

    }

  }
}


