import 'package:flutter/material.dart';
import 'package:flutter_application_2/Models/LoginRequest.dart';
import 'package:flutter_application_2/Models/LoginResponse.dart';
import 'package:flutter_application_2/Networks/ApiService.dart';
import 'package:flutter_application_2/Screens/Register.dart';

import 'package:flutter_application_2/Screens/homepage.dart';
import 'package:provider/provider.dart';

class Loginscreen extends StatefulWidget {
  Loginscreen({Key? key}) : super(key: key);

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  BuildContext? ctx;

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Provider<ApiService>(
        create: (context) => ApiService.create(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Builder(
            builder: (BuildContext newContext) {
              return login(newContext);
            },
          ),
        ));
  }

  login(BuildContext context) {
    ctx = context;
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/img9.jpeg'), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Center(
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage(
                                'images/img8.jpeg',
                              ),
                            ),
                            Text(
                              'Play Group',
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 28,
                      ),
                      SizedBox(
                        // height: 50,
                        child: TextFormField(
                          maxLines: 1,
                          maxLength: 35,
                          controller: usernameController,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return 'enter the email id';
                            }
                            else if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value.trim())) {
                              return 'Invalid email';
                            }
                          },
                          decoration: InputDecoration(
                            
                              contentPadding: EdgeInsets.only(
                                  top: 10, bottom: 10, left: 15),
                              isDense: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 1.0)),
                              labelText: 'Email Id',
                              labelStyle: TextStyle(color: Colors.white),
                              suffixIcon: Icon(
                                Icons.mail_outline,
                                color: Colors.white,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 28,
                      ),
                      SizedBox(
                        // height: 50,
                        child: TextFormField(
                          maxLines: 1,
                          maxLength: 15,
                          controller: passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'enter the password';
                            }
                            else if (value.trim().length<6) {
                              return 'atleast 6 character';
                            }
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  top: 10, bottom: 10, left: 15),
                              isDense: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              labelText: 'Password',
                              labelStyle: TextStyle(color: Colors.white),
                              suffixIcon: Icon(
                                Icons.key_sharp,
                                color: Colors.white,
                              )),
                        ),
                      ),
                      SizedBox(height: 5),
                      Align(
                        alignment: Alignment.topRight,
                        child: SizedBox(
                            height: 30,
                            child: FlatButton(
                                onPressed: () {},
                                child: Text('  forgot password?'))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 400,
                        child: RaisedButton(
                          onPressed: () async {
                            if (formkey.currentState!.validate()) {
                              _Login();
                              // getuserdat/a();
                              // var response = await LoginRepository.Login(
                              //   usernameController.text,
                              //   passwordController.text,
                              // );

                              // if (response!.token != null) {
                              //   return print('unsucess');
                              // }
                              // else {

                              // }
                            }
                            //                        if (message == true) {
                            //    Navigator.of(context).push(MaterialPageRoute(
                            //                           builder: (context) => Welcome()));
                            // }
                          },
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 15),
                          ),
                          color: Color.fromARGB(255, 87, 13, 136),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Center(
                          child: Text('or login using'),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                width: 110,
                                child: RaisedButton(
                                  onPressed: () {},
                                  child: Icon(
                                    Icons.facebook_outlined,
                                    color: Colors.white,
                                  ),
                                  color: Colors.transparent,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: 110,
                                child: RaisedButton(
                                  onPressed: () {},
                                  child: Icon(
                                    Icons.g_mobiledata_rounded,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  color: Colors.transparent,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Center(
                            child: FlatButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Register()));
                          },
                          child: RichText(
                              text: TextSpan(
                                  text: 'do not have an account?',
                                  style: TextStyle(color: Colors.white),
                                  children: [
                                TextSpan(
                                    text: 'Register',
                                    style: TextStyle(color: Colors.red))
                              ])),
                        )),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _Login() {
    LoginReq UserData = LoginReq();
    UserData.email = usernameController.text;
    UserData.password = passwordController.text;
    var api = Provider.of<ApiService>(ctx!, listen: false);
    api.login(UserData).then((response) {
     // print("status1 ${response.token!}");
     // String stats =response.status!.toString();


      // print('statuscode${response.token!.length}');
      // var res = response.;

      if (response.status!) {
        
        String stats =response.status.toString();
        print('if$stats');

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Padding(
            padding: const EdgeInsets.only(left:105.0),
            child: Text("Login Sucessfully"),
          ),
        ));


        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => Homepage(usernameController: usernameController.text)));
            
      } else
      {
        print('else');
        //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   content: Text("username/password incorrect"),
        // ));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("username/password Incorrect"),
        ));
        
      }
    });
  }
}
