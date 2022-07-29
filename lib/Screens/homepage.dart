import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Models/LoginResponse.dart';
import 'package:flutter_application_2/Screens/Allusers.dart';
import 'package:flutter_application_2/Screens/logininPage.dart';

class Homepage extends StatelessWidget {

  String? usernameController;
  Homepage({this.usernameController});

  @override
  Widget build(BuildContext context) {
    
  

    return Scaffold(
      body: Center(
        child:Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("welcome:"),
            Text(usernameController!.toString(),style: TextStyle(color: Colors.red,fontSize: 20),),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: RaisedButton(color: Colors.red,
                child: Text('logout',style: TextStyle(color: Colors.blue,),),
                onPressed: (){
                  Navigator.of(context).pop(MaterialPageRoute(builder: (context) => Loginscreen()));
                }),
            ),
            RaisedButton( 
            child: Text("All users"),
            onPressed: (){
              
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Alluser()));
              
            },)
            
          ],
        ),
        
      ),
         
    );
  }



  }
