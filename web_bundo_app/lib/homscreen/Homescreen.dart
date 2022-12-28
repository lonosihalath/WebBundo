import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:web_bundo_app/homscreen/detail.dart';
import 'package:web_bundo_app/homscreen/homepage.dart';

import 'package:web_bundo_app/productfiles/product_api.dart';
import 'package:web_bundo_app/productfiles/service.dart';
import 'package:web_bundo_app/sigin/login.dart';

List<String> images = ['images/baner.png', 'images/baner.png'];
var selected1 = images[0];

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  final controller = Get.put(Controller());
  String dropdownvalue = 'ENG';
  var items = [
    'ENG',
    'TH',
    'LA',
    'VN',
    'CHN',
  ];
  @override
  Widget build(BuildContext context) {
    double screen = MediaQuery.of(context).size.width;
    double screen1 = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
        appBar: AppBar(
            backgroundColor: Color(0xFF25C4F4),
            toolbarHeight: 103,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/Bundo.png',
                  height: 38,
                  width: 169,
                ),
                Container(
                  height: 42,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  width: screen * 0.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 44,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                              Padding(padding: EdgeInsets.only(left: 10)),
                              Text(
                                'Search in bundo',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'copo_regular',
                                    color: Color(0xFF4D4D4F)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: Color.fromARGB(
                                              255, 231, 225, 225))),
                                  width: 42,
                                  height: 42,
                                  child: Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.grey,
                                  ),
                                ),
                              )
                            ])),
                      ),
                      GestureDetector(
                        child: Container(
                            height: 44,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xFFF2AF21)),
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Text(
                                    'Search',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'copo_regular',
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ))),
                        onTap: (() => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => MyHomePage())))),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 20),
                DropdownButton(
                  // Initial Value
                  value: dropdownvalue,
                  // Down Arrow Icon
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(
                        items,
                      ),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ),
                SizedBox(width: 20),
                Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                SizedBox(width: 20),
                Icon(
                  Icons.person,
                  color: Colors.white,
                )
              ],
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 45,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 105, right: 90, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Text('Promotion',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'copo_regular',
                                    color: Colors.grey)),
                            SizedBox(width: 20),
                            Text('Gift Cart',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'copo_regular',
                                    color: Colors.grey)),
                            SizedBox(width: 20),
                            Text('Sell on Bundo',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'copo_regular',
                                    color: Colors.grey)),
                            SizedBox(width: 20),
                            Text('Track Order ',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'copo_regular',
                                    color: Colors.grey)),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.download,
                              color: Colors.white,
                            ),
                            Text('Dowloads App',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'copo_regular',
                                    color: Colors.grey)),
                            SizedBox(width: 20),
                            GestureDetector(
                              child: Text('Login',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'copo_regular',
                                      color: Colors.grey)),
                              onTap: (() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => logIn())));
                              }),
                            ),
                            SizedBox(width: 40),
                            Text('Signup',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'copo_regular',
                                    color: Colors.grey)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(),
                child: Stack(
                  children: [
                    Container(
                      height: 380,
                      width: screen,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: CarouselSlider(
                        options: CarouselOptions(
                            autoPlayInterval: const Duration(seconds: 5),
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 1000),
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
                                margin: EdgeInsets.only(
                                    left: screen * 0.05, right: screen * 0.05),
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
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 240, left: 25, right: 25),
                      child: Center(
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 250, right: 260),
                              child: Container(
                                height: 130,
                                width: screen,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 20),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            'icons/clothing-store.png',
                                            width: screen * 0.1,
                                            height: 57,
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            'Fashion',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 20),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            'icons/Group18.png',
                                            width: screen * 0.1,
                                            height: 57,
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            'Accessories',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey),
                                          ),
                                          Text(
                                            '& Accessories',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 20),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            'icons/Group21.png',
                                            width: screen * 0.1,
                                            height: 57,
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            'Home Appliances',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 20),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            'icons/Group16.png',
                                            width: screen * 0.1,
                                            height: 57,
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            'Beauty',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 20),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            'icons/Group22.png',
                                            width: screen * 0.1,
                                            height: 57,
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            'Furniture',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 20),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            'icons/volleyball-ball.png',
                                            width: screen * 0.1,
                                            height: 57,
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            'Sport',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 225),
                      child: Container(
                        width: screen,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              images.length,
                              (index) => Container(
                                    margin: const EdgeInsets.all(4),
                                    width:
                                        selected1 == images[index] ? 25.0 : 8.0,
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
                    ),
                  ],
                ),
              ),
              SizedBox(height: 71),
              Container(
                margin: EdgeInsets.only(left: 250, right: 260),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Featured Products',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'copo_regular',
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF717171))),
                    Row(
                      children: [
                        GestureDetector(
                          child: Text('SEE ALL',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'copo_regular',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF60DFFF))),
                          onTap: (() {
                            print(controller.productList[1].name.toString());
                          }),
                        ),
                        Icon(
                          Icons.arrow_right,
                          color: Colors.green,
                          size: 18,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 250, right: 260),
                width: screen,
                height: 1,
                color: Colors.grey,
              ),
              SizedBox(height: 7),
              Container(
                  margin: EdgeInsets.only(left: 250, right: 260, top: 20),
                  width: screen,
                  height: screen1,
                  color: Colors.white,
                  child: Obx(() {
                    if (controller.isLoading.value) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return Center(
                        child: SingleChildScrollView(
                          child: Wrap(
                            spacing: 12,
                            runSpacing: 12,
                            // children: [
                            
                              
                            // ],
                            children: List.generate(
                                controller.productList.length,
                                (index) => Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Container(
                                        height: 230,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color(0xFFF5F5F5),
                                        ),
                                        child: ClipRRect(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                            
                                              GestureDetector(
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.network(
                                                    controller
                                                        .productList[index]
                                                        .image
                                                        .toString(),
                                                    height: 120,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: ((context) =>
                                                              detail(
                                                                index: index,
                                                                band: controller
                                                                    .productList[
                                                                        index]
                                                                    .band
                                                                    .toString(),
                                                                category: controller
                                                                    .productList[
                                                                        index]
                                                                    .category
                                                                    .toString(),
                                                                image: controller
                                                                    .productList[
                                                                        index]
                                                                    .image
                                                                    .toString(),
                                                                name: controller
                                                                    .productList[
                                                                        index]
                                                                    .toString(),
                                                                price: controller
                                                                    .productList[
                                                                        index]
                                                                    .price!
                                                                    .toInt(),
                                                              ))));

                                                  print(controller
                                                      .productList[index].id);
                                                },
                                              ),
                                              SizedBox(height: 30),
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                        controller
                                                            .productList[index]
                                                            .name
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 11))
                                                  ]),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                        '${controller.productList[index].price}ກີບ'),
                                                    GestureDetector(
                                                      child: Icon(
                                                          Icons.shopping_cart,
                                                          color: Colors.pink,
                                                          size: 30),
                                                      onTap: (() {
                                                        print(
                                                            'select product ');
                                                      }),
                                                    )
                                                  ],
                                                ),
                                              )
                                              
                                            ],
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    )),
                          ),
                        ),
                      );
                    }
                  }))
            ],
          ),
        ));
  }
}
