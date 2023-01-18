import 'package:flutter/material.dart';
import 'package:whatsapp/constant/app_const.dart';
import 'package:whatsapp/constant/color.dart';
import 'package:whatsapp/constant/infos.dart';

class WebChartBar extends StatelessWidget
{
  const WebChartBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Container(
      height: MediaQuery.of(context).size.height * 0.077,
      width: MediaQuery.of(context).size.width * 0.75,
      padding: const EdgeInsets.all(10),
      color: appBarColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(webAppbarProfile),
                radius: 30,
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
              Text(info[0]['name'].toString(), style: const TextStyle(fontSize: 18),),
            ],
          ),
          Row(
            children: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.search, color: Colors.grey)),
              IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert, color: Colors.grey,))
            ],
          )
        ],
      ),
    );
  }
}
