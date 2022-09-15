import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screens/Allusers.dart';
import 'package:flutter_application_2/Screens/aboutme.dart';
import 'package:flutter_application_2/Screens/logininPage.dart';

class Homepage extends StatelessWidget {

  String? usernameController;
  Homepage({this.usernameController});

  @override
  Widget build(BuildContext context) {
    
  

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("welcome"),),
        
        body: Center(
          child:Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("welcome:"),
              Text(usernameController!.toString(),style: const TextStyle(color: Colors.red,fontSize: 20),),
              
            ],
          ),
          ),
          drawer: Drawer(
            child: ListView(
              children: [
                UserAccountsDrawerHeader(accountName: const Text("antony"), accountEmail: Text("$usernameController"),currentAccountPicture: const CircleAvatar(backgroundColor: Color.fromARGB(255, 2, 43, 77),child: Text("A"),)
                ),

               
                
                   
                    
                    ListTile(
                      title: ElevatedButton(
                                      child: const Text('logout',style: TextStyle(color: Color(0xFF141515),),),
                                      onPressed: (){
                                     Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Loginscreen()));
                                       }),
                    ),
                    ListTile(
                      title: ElevatedButton(
                                      child: const Text('All users',style: TextStyle(color: Color(0xFF0B0B0B),),),
                                      onPressed: (){
                                     Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Alluser()));
                                       }),
                    ),
                    ListTile(
                      title: ElevatedButton(
                                      child: const Text('TASKs',style: TextStyle(color: Color(0xFF0C0C0C),),),
                                      onPressed: (){
                                     Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Aboutme()));
                                       }),
                      

                    ),                
              ],
            ),
          )
          // Padding(
          //       padding: const EdgeInsets.all(15.0),
          //       child: RaisedButton(color: Colors.red,
          //         child: Text('logout',style: TextStyle(color: Colors.blue,),),
          //         onPressed: (){
          //           Navigator.of(context).pop(MaterialPageRoute(builder: (context) => Loginscreen()));
          //         }),
          //     ),
          //     RaisedButton( 
          //     child: Text("All users"),
          //     onPressed: (){
                
          //       Navigator.of(context).push(MaterialPageRoute(builder: (context) => Alluser()));
                
          //     },)
          //     ,
           
      ),);
  }
  }
