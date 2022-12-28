import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
List<String> images = [
  'images/baner.png',
];
var selected1 = images[0];



class MyHomePage extends StatefulWidget {
const MyHomePage({Key? key}) : super(key: key);

@override
_MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

// Initial Selected Value


@override
Widget build(BuildContext context) {
      double screen = MediaQuery.of(context).size.width;
    double screen1 = MediaQuery.of(context).size.height;
	return Scaffold(
	appBar: AppBar(
		title: const Text("Geeksforgeeks"),
	),
	body: Center(
		child: Column(
		mainAxisAlignment: MainAxisAlignment.center,
		children: [ Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            height: 368,
            width: screen,
            child: CarouselSlider(
              options: CarouselOptions(
                  autoPlayInterval: const Duration(seconds: 5),
                  autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                  viewportFraction: 1.0,
                  //enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      selected1 = images[index];
                    });
                  },
                  autoPlay: true
                  // autoPlay: false,
                  ),
              items: images
                  .map((item) => Container(
                      margin: EdgeInsets.only(left: screen*0.05, right: screen*0.05),
                      width: screen,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          item,
                          fit: BoxFit.values[0],
                        ),
                      )))
                  .toList(),
            ),
          ),
             SizedBox(height: 5),
          Container(
              width: screen,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    images.length,
                    (index) => Container(
                          margin: const EdgeInsets.all(4),
                          width: selected1 == images[index]
                                ? 25.0:8.0,
                          height: 8.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: selected1 == images[index]
                                ? Color(0xFF293275)
                                : Colors.grey.shade300,
                          ),
                        )),
              ),
            ),
             Container(
                width: 120,
                height: 138,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: Image.asset('icons/ll.png'),
              ),
		],
		),
	),
	);
}
}
