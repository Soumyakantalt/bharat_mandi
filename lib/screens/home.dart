import 'package:bharat_mandi/model/DataModelResponse.dart';
import 'package:bharat_mandi/services/api_service.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late var _dataModelResponse = DataModelResponse();

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _dataModelResponse = (await ApiService().getData())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agri Data'),
      ),
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    if (_dataModelResponse.records != null) {
      return Container(
        child: SizedBox.expand(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: _dataModelResponse!.records!.length,
            itemBuilder: (context, index) {
              return Card(
              elevation: 8,
                  margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 24.0, bottom: 24.0),
                  child: Container(
                    padding: EdgeInsets.all(8),
              child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Text("State:", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),),
                          ),
                          SizedBox(width: 4,),
                          Container(
                            child: Text("${_dataModelResponse!.records![index].state}", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: Text("District:", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),),
                          ),
                          SizedBox(width: 4,),
                          Container(
                            child: Text("${_dataModelResponse!.records![index].district}", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: Text("Market:", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),),
                          ),
                          SizedBox(width: 4,),
                          Container(
                            child: Text("${_dataModelResponse!.records![index].market}", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: Text("Commodity:", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),),
                          ),
                          SizedBox(width: 4,),
                          Container(
                            child: Text("${_dataModelResponse!.records![index].commodity}", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: Text("Variety:", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),),
                          ),
                          SizedBox(width: 4,),
                          Container(
                            child: Text("${_dataModelResponse!.records![index].variety}", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: Text("Grade:", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),),
                          ),
                          SizedBox(width: 4,),
                          Container(
                            child: Text("${_dataModelResponse!.records![index].grade}", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: Text("Arrival Date:", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),),
                          ),
                          SizedBox(width: 4,),
                          Container(
                            child: Text("${_dataModelResponse!.records![index].arrivalDate}", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: Text("Min Price:", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),),
                          ),
                          SizedBox(width: 4,),
                          Container(
                            child: Text("${_dataModelResponse!.records![index].minPrice}", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: Text("Max Price:", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),),
                          ),
                          SizedBox(width: 4,),
                          Container(
                            child: Text("${_dataModelResponse!.records![index].maxPrice}", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: Text("Modal Price:", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),),
                          ),
                          SizedBox(width: 4,),
                          Container(
                            child: Text("${_dataModelResponse!.records![index].modalPrice}", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),),
                          )
                        ],
                      ),
                    ],
                  )
                  )
              );
            },
          ),
        ),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}