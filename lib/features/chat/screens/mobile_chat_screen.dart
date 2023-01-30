import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/common/widgets/loader.dart';
import 'package:whatsapp/constant/color.dart';
import 'package:whatsapp/features/auth/controller/auth_controller.dart';
import 'package:whatsapp/models/user_model.dart';
import 'package:whatsapp/widgets/chat_list.dart';

class MobileChartScreen extends ConsumerWidget {
  final Map<String, dynamic> user;
  const MobileChartScreen({Key? key, required this.user}) : super(key: key);
  static const String routeName = "/mobile-chat-screen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: StreamBuilder<UserModel>(
            stream: ref.read(authControllerProvider).userDataById(user['uid']),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Loader();
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user['name']),
                  Text(
                    snapshot.data!.isOnline ? 'online' : 'offline',
                    style: TextStyle(
                       fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: snapshot.data!.isOnline
                            ? Colors.green
                            : Colors.grey),
                  )
                ],
              );
            }),
        centerTitle: false,
        //leading: const CircleAvatar(
        //  backgroundImage: NetworkImage(userProfile),
        //  radius: 25,
        //),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.video_call,
                color: Colors.grey,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.call,
                color: Colors.grey,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: Colors.grey,
              )),
        ],
      ),
      body: Column(
        children: [
          const Expanded(
            child: ChatList(),
          ),

        ],
      ),
    );
  }
}
