import 'package:flutter_region_search_app/data/model/location.dart';
import 'package:flutter_region_search_app/data/repository/location_repository.dart';
import 'package:flutter_region_search_app/data/repository/vworld_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 상태 클래스 만들기
class HomeState {
  List<Location> locations;
  HomeState({required this.locations});
}

// 2. 뷰모델 만들기 - Notifier 상속
class SearchViewModel extends AutoDisposeNotifier<HomeState> {
  @override
  HomeState build() {
    return HomeState(locations: []);
  }

  final locationRepository = LocationRepository();
  final vworldRepository = VworldRepository();

  void searchByName(String query) async {
    final result = await locationRepository.findByName(query);
    state = HomeState(locations: result);
  }
  void searchByCurrent(double lat, double lng) async {
    final locationResult = await vworldRepository.findByCurrent(lat, lng);
    if (locationResult.isNotEmpty) {
      searchByName(locationResult.first);
    }
  }
}

// 3. 뷰모델 관리자 만들기 - NotifierProvider 객체
final searchViewModelProvider =
    NotifierProvider.autoDispose<SearchViewModel, HomeState>(() {
  return SearchViewModel();
});
