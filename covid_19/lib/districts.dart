import 'package:covid_19/model/district.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import './model/statewise.dart';
import 'package:dio/dio.dart';
import './services/api_client.dart';

class Districts extends StatefulWidget{
  final String stateCode;
  final String stateName;
  Districts({this.stateCode,this.stateName});

  @override
  _DistrictState createState() => _DistrictState();
}

class _DistrictState extends State<Districts>{

  final client = ApiClient(Dio());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Hexcolor("#999999"),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          widget.stateName, style: TextStyle(color: Hexcolor("#FFFFFF")),
        ),
      ),
      body: getDistrictListByStateCode(),
    );
  }

  Widget getDistrictListByStateCode(){
      return FutureBuilder(
        builder: (context,projectSnap){
          if (projectSnap.connectionState == ConnectionState.waiting  && projectSnap.data == null) {
            return Center(
                child: CircularProgressIndicator()
            );
          }
          List<District> dataArr = [];
          if(projectSnap.data != null && projectSnap.data.length > 0){

            for(var i = 0 ; i < projectSnap.data.length ; i++ ){
              var d = projectSnap.data[i];
              if(d.statecode == widget.stateCode){
                dataArr = d.districtData;
                break;
              }
            }
          }

          return Container(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      color:  Hexcolor("#999999"),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    itemCount:  dataArr.length,
                    itemBuilder: (context, index) {
                      District districtData =  dataArr[index];

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          // Widget to display the list of project
                          Row(
                                children: [
                                  Expanded(
                                    child: Text(districtData.district,style : TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    )),
                                  ),
                                  SizedBox(width: 40,),
                                  Expanded(
                                    child:Text(districtData.confirmed.toString() , style: TextStyle(
                                      color: Hexcolor("#30AEF9"),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    )) ,
                                  ),

                                  Expanded(child: Text(districtData.recovered.toString() , style: TextStyle(
                                    color: Hexcolor("#4BAE2F"),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),)),
                                  Expanded(
                                    child: Text(districtData.deceased.toString() , style: TextStyle(
                                      color: Hexcolor("#D63822"),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  )
                                ],
                              ),

                        ],
                      );

                    },
                  ),


          );
        },
        future: client.getDistrictwiseData(),
      );
  }
}

