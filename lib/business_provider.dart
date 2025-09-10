import 'package:flutter/foundation.dart';

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
    await Future.delayed(const Duration(seconds: 1));
    try {
      // Will be replaced with Dio/networking
      _businesses = [
        Business(name: 'Glow & Go Salon', location: 'Atlanta', contact: '+1 404 123 4567'),
        Business(name: 'Fresh Cuts Barbershop', location: 'Lagos', contact: '+234 802 555 1212'),
        Business(name: 'Chef Ama Private Kitchen', location: 'Accra', contact: '+233 24 888 9999'),
      ];
    } catch (e) {
      _error = 'Failed to load businesses';
    }
    _loading = false;
    notifyListeners();
  }
}
