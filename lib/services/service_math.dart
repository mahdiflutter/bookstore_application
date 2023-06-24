import 'package:intl/intl.dart';

class CustomMacth {
  static int calcuteDiscount(int discount, int realPrice) {
    var discountPrice = realPrice * discount ~/ 100;
    return realPrice - discountPrice;
  }

  static int discountPrice(int discount, int realPrice) {
    var discountPrice = realPrice * discount ~/ 100;
    return discountPrice;
  }

  static String seperate3Digit(int input) {
    var formater = NumberFormat('###,###,000');
    return formater.format(input);
  }
}
