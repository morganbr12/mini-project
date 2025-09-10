import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart' show rootBundle;

class Business {
  final String name;
  final String location;
  final String contact;

  Business({required this.name, required this.location, required this.contact});
}

class BusinessProvider extends ChangeNotifier {
  List<Business> _businesses = [];
  bool _loading = false;
  String? _error;

  List<Business> get businesses => _businesses;
  bool get loading => _loading;
  String? get error => _error;

  Future<void> loadBusinesses() async {
    _loading = true;
    _error = null;
    notifyListeners();
    try {
      final dio = Dio();
      final jsonStr = await rootBundle.loadString('assets/businesses.json');
      final response = await dio.get(
        '',
        options: Options(responseType: ResponseType.json),
        data: jsonStr,
      );
      final List<dynamic> data = response.data ?? [];
      _businesses = data.map((item) {
        return Business(
          name: item['biz_name'] ?? '',
          location: item['bss_location'] ?? '',
          contact: item['contct_no'] ?? '',
        );
      }).toList();
    } catch (e) {
      _error = 'Failed to load businesses';
    }
    _loading = false;
    notifyListeners();
  }
}
