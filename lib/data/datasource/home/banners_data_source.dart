abstract class BannersDataSource {
  Future<List<Map<String, dynamic>>> getAllBanners();
}

class BannersDataSourceNetwork extends BannersDataSource {
  @override
  Future<List<Map<String, dynamic>>> getAllBanners() async {
    try {
      var response = [
        {
          'id': '154',
          'urlAddress':
              'https://imgcdn.taaghche.com/banner/6382235284581324506.jpg?w=500',
        },
        {
          'id': '168',
          'urlAddress':
              'https://imgcdn.taaghche.com/banner/63822755591498209613.jpg?w=500',
        },
        {
          'id': '574',
          'urlAddress':
              'https://imgcdn.taaghche.com/banner/63822755556253187295.jpg?w=500',
        },
      ];
      return response;
    } catch (exception) {
      throw (Exception('Net work Error'));
    }
  }
}
