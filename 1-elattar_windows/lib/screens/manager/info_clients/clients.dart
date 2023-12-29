// ignore_for_file: file_names

import 'package:elattar_windows/pdf/test/employee.dart';
import 'package:firedart/firedart.dart';
import 'package:firedart/generated/google/firestore/v1/write.pb.dart';
import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
// import 'employee.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: defaultFirebaseOptions);
//   runApp(MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: const SfDataGridDemo()));
// }
//
// //add your FirebaseOptions details
// const defaultFirebaseOptions = FirebaseOptions(
//   apiKey: '',
//   authDomain: '',
//   projectId: '',
//   storageBucket: '',
//   messagingSenderId: '',
//   appId: '',
// );

class Clients extends StatefulWidget {
  const Clients({Key? key}) : super(key: key);
  static String id = 'Clients';

  @override
  ClientsState createState() => ClientsState();
}

class ClientsState extends State<Clients> {
  late EmployeeDataSource employeeDataSource;
  List<Employee> employeeData = [];

  // final getDataFromFireStore = FirebaseFirestore.instance.collection('Clients').snapshots();
  final getDataFromFireStore = Firestore.instance.collection('Clients').stream;

  Widget _buildDataGrid() {
    return StreamBuilder(
      stream: getDataFromFireStore,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          if (employeeData.isNotEmpty) {
            // to update the value changed at runtime
            // getDataGridRowFromDataBase(DocumentChange<Object?> data) {
            getDataGridRowFromDataBase(DocumentChange data) {
              return DataGridRow(cells: [
                DataGridCell<String>(
                    // columnName: 'clientName', value: data.doc['clientName']),
                    columnName: 'clientName', value: 'clientName'),
                DataGridCell<String>(
                    // columnName: 'clientGovernorate', value: data.doc['clientGovernorate']),
                    columnName: 'clientGovernorate', value: 'clientGovernorate'),
                DataGridCell<String>(
                    // columnName: 'clientAddress', value: data.doc['clientAddress']),
                    columnName: 'clientAddress', value: 'clientAddress'),
                DataGridCell<String>(
                    // columnName: 'clientNumber', value: data.doc['clientNumber'].toString()),
                    columnName: 'clientNumber', value: 'clientNumber',)
              ]);
            }

            for (var data in snapshot.data!.docChanges) {
              // if (data.type == DocumentChangeType.modified) {
              if (data.type == DocumentChange) {
                if (data.oldIndex == data.newIndex) {
                  employeeDataSource.dataGridRows[data.oldIndex] = getDataGridRowFromDataBase(data);
                }
                employeeDataSource.updateDataGridSource();
              // } else if (data.type == DocumentChangeType.added) {
              } else if (data.type == DocumentChange) {
                employeeDataSource.dataGridRows.add(getDataGridRowFromDataBase(data));
                employeeDataSource.updateDataGridSource();
              // } else if (data.type == DocumentChangeType.removed) {
              } else if (data.type == DocumentChange) {
                employeeDataSource.dataGridRows.removeAt(data.oldIndex);
                employeeDataSource.updateDataGridSource();
              }
            }
          } else {
            // for (var data in snapshot.data!.docs) {
            for (var data in snapshot.data!) {
              employeeData.add(
                  Employee(
                    clientName: data['clientName'],
                    clientAddress: data['clientAddress'],
                    clientNumber: data['clientNumber'].toString(),
                    clientGovernorate: data['clientGovernorate'],

                  )
              );
            }
            employeeDataSource = EmployeeDataSource(employeeData);
          }

          return SfDataGrid(
            source: employeeDataSource,
            columns: getColumns,
            columnWidthMode: ColumnWidthMode.fitByCellValue,
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text('العملاء'),
      ),
      body: _buildDataGrid(),
    );
  }
}

class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource(this.employeeData) {
    _buildDataRow();
  }

  List<DataGridRow> dataGridRows = [];
  List<Employee> employeeData;

  void _buildDataRow() {
    dataGridRows = employeeData
        .map<DataGridRow>((e) => DataGridRow(
        cells: [
          // DataGridCell<String>(columnName: 'salesId', value: e.id),

          DataGridCell<String>(columnName: 'clientAddress', value: e.clientAddress),
          DataGridCell<String>(columnName: 'clientNumber', value: e.clientNumber),
          DataGridCell<String>(columnName: 'clientGovernorate', value: e.clientGovernorate),
          DataGridCell<String>(columnName: 'clientName', value: e.clientName),
        ]
    )).toList();
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter buildRow(
      DataGridRow row,
      ) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(1.0),
            child: Text(e.value.toString()),
          );
        }).toList());
  }

  void updateDataGridSource() {
    notifyListeners();
  }
}

List<GridColumn> get getColumns {
  return <GridColumn>[
    GridColumn(
        columnName: 'clientAddress',
        label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text(
              'العنوان',
              overflow: TextOverflow.ellipsis,
            ))),
    GridColumn(
        columnName: 'clientNumber',
        label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text('الرقم'))),
    GridColumn(
        columnName: 'clientGovernorate',
        label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text('المحافظه'))),
    GridColumn(
        columnName: 'clientName',
        label: Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: const Text(
              'الإسم',
            ))),
  ];
}