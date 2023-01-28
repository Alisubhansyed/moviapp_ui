import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'constant.dart';

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
      theme: ThemeData.dark(),
      // primarySwatch: Colors.blue,
// ,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> adImages = ["skd", "sds", "sds"];
  final CarouselController _controller = CarouselController();
  int _current = 0;

  int point = 0;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 10,
          leadingWidth: 70,
          leading: SizedBox(
            width: 100,
            child: Row(
              children: [
                KWScapcer(17),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    height: 50,
                    width: 50,
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: 40,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 250, 255, 230).withOpacity(0.4),
                    borderRadius: BorderRadius.circular(10)),
                child: const Icon(
                  Icons.notifications_outlined,
                  color: Colors.white,
                )),
            KWScapcer(10),
          ],
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "hello",
                style: secondaryText,
              ),
              Text("Timur K.", style: TextStyle(color: Colors.white)),
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          bottom: PreferredSize(
            // ignore: sort_child_properties_last
            child: Container(
                height: 20,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            point = index;
                          });
                        },
                        child: TopSelectionListViewBuilder(
                          point: point,
                          index: index,
                        ),
                      ),
                    );
                  },
                )),
            // ),
            preferredSize: Size.fromHeight(40),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              KhScapcer(25),
              CarouselSlider(
                items: adImages.asMap().entries.map((entry) {
                  return Builder(
                    builder: (BuildContext context) {
                      return _current != entry.key
                          ? Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      // border: Border.all(
                                      //     width: 2, color: Colors.grey),
                                      borderRadius: BorderRadius.circular(7)),
                                  height: 130,
                                  width: 130,
                                ),
                              ],
                            )
                          : Stack(
                              children: [
                                Container(
                                  height: 150,
                                  width: 160,
                                ),
                                Positioned(
                                  left: 20,
                                  top: 10,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2,
                                            color: Color.fromARGB(
                                                255, 58, 58, 58)),
                                        borderRadius: BorderRadius.circular(7)),
                                    height: 127,
                                    width: 127,
                                    // color: Colors.black,
                                  ),
                                ),
                                Positioned(
                                  left: 10,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        // border: Border.all(
                                        //     width: 2, color: Colors.grey),
                                        borderRadius: BorderRadius.circular(7)),
                                    height: 130,
                                    width: 130,
                                  ),
                                ),
                              ],
                            );
                    },
                  );
                }).toList(),
                carouselController: _controller,
                options: CarouselOptions(
                    viewportFraction: 0.42,
                    // autoPlay: true,
                    aspectRatio: 5 / 2,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
              KhScapcer(5),
              Text(
                adImages[_current],
                style: TextStyle(fontSize: 20),
              ),
              KhScapcer(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: adImages.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 5.0,
                      height: 5.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.white)
                              .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              ),
              Container(
                height: height / 4,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GridTile(
                          child: Container(
                        height: 200,
                        width: 200,
                        color: Colors.amber,
                      )),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("data"), Text("see all")],
                ),
              ),
              Container(
                height: height / 4,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GridTile(
                          child: Container(
                        height: 200,
                        width: 200,
                        color: Colors.amber,
                      )),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TopSelectionListViewBuilder extends StatelessWidget {
  const TopSelectionListViewBuilder({
    required this.point,
    required this.index,
  });

  final int point;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Text(
      "subhan",
      style: TextStyle(
          color: point == index ? Colors.white : Colors.grey, fontSize: 15),
    );
  }
}
