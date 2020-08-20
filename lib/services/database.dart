import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mothers_kitchen_chef/models/users.dart';
import '../models/ckdatacollectionmodel.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  final CollectionReference chefKitchenDataCollection = Firestore.instance.collection('ChefKitchen\'s');
  Future   updateChefKitchenDataCollection(
      String chefName,
      String chefEmailAddress,
      String chefAltEmailAddress,
      String chefMobile,
      String chefAltMobile,
      String chefAddress,
      String chefLocationCoordinates,
      String chefAdhaarCard,
      String chefPanCard,
      String chefProfileImageUrl,
      String chefBankName,
      String chefBankAccountNo,
      String chefIfscCode,
      String chefUpiId,
      String chefKitchenName,
      String kitchenImageUrl,
      String kitchenId,
      String chefGstNo,
      int chefKitchenRating,
      String dishName,
      String dishId,
      String dishDescription,
      String dishIngredients,
      double dishCost,
      String dishType,
      int dishRating,
      int dishSpicyRating,
      String dishImageUrl,) async {
    return await chefKitchenDataCollection.document(uid).setData({
      'chefName': chefName,
      'chefEmailAddress': chefEmailAddress,
      'chefAltEmailAddress' :chefAltEmailAddress,
      'chefMobile' :chefMobile,
      'chefAltMobile' :chefAltMobile,
      'chefAddress':chefAddress,
      'chefLocationCoordinates' :chefLocationCoordinates,
      'chefAdhaarCard' :chefAdhaarCard,
      'chefPanCard' :chefPanCard,
      'chefProfileImageUrl' :chefProfileImageUrl,
      'chefBankName' :chefBankName,
      'chefBankAccountNo' :chefBankAccountNo,
      'chefIfscCode' :chefIfscCode,
      'chefUpiId' :chefUpiId,
      'chefKitchenName' :chefKitchenName,
      'kitchenImageUrl': kitchenImageUrl,
      'kitchenId': kitchenId,
      'chefGstNo' :chefGstNo,
      'chefKitchenRating' :chefKitchenRating,
      'dishId' :dishId,
      'dishName' :dishName,
      'dishDescription' :dishDescription,
      'dishIngredients' :dishIngredients,
      'dishCost' :dishCost,
      'dishType' :dishType,
      'dishRating' :dishRating,
      'dishSpicyRating' :dishSpicyRating,
      'dishImageUrl' :dishImageUrl,
    });
  }

  List<CkDataCollectionsModel> _ckDataListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc) {
      return CkDataCollectionsModel(
        chefName: doc.data['chefName'] ?? 'JOHN DOE',
        chefEmailAddress: doc.data['chefEmailAddress'] ?? 'steven@xaosity.com',
        chefAltEmailAddress: doc.data['chefAltEmailAddress'] ?? 'jack@xaosity.com',
        chefMobile: doc.data['chefMobile'] ?? '9833088504',
        chefAltMobile: doc.data['chefAltMobile'] ?? '7039006755',
        chefAddress: doc.data['chefAddress'] ?? 'ocniidnc pojdfjksddpk pojsdmkjsmdff',
        chefLocationCoordinates: doc.data['chefLocationCoordinates'] ?? '17.03''20.43',
        chefAdhaarCard: doc.data['chefAdhaarCard'] ?? '99098087932',
        chefPanCard: doc.data['chefPanCard'] ?? 'NBD98NJ9JJ',
        chefProfileImageUrl: doc.data['chefProfileImageUrl'] ?? 'http://xaosity.com/pics/default_food.jpg',
        chefBankName: doc.data['chefBankName'] ?? 'State Back OF ALLINDIA',
        chefBankAccountNo: doc.data['chefBankAccountNo'] ?? '387892374982734023',
        chefIfscCode: doc.data['chefIfscCode'] ?? 'HDKJ00000021',
        chefUpiId: doc.data['chefUpiId'] ?? 'xyz@upi',
        chefKitchenName: doc.data['chefKitchenName'] ?? 'New Kitchen',
        kitchenImageUrl: doc.data['kitchenImageUrl'] ?? 'http://xaosity.com/pics/default_food.jpg',
        kitchenId: doc.data['kitchenId'] ?? 'K1',
        chefGstNo: doc.data['chefGstNo'] ?? 'ONKJNJLKHJNLK299283',
        chefKitchenRating: doc.data['chefKitchenRating'] ?? 5,
        dishName: doc.data['dishName'] ?? 'SweetsDish',
        dishId: doc.data['dishId'] ?? 'd1',
        dishDescription: doc.data['dishDescription'] ?? 'One Killer Dish',
        dishIngredients: doc.data['dishIngredients'] ?? 'Sweet, Salt, Sugar',
        dishCost: doc.data['dishCost'] ?? 99,
        dishType: doc.data['dishType'] ?? 'Veg',
        dishRating: doc.data['dishRating'] ?? 5,
        dishSpicyRating: doc.data['dishSpicyRating'] ?? 5,
        dishImageUrl: doc.data['dishImageUrl'] ?? 'http://xaosity.com/pics/default_food.jpg',
      );
    }).toList();
  }

UserData _userDataFromSnapShot(DocumentSnapshot snapshot){
    return UserData(
      uid: uid,
      chefName: snapshot.data['chefName'],
      chefEmailAddress: snapshot.data['chefEmailAddress'],
      chefAltEmailAddress: snapshot.data['chefAltEmailAddress'],
      chefMobile: snapshot.data['chefMobile'],
      chefAltMobile: snapshot.data['chefAltMobile'],
      chefAddress: snapshot.data['chefAddress'],
      chefLocationCoordinates: snapshot.data['chefLocationCoordinates'],
      chefAdhaarCard: snapshot.data['chefAdhaarCard'],
      chefPanCard: snapshot.data['chefPanCard'],
      chefProfileImageUrl: snapshot.data['chefProfileImageUrl'],
      chefBankName: snapshot.data['chefBankName'],
      chefBankAccountNo: snapshot.data['chefBankAccountNo'],
      chefIfscCode: snapshot.data['chefIfscCode'],
      chefUpiId: snapshot.data['chefUpiId'] ,
      chefKitchenName: snapshot.data['chefKitchenName'] ,
      kitchenImageUrl: snapshot.data['kitchenImageUrl'] ,
      kitchenId: snapshot.data['kitchenId'],
      chefGstNo: snapshot.data['chefGstNo'],
      chefKitchenRating: snapshot.data['chefKitchenRating'],
      dishName: snapshot.data['dishName'],
      dishId: snapshot.data['dishId'],
      dishDescription: snapshot.data['dishDescription'],
      dishIngredients: snapshot.data['dishIngredients'],
      dishCost: snapshot.data['dishCost'],
      dishType: snapshot.data['dishType'],
      dishRating: snapshot.data['dishRating'],
      dishSpicyRating: snapshot.data['dishSpicyRating'],
      dishImageUrl: snapshot.data['dishImageUrl'],
    );
}

  Stream<List<CkDataCollectionsModel>> get ckDataCollection{
    return chefKitchenDataCollection.snapshots().map(_ckDataListFromSnapshot);
  }

  Stream<UserData> get userData {
    return chefKitchenDataCollection.document(uid).snapshots().map(_userDataFromSnapShot);
  }

}

