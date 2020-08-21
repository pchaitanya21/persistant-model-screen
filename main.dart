import'package:flutter/material.dart';


void main()=>runApp(new MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title:"This is us",
       theme: new ThemeData(
         
         primarySwatch: Colors.red
      ),
      home: new MyHomePage(),
    
      
    );
  }
}



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _scaffoldKey=new GlobalKey<ScaffoldState>();//what the fuck happened here
  VoidCallback _showPersBottomSheetCallBack;
  @override
  void initState(){//this is for animations
    super.initState();
    _showPersBottomSheetCallBack= _showBottomSheet;
  }



  void _showBottomSheet() {
    setState(() {
      _showPersBottomSheetCallBack=null;
    
    }
    );

    _scaffoldKey.currentState
    .showBottomSheet((context) {
      return new Container(
        height: 300.0,
        color: Colors.orange,
        child: new Center( 
          
          child: new Text("[SAMPLE TEXT]",
          style: new TextStyle( 
          color: Colors.teal,
          fontSize:30.0,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold),
        ),
        ),
      );
    })
    .closed
    .whenComplete((){
      if(mounted) {
        setState((){
          _showPersBottomSheetCallBack=_showBottomSheet;
        });
      }
    });
  }

  void _showModalSheet() {
    showModalBottomSheet(
      context: context,
      builder: (builder){
        return new Container(
          color:Colors.orange,
          child: new Center(child: new Text("[SAMPLE TEXT]",
          style: new TextStyle( 
          color: Colors.teal,
          fontSize:30.0,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold),
        ),
          ),
          );
      }
    );
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key:_scaffoldKey,
      appBar: new AppBar(
        title:new Text("Flutter BottomSheet"),
      ),
      backgroundColor: Colors.amber,
      body: new Padding(padding: const EdgeInsets.all(20.0),
      child: new Center(child: new Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: <Widget>[
          new RaisedButton(
            textColor: Colors.white,
            color: Colors.red,
            onPressed: _showPersBottomSheetCallBack,
            child: new Text("Persistent"),
            ),

          new RaisedButton(
            textColor: Colors.white,
            color:Colors.red,
            onPressed: _showModalSheet,
            child: new Text("Modal"),
          ),
        ],)),),
    );
  }
}