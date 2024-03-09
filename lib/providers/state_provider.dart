import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import '../models/post.dart';
import '../services/data_repository.dart';

class StateProvider with ChangeNotifier, DiagnosticableTreeMixin {
  int _count = 0;
  List<Post> _data= [];

  int get count => _count;
  List<Post> get data => _data;

  void increment() {
    _count++;
    notifyListeners();
  }

  Future<void> setData(List<Post> data) async{
   _data= data;
   notifyListeners();
  }

  void like(int id) {
    _data[id].likePost();
    debugPrint('_data[id].like= ${_data[id].liked}');
    notifyListeners();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', count));
  }
}