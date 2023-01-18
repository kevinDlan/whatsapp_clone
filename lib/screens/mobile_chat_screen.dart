import 'package:flutter/material.dart';
import 'package:whatsapp/constant/app_const.dart';
import 'package:whatsapp/constant/color.dart';
import 'package:whatsapp/widgets/chat_list.dart';

import '../constant/infos.dart';

class MobileChartScreen extends StatelessWidget {
  const MobileChartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text(
          info[0]['name'].toString(),
        ),
        centerTitle: false,
        leading: const CircleAvatar(
          backgroundImage: NetworkImage(userProfile),
          radius: 25,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.video_call, color: Colors.grey,)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.call, color: Colors.grey,)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert, color: Colors.grey,)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ChatList(),
          ),
          TextField(
            decoration: InputDecoration(
                hintText: 'Type message',
                fillColor: mobileChatBoxColor,
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                    const BorderSide(width: 0, style: BorderStyle.none),
                ),
                contentPadding: const EdgeInsets.all(10),
                prefixIcon: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(
                    Icons.emoji_emotions,
                    color: Colors.grey,
                  ),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.camera_alt, color: Colors.grey,)),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.attach_file, color: Colors.grey,)),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.money, color: Colors.grey)),
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
