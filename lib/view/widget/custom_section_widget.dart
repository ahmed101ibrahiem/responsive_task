
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customService(
    {required IconData iconData, required Orientation orientation,required String title}) {

  return Container(

    margin: EdgeInsets.all(8.w),
    decoration: BoxDecoration(
        border: Border.all(color: Colors.green,width: 3.w),
        shape: BoxShape.circle
    ),
    child: CircleAvatar(
      //radius: orientation == Orientation.portrait?30.0:60.0,
      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: orientation == Orientation.portrait ? 38.h : 25.w,
          ),
          SizedBox(height: 8.h,),
          Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontWeight:orientation == Orientation.portrait? FontWeight.bold:FontWeight.w900,
                fontSize: 18),
          ),
        ],
      ),
    ),
  );}