import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:quotes_clean/core/utils/service_locator.dart' as di;
import 'app.dart';
import 'bloc_observe.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await di.init();
  Bloc.observer = MyBlocObserver();
  runApp( QuateApp());
}



