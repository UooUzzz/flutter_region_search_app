import 'package:dio/dio.dart';

class VworldRepository {
  const VworldRepository();

  Future<List<String>> findByCurrent(double lat, double lng) async {
    final Dio dioClient = Dio(BaseOptions(
      validateStatus: (status) => true,
    ));
    // https://api.vworld.kr/req/data
    // request=GetFeature
    // key=13F2292F-8ECD-3502-827E-073057EAD096
    // data=LT_C_ADEMD_INFO
    // geomFilter=POINT(127.0561274 37.513975)
    // geometry=false
    // size=5
    try {
      final response = await dioClient.get(
        'https://api.vworld.kr/req/data',
        queryParameters: {
          'request': 'GetFeature',
          'key': '13F2292F-8ECD-3502-827E-073057EAD096',
          'data': 'LT_C_ADEMD_INFO',
          'geomFilter': 'POINT($lng $lat)',
          'geometry': false,
          'size': 5,
        },
      );
      // response>result> featureCollection>features>>properties>full_nm
      if (response.statusCode == 200 &&
          response.data['response']['status'] == 'OK') {
        final features = response.data['response']['result']['featureCollection']
            ['features'];
        final featureList = List.from(features);
        final iterable = featureList.map((feat) {
          return '${feat['properties']['full_nm']}';
        });
        return iterable.toList();
      }
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }
}
