import 'package:rss_reader/rss_model.dart';
import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;

// class RssService {
//   final _targetUrl = 'https://www.haberturk.com/rss/spor.xml';

//   Future<RssFeed> getFeed() =>
//       http.read(_targetUrl).then((description) => RssFeed.parse(description));
// }

class RssService {
  Future<List<Feeds>> getRssFeed() async {
    var data = await http.get('http://www.hurriyet.com.tr/rss/anasayfa'
       );

    List<Feeds> feed = new List();

    var rssFeed = new RssFeed.parse(data.body);

    for (int i = 0; i < rssFeed.items.length; i++) {
      print("Başlık:" + rssFeed.items[i].title);
      print("Açıklama:" + rssFeed.items[i].description);
      print("Link:" + rssFeed.items[i].link);
      print("Foto Url" + rssFeed.items[i].enclosure.url);
      print("\n");

      feed.add(new Feeds(rssFeed.items[i].title, rssFeed.items[i].description,
          rssFeed.items[i].link, rssFeed.items[i].enclosure.url));
    }

    return feed;
  }



Future<List<Feeds>> getAtomFeed() async {
    var data = await http.get('https://www.ntv.com.tr/gundem.rss'
       );

    List<Feeds> feed = new List();

    var atomFeed = new AtomFeed.parse(data.body);

    for (int i = 0; i < atomFeed.items.length; i++) {
      print("Başlık:" + atomFeed.items[i].title);
      print("Açıklama:" + atomFeed.items[i].summary);
      print("Link:" + atomFeed.items[i].published);
      print("Foto Url" + atomFeed.items[i].content);
      print("\n");

      feed.add(new Feeds(atomFeed.items[i].title, atomFeed.items[i].summary,
          atomFeed.items[i].published, atomFeed.items[i].content));
    }

    return feed;
  }


  getDenemeFeed (){


var data =  http.get('https://www.ntv.com.tr/gundem.rss');
       
    var document = xml.parse(data.toString());


    return print(document.toXmlString(pretty: true, indent: '\t'));


  }
}
