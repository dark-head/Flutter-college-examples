import 'package:flutter/material.dart';
import 'package:test/api/news_api.dart';
import 'package:test/model/articles.dart';
import 'package:test/modules/cardsandmodules.dart';

class NewsDetail extends StatefulWidget {
  const NewsDetail({super.key});

  @override
  State<NewsDetail> createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  Future<newsapi?>? _futureverticallist;

  apicallv() {
    _futureverticallist = GetApi.getnewsdata();
  }

  @override
  void initState() {
    apicallv();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 60,
          ),
          //top
          //stack //image //icon //appbar //back button
          //text title, auther, date and description

          Stack(
            children: [
              Image.network(
                "https://i.ytimg.com/vi/g2E7yl3MwMk/mqdefault.jpg",
                height: size.height / 3.5,
                width: size.width,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 15,
                left: 20,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              const Positioned(
                top: 15,
                right: 20,
                child: Icon(
                  Icons.share,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              SizedBox(
                height: size.height / 3.5,
                width: size.width,
                child: const Center(
                  child: Icon(
                    Icons.play_circle,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          //title
          Container(
            width: size.width / 1.5,
            child: const Text(
              "Masdf asdfad adsfM asdf adsf",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //auther
                Text("cardsandModules.formatDateTimestring"),
                // date
                Text("data")
              ],
            ),
          ),
          //discription
          Container(
            width: size.width / 1.5,
            child: const Text(
              "Masdf asdfad adsfM asdf adsf",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),

          //divider
          const Padding(
            padding: EdgeInsets.only(
              left: 15.0,
              right: 15,
            ),
            child: Divider(
              color: Colors.black26,
              height: 10,
              thickness: 0.8,
            ),
          ),
          //bottom part
          //vertical list card

          //future builder
          FutureBuilder<newsapi?>(
              future:
                  _futureverticallist, // a previously-obtained Future<String> or null
              builder:
                  (BuildContext context, AsyncSnapshot<newsapi?> snapshot) {
                //switch
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    //error
                    return Container(); // paxi dialog box thapne
                  case ConnectionState.waiting: //loading
                    return Center(
                      child: Container(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(),
                      ),
                    ); //
                  case ConnectionState.done:
                    if (snapshot.data == null ||
                        snapshot.data!.articles!.isEmpty) {
                      return Center(
                        child: Container(
                          child: Text("No Data or api issue"),
                        ),
                      );
                    } else {
                      // data ayo
                      //show ui

                      return Container(
                        width: size.width,
                        height: size.height / 1.8,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            padding: const EdgeInsets.all(8),
                            itemCount: snapshot.data!.articles!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ClassAndModules.verticallistitem(
                                  size, snapshot.data!.articles![index]);
                            }),
                      );
                    }
                  default: //error
                    return Container(); //error paxi thapaula
                }
              }),
        ],
      ),
    );
  }
}
