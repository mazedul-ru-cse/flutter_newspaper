class DataModel{

  Map<String,dynamic>? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  DataModel(this.source, this.author, this.title, this.description, this.url,
      this.urlToImage, this.publishedAt, this.content);


  DataModel.formJson(Map<String,dynamic> json){
    source = json["source"];
    author = json["author"];
    title = json["title"];
    description = json["description"];
    url = json["url"];
    urlToImage = json["urlToImage"];
    publishedAt = json["publishedAt"];
    content = json["content"];
  }

  Map<String,dynamic> toMap(){

    return{
    "source" : source,
    "author" : author,
    "title" : title,
    "description" : description,
    "url" : url,
    "urlToImage" : urlToImage,
    "publishedAt" :  publishedAt,
    "content" : content
    };

  }

}