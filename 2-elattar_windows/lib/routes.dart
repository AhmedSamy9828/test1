import 'package:elattar_windows/screens/login.dart';
import 'package:elattar_windows/screens/manager/home_manager.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>
{
  HomeManager.id :(context) => const HomeManager(),
  Login.id :(context) => const Login(),
};