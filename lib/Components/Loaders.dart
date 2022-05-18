

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

showLoading(context){
  return showDialog(context: context, builder: (c){
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.white,
      content: Container(
        height: 150,
        child: Column(
          children: [
            SizedBox(height: 10,),
            Lottie.asset('assets/loader.json',width: 100,height: 100, ),
            SizedBox(height: 10,),
            Text("Loading ...",style: TextStyle(color: Colors.black),),
          ],
        ),
      ),
    );
  });
}
Future showDoneDialogue(context)async{
  Navigator.pop(context);
  showDialog(context: context, builder: (c){
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.black,
      content: Container(
        height: 150,
        child: Column(
          children: [
            SizedBox(height: 20,),
            Container(
              height: 60,width: 60,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green
              ),
              child: Icon(Icons.done_rounded,color: Colors.white,),
            ),
            SizedBox(height: 30,),
            Text("Done !",style: TextStyle(color: Colors.white),),
          ],
        ),
      ),
    );
  });
  await Future.delayed(Duration(seconds: 2));
  Navigator.pop(context);
}