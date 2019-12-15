import 'package:flutter/material.dart';
import 'package:rss_reader/rss_service.dart';
import 'package:xml/xml.dart' as xml;




class Homedeneme extends StatelessWidget {

  RssService rssService = RssService();
  
    @override
  Widget build(BuildContext context) {
    return Container( 
      color: Colors.red,

  child: FlatButton(child: Text("Tıkla"),
  onPressed:() { rssService.getDenemeFeed();
   },
      
    ),);
  }
}


//class Rss{


// void deneme(){
    
//  var client = new http.Client();

//  client.get("https://www.haberturk.com/rss/spor.xml").then((response) {
//     return response.body;
//   }).then((bodyString) {
//     var feed = new RssFeed.parse(bodyString);
//     var feed2 = feed.items.first;
//     print(feed2.description);
//     return feed;
//   });
// }
// }