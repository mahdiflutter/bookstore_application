abstract class CategoriesDataSource {
  Future<List<Map<String, dynamic>>> getAllCategories();
}

class CategoriesDataSourceNetwork extends CategoriesDataSource {
  @override
  Future<List<Map<String, dynamic>>> getAllCategories() async {
    try {
      List<Map<String, dynamic>> response = [
        {
          'id': '0',
          'title': 'کمک درسی',
          'iconUrl': 'https://img.taaghche.com/logo/52.png'
        },
        {
          'id': '1',
          'title': 'زبان خارجی',
          'iconUrl': 'https://img.taaghche.com/logo/50.png'
        },
        {
          'id': '2',
          'title': 'ادبیات',
          'iconUrl': 'https://img.taaghche.com/logo/31.png'
        },
        {
          'id': '3',
          'title': 'تاریخ',
          'iconUrl': 'https://img.taaghche.com/logo/37.png'
        },
        {
          'id': '4',
          'title': 'داستان',
          'iconUrl': 'https://img.taaghche.com/logo/58.png'
        },
        {
          'id': '5',
          'title': 'روان شناسی',
          'iconUrl': 'https://img.taaghche.com/logo/32.png'
        },
      ];
      return response;
    } catch (exception) {
      throw (
        Exception(
          'Network Error!',
        ),
      );
    }
  }
}
