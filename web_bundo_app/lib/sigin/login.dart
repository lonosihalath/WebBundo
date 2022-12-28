import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class logIn extends StatefulWidget {
  const logIn({Key? key}) : super(key: key);

  @override
  State<logIn> createState() => _logInState();
}

class _logInState extends State<logIn> {
  @override
  Widget build(BuildContext context) {
    double screen = MediaQuery.of(context).size.width;
    double screen1 = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Wrap(
          children: [
            Stack(
              
              children: [
                
                Container(
                  width: 320,
                  height: 620,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(width: 2,color: Colors.blue)),
                  child: Column(
                    children: [
                  
                      Container(
                        width:screen ,
                        height: 60,
                         decoration: BoxDecoration(borderRadius: BorderRadius.only(),color: Colors.blue),
                     
                        child: Center(
                          child: Text('ສະຫມັກ ຫຼື ເຂົ້າສູ່ລະບົບ',style: TextStyle(color: Colors.white,fontSize: 14)),
                        ),
                      )

                    ],
                  ),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}