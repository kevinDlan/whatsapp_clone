import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/common/utils/utils.dart';
import 'package:whatsapp/models/user_model.dart';
import 'package:whatsapp/features/chat/screens/mobile_chat_screen.dart';

final selectContactsRepositoryProvider = Provider(
  (ref) => SelectContactRepository(firestore: FirebaseFirestore.instance),
);

class SelectContactRepository {
  final FirebaseFirestore firestore;

  SelectContactRepository({required this.firestore});

  Future<List<Contact>> getContact() async {
    List<Contact> contacts = [];
    try {
      if (await FlutterContacts.requestPermission()) {
        contacts = await FlutterContacts.getContacts(withProperties: true);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return contacts;
  }

  void selectContact(Contact selectedContact, BuildContext context) async
  {
    try
        {
          var userCollection =  await firestore.collection('users').get();
          bool isFound = false;
          for(var doc in userCollection.docs)
            {
              var userData = UserModel.fromMap(doc.data());
              String selectedPhoneNum = selectedContact.phones[0].number.replaceAll(' ', '');
              if(selectedPhoneNum == userData.userPhoneNumber)
                {
                  isFound = true;
                  Navigator.pushNamed(context, MobileChartScreen.routeName, arguments: {
                    "name": userData.name,
                    "uid": userData.uid
                  });
                }
            }
          if(!isFound)
            {
              showSnackBar(context: context, content: "this number is not exist on app.");
            }
        }catch(e)
    {
      print(e.toString());
      showSnackBar(context: context, content: "Something wrong");
    }
  }
}
