abstract class ProductsDataSource {
  Future<List<Map<String, dynamic>>> getAllProducts();
}

class ProductsDataSourceNetwork extends ProductsDataSource {
  @override
  Future<List<Map<String, dynamic>>> getAllProducts() async {
    try {
      final List<Map<String, dynamic>> response = getProducts();
      return response;
    } catch (exception) {
      throw Exception('Network Error');
    }
  }
}

List<Map<String, dynamic>> getProducts() {
  return [
    {
      'id': '120',
      'categoryId': 'کمک درسی',
      'name': 'ریاضیات کانگرو',
      'imgUrl': 'https://img.taaghche.com/frontCover/149209.jpg?w=150',
      'writerName': 'جعفر اسد',
      'publisher': 'فاطمی',
      'translator': '',
      'realPrice': 150000,
      'discount': 10,
      'publishYear': 'تابستان 1401',
      'pageCount': 182,
      'fontFamily': 'وزیر',
      'bookType': 'رحلی',
    },
    {
      'id': '524',
      'categoryId': 'داستان',
      'name': 'ضیافت شکار',
      'imgUrl': 'https://img.taaghche.com/frontCover/147771.jpg?w=150',
      'writerName': 'لوسی فولی',
      'publisher': 'البرز',
      'translator': 'فاطمه مهرکی',
      'realPrice': 300000,
      'discount': 5,
      'publishYear': 'بهار 1401',
      'pageCount': 190,
      'fontFamily': 'وزیر',
      'bookType': 'شومیز',
    },
    {
      'id': '100',
      'categoryId': 'ادبیات',
      'name': 'زبان کردی',
      'imgUrl': 'https://img.taaghche.com/frontCover/126386.jpg?w=150',
      'writerName': 'میرزا رضایی',
      'publisher': 'کردستان',
      'translator': '',
      'realPrice': 90000,
      'discount': 0,
      'publishYear': 'پاییز 1399',
      'pageCount': 90,
      'fontFamily': 'وزیر',
      'bookType': 'شومیز',
    },
    {
      'id': '697',
      'categoryId': 'روان شناسی',
      'name': 'عادت های اتمی',
      'imgUrl': 'https://img.taaghche.com/frontCover/132072.jpg?w=150',
      'writerName': 'جیمز کلیر',
      'publisher': 'شنیدار',
      'translator': 'رضا اردلان',
      'realPrice': 150000,
      'discount': 40,
      'publishYear': 'بهار 1402',
      'pageCount': 160,
      'fontFamily': 'شبنم',
      'bookType': 'رحلی',
    },
    {
      'id': '467',
      'categoryId': 'روان شناسی',
      'name': 'دوباره فکر کن',
      'imgUrl': 'https://img.taaghche.com/frontCover/117005.jpg?w=150',
      'writerName': 'آدام گرانت',
      'publisher': 'سبکتو',
      'translator': 'فاطمه فراهانی',
      'realPrice': 120000,
      'discount': 10,
      'publishYear': 'تابستان 1401',
      'pageCount': 134,
      'fontFamily': 'شبنم',
      'bookType': 'شومیز',
    },
    {
      'id': '789',
      'categoryId': 'روان شناسی',
      'name': 'اثر مرکب',
      'imgUrl': 'https://img.taaghche.com/frontCover/14694.jpg?w=150',
      'writerName': 'دارن هاردی',
      'publisher': 'نواندیش',
      'translator': 'اکبر عباسی',
      'realPrice': 85000,
      'discount': 0,
      'publishYear': 'پاییز 1400',
      'pageCount': 87,
      'fontFamily': 'شبنم',
      'bookType': 'رحلی',
    },
    {
      'id': '123',
      'categoryId': 'تاریخ',
      'name': 'آزاد',
      'imgUrl': 'https://img.taaghche.com/frontCover/142030.jpg?w=150',
      'writerName': 'لیا چی',
      'publisher': 'چلچله',
      'translator': 'مهدی مهریار',
      'realPrice': 200000,
      'discount': 30,
      'publishYear': 'تابستان 1397',
      'pageCount': 280,
      'fontFamily': 'شبنم',
      'bookType': 'رحلی',
    },
    {
      'id': '456',
      'categoryId': 'زبان خارجی',
      'name': '504 لغت ضروری',
      'imgUrl': 'https://img.taaghche.com/frontCover/156597.jpg?w=150',
      'writerName': 'مورای بورامبگ',
      'publisher': 'طباهنگ',
      'translator': '',
      'realPrice': 250000,
      'discount': 0,
      'publishYear': 'بهار 1394',
      'pageCount': 320,
      'fontFamily': 'Times',
      'bookType': 'رحلی',
    },
  ];
}
