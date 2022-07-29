import 'dart:ui';

import 'package:flutter_application_2/Screens/Allusers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Models/GetAllUser.dart';
import 'package:flutter_application_2/Networks/ApiService.dart';
import 'package:flutter_application_2/Screens/Allusers.dart';
import 'package:provider/provider.dart';

import '../Models/GetAllUser.dart';
import 'Allusers.dart';


class Alluser extends StatefulWidget {
  const Alluser({Key? key}) : super(key: key);

  @override
  State<Alluser> createState() => _AlluserState();
}

class _AlluserState extends State<Alluser> {
  var ctx;
  bool? isloading = true;

  List<UserData> user = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_)=>_alluser());
  }
  @override
  Widget build(BuildContext context) {
    return Provider<ApiService>(create: (context) => ApiService.create(),
    child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Builder(builder: (BuildContext newContext){
        return alluser(newContext);
      })
    ),);
  }

   alluser(BuildContext newContext){
    ctx = newContext;
    return Scaffold(
      appBar: AppBar(
        title: Text('list of users'),
      ),
      body: ListView.builder(
        
        itemCount: user.length<25? user.length:10,
        itemBuilder: ((context, i) {

         
          // Using CARD design...
          return Card(elevation: 3,
            shadowColor: Color.fromARGB(255, 122, 168, 206),
            child: ListTile(
              trailing: PopupMenuButton(
                itemBuilder:(context) => [
                  PopupMenuItem(
                    child: Text("Edit"),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Text("Delete"),
                    value: 2,
                  ),
                  PopupMenuItem(
                    child: Text("more"),
                    value: 3,
                  )
                ]
            ),
            // trailing: IconButton(onPressed: (){},
            // icon: Icon(Icons.more_vert)),
            title: Text('${user[i].username}',style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text('${user[i].email}',style: TextStyle(color: Color.fromARGB(255, 139, 139, 138,),fontSize: 13)),
            leading: Text('${i}'),
            ),
            );
        }
        )
      )
    );
  }
  _alluser(){
    final api = Provider.of<ApiService>(ctx! , listen: false);
    api.alluser().then((response){
      print(response.message);
      if(response.status == true){
        setState(() {
          user = response.data!;
        print("data:$response");
        });
        



      }
    }).catchError((onError){
      print(onError.toString());
    });
  }
}







 // Using list style...

          // return ListTile(trailing: IconButton(onPressed: (){
            
          // }, icon: Icon(Icons.more_vert)),
            
          //   title: Text('${user[i].username}'),
          //   subtitle: Text('${user[i].email}'),
          //   leading: Text('${i}'),
            
            
          // );