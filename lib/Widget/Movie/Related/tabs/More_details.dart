import 'package:flutter/material.dart';
class MoreDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.only(top: 15.0),
      child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Customer reviews",style:TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: Text("We don't have any customer reviews",style:TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                   )),
          )
        ],
      ),
    );
  }
}