import 'package:flutter/material.dart';
import 'package:whatsapp/constant/app_const.dart';
import 'package:whatsapp/constant/color.dart';

class WebProfileBar extends StatelessWidget {
  const WebProfileBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Container(
      height: MediaQuery.of(context).size.height * 0.077,
      width: MediaQuery.of(context).size.width * 0.25,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(color: dividerColor)
        ),
        color: webAppBarColor
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage(webProfile),
            radius: 40,
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: const [
               Icon(Icons.comment, color: Colors.grey,),
               Icon(Icons.more_vert, color: Colors.grey,)
            ],
          )
        ],
      ),
    );
  }
}
