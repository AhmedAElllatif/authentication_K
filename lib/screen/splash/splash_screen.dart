import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/button/button.dart';
import '../../routes/routes.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          //kkk
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image(image: AssetImage('assets/img/splash.png'),
                width: MediaQuery.of(context).size.width - 70,
                height: MediaQuery.of(context).size.height * 0.45,
//                fit: BoxFit.cover,
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.12,
          ),
          Image(image: AssetImage('assets/img/logo.png'),
            width: MediaQuery.of(context).size.width*0.2,
            height: MediaQuery.of(context).size.height*0.1,
            fit: BoxFit.cover,
          ),SizedBox(
            height: 15.0,
          ),
          Text('Get Start Now',style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.w400,
          )),
          SizedBox(
            height: 15.0,
          ),
          Text('We show the easy way to shop just stay where you are',
              textAlign: TextAlign.center
              ,style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w400,
          )),
          SizedBox(
            height: 20.0,
          ),

//          Container(
//            width:  MediaQuery.of(context).size.width*0.7,
//            decoration:   BoxDecoration(
//              color: Colors.deepOrange,
//              borderRadius: BorderRadius.circular(8.0)
//            ),
//              child: MaterialButton(onPressed: (){},child: Text('Get Started Now',style: TextStyle(
//                color: Colors.white,
//                fontSize: 16.0,
//                fontWeight: FontWeight.bold
//              ),),))
          CustomButton(fontSize: 14.0,color: Colors.deepOrange,text:'Get Started Now',onPressed: (){
            goToScreenPushNamedAndpop(
              screenNames: ScreenNames.introScreen,);
          },),

          // last
        ],
      ),
    );
  }
}
