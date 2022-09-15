import 'package:flutter/material.dart';
import 'package:flutter_application_2/Models/LoginRequest.dart';
import 'package:flutter_application_2/Screens/Register.dart';

import 'package:flutter_application_2/Screens/homepage.dart';
import 'package:provider/provider.dart';

import '../Network/ApiService.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);

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
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/img9.jpeg'), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Center(
                        child: Column(
                          children: const [
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
                      const SizedBox(
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
                          decoration: const InputDecoration(
                            
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
                      const SizedBox(
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
                          decoration: const InputDecoration(
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
                      const SizedBox(height: 5),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: SizedBox(
                            height: 31,
                            child: TextButton(
                                onPressed: () {},
                                child: const Text('  forgot password?',style: TextStyle(color: Colors.black),))),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 400,
                        child: ElevatedButton(
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
                          style:ElevatedButton.styleFrom(
                                    backgroundColor:  const Color.fromARGB(255, 87, 13, 136),
                                  ),
                          child: const Text(
                            'LOGIN',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 15),
                          ) 
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: Center(
                          child: Text('or login using',style: TextStyle(color: Colors.white),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  width: 110,
                                  child: TextButton(
                                    onPressed: () {},
                                    style:ElevatedButton.styleFrom(
                                      backgroundColor:  Colors.transparent,
                                    ),
                                    child: const Icon(
                                      Icons.facebook_sharp,
                                      size: 30,
                                      color: Colors.white,
                                    )
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  width: 110,
                                  child: TextButton(
                                    onPressed: () {},
                                    style:ElevatedButton.styleFrom(
                                      backgroundColor:  Colors.transparent,
                                    ),
                                    child: const Icon(
                                      Icons.email_outlined,
                                      size: 30,
                                      color: Colors.white,
                                    )
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 90),
                        child: Center(
                            child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Register()));
                          },
                          child: RichText(
                              text: const TextSpan(
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
   

      if (response.status!) {
        
        String stats =response.status.toString();
        print('if$stats');

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Padding(
            padding: EdgeInsets.only(left:105.0),
            child: Text("Login Sucessfully"),
          ),
        ));


        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => Homepage(usernameController: usernameController.text)));
            
      } else
      {
        print('else');
       
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("username/password Incorrect"),
        ));
        
      }
    });
  }
}
