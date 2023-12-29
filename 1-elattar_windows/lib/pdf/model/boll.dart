class Boll {
  // final List<BollItem> items;
  // final UserModelA userModel;
  final List<List<dynamic>> asd;
  final BollInfo info;

  const Boll({
    required this.asd,
    required this.info,
    // required this.items,
    // required this.userModel,
  });
}

class BollInfo {
  final String moderatorName;
  final String clientName;
  final String clientGovernorate;
  final String clientAddress;
  final String clientNumber;
  final String orderDate;
  final int productUnits;
  final int totalPriceProducts;

  final String factory;
  final String address;
  final String number1;
  final String number2;

  const BollInfo({
    required this.moderatorName,
    required this.clientName,
    required this.clientGovernorate,
    required this.clientAddress,
    required this.clientNumber,
    required this.orderDate,
    required this.productUnits,
    required this.totalPriceProducts,

    required this.factory,
    required this.address,
    required this.number1,
    required this.number2,
  });
}



// class BollItem {
//   final String code;
//   final String name;
//   final int num;
//   final int price;
//   final int totalPrice;
//
//   const BollItem({
//     required this.code,
//     required this.name,
//     required this.num,
//     required this.price,
//     required this.totalPrice,
//   });
// }
class UserModelA {
  late String code, name;
  late int num, price,totalPrice ;

  UserModelA(
      {
        required this.code,
        required this.name,
        required this.num,
        required this.price,
        required this.totalPrice,
      }
      );

  UserModelA.fromJson(Map<String, dynamic> map) {
    // ignore: unnecessary_null_comparison
    if (map == null) {return;}
    code = map['code'];
    name = map['name'];
    num = map['num'];
    price = map['price'];
    totalPrice = map['totalPrice'];
  }

  toJson() {
    return {
      'code':code,
      'name':name,
      'num':num,
      'price':price,
      'totalPrice':totalPrice,
    };
  }
}