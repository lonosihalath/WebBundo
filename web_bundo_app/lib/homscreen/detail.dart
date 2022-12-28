import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:web_bundo_app/productfiles/service.dart';

class detail extends StatefulWidget {
  int price;
  String name, category, band, image;
  int index;

  detail(
      {Key? key,
      required this.band,
      required,
      required this.category,
      required this.image,
      required this.name,
      required this.price,
      required this.index,
      
      })
      : super(key: key);

  @override
  State<detail> createState() => _detailState();
}

class _detailState extends State<detail> {
    final controller = Get.put(Controller());

  final controller1 = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    double screen = MediaQuery.of(context).size.width;
    double screenh = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(

        title: Center(
          child: Text('Detail Product'),
          
        ),
        actions: [

        ],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 20,
              ),
              child: Container(
                
                height: 550,
                width: 450,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                   ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  Container(
                     height: 470, 
                     width: 420,
                    
                    margin: EdgeInsets.only(top: 10,left: 10,right: 10),
                    
                      child: ClipRRect(
                        
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          widget.image.toString(),
                           height: 470, 
                           width: 420,
                           ),
                      )
                      ),
                      Text('ລາຄາ  '+widget.price.toString()+' ກີບ',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.pink),),
                      SizedBox(height: 10),
                      
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
