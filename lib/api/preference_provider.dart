import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PreferenceProvider extends ChangeNotifier {
  bool _loading = false;

  int _currentPage = 0;

  final GlobalKey<ScaffoldState> _homeScaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get homeScaffoldKey => _homeScaffoldKey;

  PageController pageController = PageController();

  int get currentPage => _currentPage;


}