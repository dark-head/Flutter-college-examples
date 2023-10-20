import 'package:flutter/material.dart';
import 'package:test/pages/news/newsdetail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const NewsDetail(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  horizontalcard(var size) {
    return Stack(
      children: [
        Container(
          height: size.height / 4,
          width: size.width / 1.5,
          margin: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              "https://i.ytimg.com/vi/g2E7yl3MwMk/mqdefault.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          left: 15,
          bottom: 30,
          child: Container(
            width: size.width / 1.7,
            child: const Text(
              "HELLO NEWS CHANNEL 2023 UPDATE HERE HELLO NEWS CHANNEL 2023 UPDATE HERE",
              maxLines: 2,
            ),
          ),
        ),
        const Positioned(
          bottom: 10,
          left: 15,
          child: Text("25th OCT 2023"),
        ),
        const Positioned(
          bottom: 10,
          right: 15,
          child: Icon(
            Icons.play_circle,
            size: 40,
          ),
        )
      ],
    );
  }

  vertiaclcard(var size) {
    return Row(
      children: [
        Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10, top: 10),
                  height: 150,
                  width: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      "https://i.ytimg.com/vi/g2E7yl3MwMk/mqdefault.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Positioned(
                  left: 85,
                  top: 60,
                  child: Icon(
                    Icons.play_circle,
                    color: Colors.white,
                    size: 30,
                  ),
                )
              ],
            ),
          ],
        ),
        Column(
          children: [
            Container(
              width: size.width / 2,
              child: const Text(
                "NEWS CHANNEL 2023 UPDATE HERE",
                maxLines: 2,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 15,
                    bottom: 15,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    "Order",
                    maxLines: 2,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Text(
                    "May 26 2023",
                    maxLines: 2,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // horizontalcard(size),
            Container(
              height: size.height / 4,
              width: size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return horizontalcard(size);
                },
              ),
            ),
            Container(
              width: size.width,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                primary: true,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return vertiaclcard(size);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
