

import 'package:flutter_region_search_app/data/repository/location_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  test('locationRepository test', () async {
    LocationRepository locationRepository = LocationRepository();
    final locations = await locationRepository.searchLocation('samseong-dong');
    expect(locations.isEmpty, false);
    for (var location in locations) {
      print(location.toJson());
    }
  });
}