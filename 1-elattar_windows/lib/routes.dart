import 'package:elattar_windows/screens/login.dart';
import 'package:elattar_windows/screens/manager/groups/groups.dart';
import 'package:elattar_windows/screens/manager/home_manager.dart';
import 'package:elattar_windows/screens/manager/info_clients/clients.dart';
import 'package:elattar_windows/screens/manager/sales/billed.dart';
import 'package:elattar_windows/screens/manager/sales/sales.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>
{
  HomeManager.id :(context) => const HomeManager(),
  Groups.id :(context) => const Groups(),
  Login.id :(context) => const Login(),

  Clients.id :(context) => const Clients(),

  Sales.id :(context) => const Sales(),
  Billed.id :(context) => const Billed(
    clientName: '', clientGovernorate: '', clientAddress: '', clientNumber: '',
    orderDate: '', factory: '', address: '', number1: '', number2: '', salesId: '',
    moderatorName: '', moderatorId: '', productUnits: 0, totalPriceProducts: 0,
  ),
};