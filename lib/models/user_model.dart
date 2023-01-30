class UserModel {
  final String name;
  final String uid;
  final String profilePic;
  final bool isOnline;
  final String userPhoneNumber;
  final List<String> groupId;

  UserModel(
      {required this.name,
      required this.uid,
      required this.profilePic,
      required this.isOnline,
      required this.userPhoneNumber,
      required this.groupId});

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "uid": uid,
      "profilePic": profilePic,
      "isOnline": isOnline,
      "userPhoneNumber": userPhoneNumber,
      "groupId": groupId
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> user) {
    return UserModel(
      name: user["name"] ?? "",
      uid: user["uid"] ?? "",
      profilePic: user["profilePic"] ?? "",
      isOnline: user["isOnline"] ?? false,
      userPhoneNumber: user["userPhoneNumber"] ?? "",
      groupId: List<String>.from(user['groupId']),
    );
  }
}
