import 'package:flutter/material.dart';

customFormField(String title,Widget child){
  return Container(
    margin: EdgeInsets.all( 10),
    // padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 2),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey.shade400,width: 1,
        )
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Expanded(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title,style: TextStyle(fontSize: 12,color: Colors.grey.shade600),),
          ),
          child
        ],
      )),
    ),
  );
}
