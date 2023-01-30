import 'package:flutter/material.dart';
import 'package:whatsapp/constant/color.dart';
import 'package:whatsapp/constant/infos.dart';
import 'package:whatsapp/features/chat/screens/mobile_chat_screen.dart';

class ContactList extends StatelessWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: info.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  //Navigator.of(context).push(MaterialPageRoute(
                  //    builder: (context) => const MobileChartScreen()));
                },
                child: ListTile(
                  title: Text(
                    info[index]['name'].toString(),
                    style: const TextStyle(fontSize: 16),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      info[index]['message'].toString(),
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage(info[index]['profilePic'].toString()),
                    radius: 30,
                  ),
                  trailing: Text(
                    info[index]['time'].toString(),
                    style: const TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ),
              ),
              const Divider(
                color: dividerColor,
                indent: 85,
              )
            ],
          );
        },
      ),
    );
  }
}
