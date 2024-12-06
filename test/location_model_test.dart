import 'dart:convert';

import 'package:flutter_region_search_app/data/model/location.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Location model test', () {
    String dummyData = """
    {
      "title": "삼성동",
      "link": "",
      "category": "지명>행정지명",
      "description": "",
      "telephone": "",
      "address": "경기도 파주시 법원읍 법원리",
      "roadAddress": "",
      "mapx": "1268803500",
      "mapy": "378578821"
    }
""";
    // 1. Map 으로 변환
    Map<String, dynamic> map = jsonDecode(dummyData);

    // 2. 객체로 변환
    Location location = Location.fromJson(map);
    expect(location.mapx, '1268803500');
    print(location.toJson());
  });
}
