abstract class ProductDetailDataSource {
  Future<List<Map<String, dynamic>>> getDetail();
}

class ProductDetailDataSourceNetwork extends ProductDetailDataSource {
  @override
  Future<List<Map<String, dynamic>>> getDetail() async {
    try {
      List<Map<String, dynamic>> resposne = [
        {
          'id': '150',
          'userName': 'مرتضی',
          'userProfile':
              'https://axneveshte.ir/wp-content/uploads/2022/08/FACK-PESARONE-PROFILE-axneveshte-ir-4.jpg',
          'comment': 'کتاب جالبیه ، ارزش خریدن رو داشت.',
          'stars': 4,
        },
        {
          'id': '580',
          'userName': 'سینا',
          'userProfile':
              'https://profilebaz.ir/wp-content/uploads/2020/05/445739326_212089.jpeg',
          'comment': 'ارسال بوک استور عالیه.کتاب سریع رسید دستم.ممنون♥♥',
          'stars': 5,
        },
        {
          'id': '879',
          'userName': 'مبینا احمدی',
          'userProfile':
              'https://elanet.ir/wp-content/uploads/2023/04/ax-dokhtaraneh-feik-14.jpg',
          'comment': 'کتاب سالم رسید دستم. کتاب عالیههه',
          'stars': 3,
        },
        {
          'id': '834',
          'userName': 'جواتی',
          'userProfile':
              'https://elanet.ir/wp-content/uploads/2023/04/ax-dokhtaraneh-feik-14.jpg',
          'comment':
              'ترجمه کتاب روونه . ولی کیفیت چاپ خیلی بده . برا همین 3 ستاره کم میدم',
          'stars': 2,
        },
        {
          'id': '439',
          'userName': 'آراز',
          'userProfile':
              'https://dajan.ir/wp-content/uploads/2023/05/ax-profail-bedon-cheherh-6.jpg',
          'comment':
              'دوستان این کتاب عااالیه از نظر من. همه چی خوبه . ارسال سریع . گارانتی بازگشت وجه . ارسال رایگان',
          'stars': 5,
        },
      ];
      return resposne;
    } catch (exception) {
      throw Exception('Network Error!');
    }
  }
}
