import 'package:drug_information/src/models/drug_model.dart';
import 'package:drug_information/utils/database_helper.dart';
import 'package:flutter/material.dart';

import 'drug_details.dart';

class HistoryDrugs extends StatefulWidget {
  @override
  _HistoryDrugsState createState() => _HistoryDrugsState();
}

class _HistoryDrugsState extends State<HistoryDrugs> {
  late DatabaseStatus _dbStatus;

  DatabaseHelper db = DatabaseHelper();

  List<Drug> drugList = [];

  List<String> drugNames = [];

  _getHistoryOfDrugs() async {
    try {
      drugList = await db.getHistoryDrugs();
      for (int i = 0; i < drugList.length; i++) {
        print(drugList[i].name);
        drugNames.add(drugList[i].name);
      }

      setState(() {
        _dbStatus = DatabaseStatus.COMPLETE;
      });
    } catch (e) {
      print("Database error occured : " + e);
      setState(() {
        _dbStatus = DatabaseStatus.FAILED;
      });
    }
  }

  Widget _showDrugsList() {
    switch (_dbStatus) {
      case DatabaseStatus.LOADING:
        return Center(
          child: CircularProgressIndicator(),
        );
      case DatabaseStatus.COMPLETE:
        return ListView.builder(
          itemCount: drugNames.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(drugNames[index]),
                onTap: () {
                  db.addHistoryItem(drugNames[index]);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DrugDetails(drugName: drugNames[index]),
                    ),
                  );
                },
              ),
            );
          },
        );
      case DatabaseStatus.FAILED:
        return Center(
          child: Text("Loading from database failed!"),
        );
    }
  }

  @override
  void initState() {
    _getHistoryOfDrugs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourites"),
      ),
      body: _showDrugsList(),
    );
  }
}

enum DatabaseStatus { LOADING, COMPLETE, FAILED }
