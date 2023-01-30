import 'package:flutter/material.dart';
import 'package:whatsapp/constant/color.dart';

class BottomChatField extends StatefulWidget {
  const BottomChatField({Key? key}) : super(key: key);

  @override
  State<BottomChatField> createState() => _BottomChatFieldState();
}

class _BottomChatFieldState extends State<BottomChatField> {

  bool showSendButton = false;
  TextEditingController messageEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextField(
              onChanged: (val){
                if(val.isNotEmpty)
                  {
                    setState(() {
                      showSendButton = true;
                    });
                  }else
                    {
                      setState(() {
                        showSendButton = false;
                      });
                    }
              },
              controller: messageEditingController,
          decoration: InputDecoration(
              hintText: 'Type message',
              fillColor: mobileChatBoxColor,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(width: 0, style: BorderStyle.none),
              ),
              contentPadding: const EdgeInsets.all(10),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: (){},
                        icon: const Icon(
                          Icons.emoji_emotions,
                          color: Colors.grey,
                        ),
                      ),
                      IconButton(
                        onPressed: (){},
                        icon: const Icon(
                          Icons.gif,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: SizedBox(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: (){},
                        icon: const Icon(
                              Icons.camera_alt,
                              color: Colors.grey,
                            ),
                      ),
                      IconButton(
                        onPressed: (){},
                        icon: const Icon(
                              Icons.attach_file,
                              color: Colors.grey,
                            ),
                      ),
                    ],
                  ),
                ),
              )),
        )),
         Padding(
          padding: const EdgeInsets.only(bottom: 8.0, right: 2.0, left: 2.0),
          child: CircleAvatar(
            radius: 25,
            backgroundColor: const Color(0xFF128C7E),
            child: Icon(
              showSendButton ? Icons.send : Icons.mic,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
