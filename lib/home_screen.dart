import 'package:flutter/material.dart';
import 'package:rss_reader/rss_service.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          title: Center(child: Text('Spor Haberleri')),
        ),
        body: Container(
          color: Colors.white10,
          child: FutureBuilder(
              future: RssService().getRssFeed(),
              // ignore: missing_return
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.done:
                    return Container(
                      child: ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: Container(
                              child: Image.network(
                                snapshot.data[index].getUrlImg,
                                width: 100.0,
                                height: 100.0,
                                fit: BoxFit.fill,
                              ),
                            ),
                            title: Text(
                              snapshot.data[index].getTitle,
                              style: TextStyle(
                                  fontSize: 25.0, color: Colors.black87),
                            ),
                            subtitle: Text(snapshot.data[index].getTitle),
                          );
                        },
                        itemCount: snapshot.data.length,
                        separatorBuilder: (context, index) => Divider(
                          color: Colors.black,
                        ),
                      ),
                    );
                    break;
                  case ConnectionState.active:
                    return Container();
                    break;
                  case ConnectionState.none:
                    return Container();
                    break;
                  case ConnectionState.waiting:
                    return Container(
                      child: Text(
                        "Haberler Yükleniyor...",
                        textAlign: TextAlign.center,
                        
                        style: TextStyle(fontSize: 25.0,fontFamily: 'roboto',color: Colors.black),
                      ),
                      color: Colors.white,
                    );
                    break;
                }
              }),
        ));
  }
}
