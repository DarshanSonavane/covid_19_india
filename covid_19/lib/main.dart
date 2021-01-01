import 'package:covid_19/districts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import './model/statewise.dart';
import 'package:dio/dio.dart';
import './services/api_client.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COVID-19',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(),
      routes: {
        '/district':(context) => Districts(stateCode : "",stateName : ""),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final client = ApiClient(Dio());
  String confirmedCount,recoveredCount,deathCount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Hexcolor("#F2F2F2"),
      appBar: AppBar(
        backgroundColor: Hexcolor("#999999"),
        title: Center(child: Text("Dashboard" , style: TextStyle(color: Hexcolor("#FFFFFF")),)),
      ),
      body: getStateListWithData()

    );
  }

  Widget getStateListWithData() {
    return FutureBuilder(
      builder: (context, projectSnap) {
        if (projectSnap.connectionState == ConnectionState.waiting  && projectSnap.data == null) {
          return Center(
              child: CircularProgressIndicator()
          );
        }
        return Container(
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Card(
                        color: Hexcolor("#999999"),
                        child: Column(
                          crossAxisAlignment:CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text("COVID-19 Cases Overview",style: TextStyle(color: Colors.white,)
                                  ,
                                )
                            ),
                            Padding(
                                padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 50.0),
                                child: Text(projectSnap.data.statewise[0].lastupdatedtime,style: TextStyle(color: Colors.white,)
                                  ,
                                )
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(8.0, 70.0, 8.0, 10.0),
                        child: Card(
                          child: Column(
                            crossAxisAlignment:CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text("Accross India CORONA Cases",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            backgroundColor: Hexcolor("#F2F2F2")

                                        ),
                                      )
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Text(projectSnap.data.statewise[0].confirmed,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text("Confirmed",
                                          style: TextStyle(
                                            color: Hexcolor("#30AEF9"),
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(projectSnap.data.statewise[0].recovered,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text("Recovered",
                                            style: TextStyle(
                                              color: Hexcolor("#4BAE2F"),
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),

                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(projectSnap.data.statewise[0].deaths,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text("Deaths",
                                            style: TextStyle(
                                              color: Hexcolor("#D63822"),
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 0.0),
                child: Row(
                  children: [
                    Text("All States",style: TextStyle(
                      color: Hexcolor("#000000"),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),textAlign: TextAlign.start,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Card(
                    color: Hexcolor("#FFFFFF"),
                    child: ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                        color: index == 0 ? Colors.white : Hexcolor("#999999"),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      itemCount:  projectSnap.data.statewise.length,
                      itemBuilder: (context, index) {
                        Statewise stateData =  projectSnap.data.statewise[index];

                          if(index != 0){
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                // Widget to display the list of project
                                GestureDetector(
                                  onTap : (){
                                    //Navigator.pushNamed(context, '/district',arguments: Districts(stateCode : stateData.statecode,stateName : stateData.state));
                                    Navigator.push(context, MaterialPageRoute(builder: (context){
                                      return Districts(stateCode : stateData.statecode,stateName : stateData.state);
                                    }));
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(0.0, 10, 0.0, 10.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(stateData.state,style : TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                          )),
                                        ),
                                        SizedBox(width: 50,),
                                        Expanded(
                                          child:Text(stateData.confirmed , style: TextStyle(
                                            color: Hexcolor("#30AEF9"),
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          )) ,
                                        ),

                                        Expanded(child: Text(stateData.recovered , style: TextStyle(
                                          color: Hexcolor("#4BAE2F"),
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),)),
                                        Expanded(
                                          child: Text(stateData.deaths , style: TextStyle(
                                            color: Hexcolor("#D63822"),
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            );
                          }
                          else{
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                // Widget to display the list of project
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text("States",style : TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                      )),
                                    ),
                                    SizedBox(width: 50,),
                                    Expanded(
                                      child:Text("Confirmed" , style: TextStyle(
                                        color: Hexcolor("#30AEF9"),
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      )) ,
                                    ),

                                    Expanded(child: Text("Recovered" , style: TextStyle(
                                      color: Hexcolor("#4BAE2F"),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),)),
                                    Expanded(
                                      child: Text("Deaths" , style: TextStyle(
                                        color: Hexcolor("#D63822"),
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),),
                                    )
                                  ],
                                )
                              ],
                            );
                          }
                      },
                    ),
                  ),
                ),
              )
            ],
          ),

        );
      },
      future: client.getStatewiseData(),
    );
  }
}
