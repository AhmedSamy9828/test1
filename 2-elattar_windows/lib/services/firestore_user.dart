// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:elattar_windows/model/user_model.dart';
//
// class FireStoreUser{
//   final CollectionReference _userCollectionRef = FirebaseFirestore.instance.collection('Moderators');
//   Future<void> addUserToFireStore(UserModel userModel) async {
//     return await _userCollectionRef.doc(userModel.userId).set(userModel.toJson());
//   }
// }