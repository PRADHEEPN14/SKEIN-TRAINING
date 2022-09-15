
// // import
//
// 'dart:ffi';
// // import 'dart:ffi';

// ignore_for_file: avoid_print, sort_child_properties_last, unused_import

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/Models/RegisterRequest.dart';

import 'package:flutter_application_2/Screens/logininPage.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';


import 'package:intl/intl.dart';
import 'package:pattern_formatter/pattern_formatter.dart';
import 'package:provider/provider.dart';

import '../Network/ApiService.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  BuildContext? ctx;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController username1Controller = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController phonenumController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController dobController = new TextEditingController();
  TextEditingController altphnController = new TextEditingController();
  TextEditingController bloodController = new TextEditingController();
  TextEditingController confirmpassController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController qualifyController = new TextEditingController();
  TextEditingController genderController = new TextEditingController();
  String Format =('0000-00-00');
   final format = DateFormat('yyyy-MM-dd');

  String? gender,
      phone,
      address,
      email,
      DOB,
      password,
      confirmpass,
      user,
      altphone,
      quality;
  // String? phone;
  // String? address;
  // String? email;
  // String? DOB;
  // String? password;
  // String? confirmpass;
  // String? user;
  // String? altphone;
  // String? qualify;
  int radioValue = -1;
  

  @override
  Widget build(BuildContext context) {
    return Provider<ApiService>(create: (context)=> ApiService.create(),
    child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Builder(builder: (BuildContext newContext){
      return register(newContext);
      }
      )
    )
    );
  }

  register (BuildContext context){
    ctx = context;
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: const Color.fromARGB(255, 235, 231, 231),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(
                      'images/img8.jpeg',
                    ),
                  ),
                  const Text(
                    'User Details',
                    style: TextStyle(fontSize: 25, color: Color(0xFF0F0E0E)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: Form(
                      key: _formkey,
                      child: Column(children: [
                        SizedBox(
                          // height: 50,
                          child: TextFormField(
                            autovalidateMode: AutovalidateMode.always,
                            keyboardType: TextInputType.text,
                            inputFormatters: [
                              MaskTextInputFormatter(mask: "#################",
                              filter: {"#": RegExp(r"[a-zA-Z]"),
                              } ,
                              )
                            
                            ],
                            controller: username1Controller,
                            validator: ((user) {
                              if (user!.isEmpty) {
                                return 'enter the user';
                              }
                            }),
                            decoration: const InputDecoration(
                              isDense: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.0)),
                                labelText: 'username',
                                labelStyle: TextStyle(color: Color(0xFF0C0C0C)),
                                fillColor: Color(0xFFE3DDDD),
                                filled: true,
                                suffixIcon: Icon(
                                  Icons.people,
                                  color: Color(0xFF161515),
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          // height: 50,
                          child: TextFormField(
                            autovalidateMode: AutovalidateMode.always,
                           keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly
            ],                      
                            controller: phonenumController,
                            validator: ((phone) {
                              if (phone!.isEmpty) {
                                return 'enter phone num';
                              } else if (phone.length < 10
                                  // !RegExp('("(0|91)?[7-9][0-9]{9}")')
                                  //   .hasMatch(phone)
                                  ) {
                                return 'invalid phone num';
                              } else if (phone.length > 10) {
                                return 'enter valid number';
                              }
                            }),
                            decoration: const InputDecoration(
                              isDense: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.0)),
                                labelText: 'phonenumber',
                                fillColor: Color(0xFFE3DDDD),
                                filled: true,
                                labelStyle: TextStyle(color: Color(0xFF0E0E0E)),
                                suffixIcon: Icon(
                                  Icons.settings_phone_outlined,
                                  color: Color(0xFF0B0A0A),
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          // height: 50,
                          child: TextFormField(
                            autovalidateMode: AutovalidateMode.always,
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            validator: ((email) {
                              if (email!.isEmpty) {
                                return 'enter email';
                              } else if (!RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@gmail.com|@email.com|@yahoo.com" 
                                      // '[a-z0-9]+@gmail.com|@email.com|@yahoo.com'  [a-zA-Z0-9]+\.[a-zA-Z]
                                      )
                                  .hasMatch(email)) {
                                return 'invalid email';
                              }
                            }),
                            decoration: const InputDecoration(
                              isDense: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.0)),
                                labelText: 'Email Id',
                                fillColor: Color(0xFFE3DDDD),
                                filled: true,
                                labelStyle: TextStyle(color: Color(0xFF0E0E0E)),
                                suffixIcon: Icon(
                                  Icons.mail_outline,
                                  color: Color(0xFF0B0A0A),
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          // height: 50,
                          child: TextFormField(

                            autovalidateMode: AutovalidateMode.always,
                            keyboardType: TextInputType.streetAddress,
                            inputFormatters: [],
                            controller: addressController,
                            validator: ((address) {
                              if (address!.isEmpty) {
                                return 'enter the address';
                              }
                            }),
                            decoration: const InputDecoration(
                              isDense: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.0)),
                                labelText: 'address',
                                fillColor: Color(0xFFE3DDDD),
                                filled: true,
                                labelStyle: TextStyle(color: Color(0xFF0E0E0E)),
                                suffixIcon: Icon(
                                  Icons.location_on,
                                  color: Color(0xFF0B0A0A),
                                )),
                          ),
                        ),

                       
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          // height: 50,
                          child: TextFormField(
                            autovalidateMode: AutovalidateMode.always,
                            keyboardType: TextInputType.number,
                            inputFormatters:[ ],
                            controller: altphnController,
                            validator: (altphone) {
                              if (altphone!.isEmpty) {
                                return 'enter phone num';
                              } else if (altphone.length < 10
                                  // !RegExp('("(0|91)?[7-9][0-9]{9}")')
                                  //   .hasMatch(altphone)
                                  ) {
                                return 'invalid phone num';
                              } else if (altphone.length > 10) {
                                return 'enter valid number';
                              }
                            },
                            decoration: const InputDecoration(
                              isDense: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.0)),
                                labelText: 'altenative_phone',
                                fillColor: Color(0xFFE3DDDD),
                                filled: true,
                                labelStyle: TextStyle(color: Color(0xFF0E0E0E)),
                                suffixIcon: Icon(
                                  Icons.phone,
                                  color: Color(0xFF0B0A0A),
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          // height: 50,
                          child: TextFormField(
                            autovalidateMode: AutovalidateMode.always,
                            keyboardType: TextInputType.datetime,
                            inputFormatters: [
                                MaskTextInputFormatter(mask: '####-##-##',)
                              
                          //     // anyCharMatcher: RegExp(
                          //     //     r'^(0[1-9]|1[012])[-/.](0[1-9]|[12][0-9]|3[01])[-/.](19|20)\\d\\d$'))
                            ],
                            
                            controller: dobController,
                            validator: (DOB) {
                              if (DOB!.isEmpty) {
                                return 'enter DOB';
                              }
                              //  else if (DOB.length != 10) {
                              //   return 'enter valid date';
                              // } 
                              else if (!RegExp(
                                      '((?:19|20)\\d\\d)-(0?[1-9]|1[012])-([12][0-9]|3[01]|0?[1-9])')
                                  .hasMatch(DOB)) {
                                return 'enter valid dates';
                              }
                            },

                          
                            decoration: const InputDecoration(
                              isDense: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.0)),
                                labelText: 'DOB',
                                fillColor: Color(0xFFE3DDDD),
                                hintText: 'YYYY-MM-DD',
                                filled: true,
                                labelStyle: TextStyle(color: Color(0xFF0E0E0E)),
                                suffixIcon: Icon(
                                  Icons.calendar_month_outlined,
                                  color: Color(0xFF0B0A0A),
                                )),
                          ),

                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          // height: 50,
                          child: TextFormField(
                            autovalidateMode: AutovalidateMode.always,
                            keyboardType: TextInputType.text,
                            inputFormatters: [
                              MaskTextInputFormatter(mask: "#################",
                              filter: {"#": RegExp(r"[a-zA-Z]"),
                              } ,
                              )
                            
                            ],
                            
                            controller: qualifyController,
                            validator: (qualify) {
                              if (qualify!.isEmpty) {
                                return 'enter your qualification';
                              }
                            },
                            decoration: const InputDecoration(
                              isDense: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.0)),
                                labelText: 'qualification',
                                fillColor: Color(0xFFE3DDDD),
                                filled: true,
                                labelStyle: TextStyle(color: Color(0xFF0E0E0E)),
                                suffixIcon: Icon(
                                  Icons.cast_for_education_outlined,
                                  color: Color(0xFF0B0A0A),
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          // height: 50,
                          child: TextFormField(
                            maxLength: 3,
                            autovalidateMode: AutovalidateMode.always,
                            controller: bloodController,
                            validator: (blood) {
                              if (blood!.isEmpty) {
                                return 'please enter your blood group';
                              }
                            },
                            decoration: const InputDecoration(
                              isDense: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.0)),
                                labelText: 'Blood group',
                                fillColor: Color(0xFFE3DDDD),
                                filled: true,
                                labelStyle: TextStyle(color: Color(0xFF0E0E0E)),
                                suffixIcon: Icon(
                                  Icons.bloodtype_rounded,
                                  color: Color(0xFF0B0A0A),
                                )),
                          ),
             
           


                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          // height: 50,
                          child: TextFormField(
                            autovalidateMode: AutovalidateMode.always,
                            keyboardType: TextInputType.visiblePassword,
                            inputFormatters: const [
                            ],
                            controller: passwordController,
                            onChanged: (value) => password = value,
                            validator: (password) {
                              if (password!.isEmpty) {
                                return 'enter password';
                              } else if (password.length < 8) {
                                return 'Atleast have 8 character';
                              }
                            },
                            obscureText: true,
                            decoration: const InputDecoration(
                              isDense: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.0)),
                                labelText: 'password',
                                fillColor: Color(0xFFE3DDDD),
                                filled: true,
                                labelStyle: TextStyle(color: Color(0xFF0E0E0E)),
                                suffixIcon: Icon(
                                  Icons.password_outlined,
                                  color: Color(0xFF0B0A0A),
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          // height: 50,
                          child: TextFormField(
                            autovalidateMode: AutovalidateMode.disabled,
                            controller: confirmpassController,
                            onChanged: (value) {
                              confirmpass = value;
                            },
                            validator: (confirmpass) {
                              if (confirmpass!.isEmpty) {
                                return 'RE-enter password';
                              } else if (confirmpass != password) {
                                return 'password does not match';
                              }
                            },
                            obscureText: true,
                            decoration: const InputDecoration(
                              isDense: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.0)),
                                labelText: 'Confirm password',
                                fillColor: Color(0xFFE3DDDD),
                                filled: true,
                                labelStyle: TextStyle(color: Color(0xFF0E0E0E)),
                                suffixIcon: Icon(
                                  Icons.key_off_outlined,
                                  color: Color(0xFF0B0A0A),
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Gender:",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          // height: 50,
                          child: TextFormField(
                            autovalidateMode: AutovalidateMode.always,
                            maxLength: 6,
                            controller: genderController,
                            validator: (gender) {
                              if (gender!.isEmpty) {
                                return 'please enter your gender';
                              }else if((gender=="male"|| gender=="Male")){
                                return null;
                              } else if((gender=="female"|| gender=="Female")){
                                return null;
                              }
                              else{
                                return "invalid gender";
                              }
                            },
                            decoration: const InputDecoration(
                              isDense: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.0)),
                                labelText: 'M/F',
                                fillColor: Color(0xFFE3DDDD),
                                filled: true,
                                labelStyle: TextStyle(color: Color(0xFF0E0E0E)),
                                suffixIcon: Icon(
                                  Icons.bloodtype_rounded,
                                  color: Color(0xFF0B0A0A),
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        // RadioListTile<int>(
                        //     title: Text("Male"),
                        //     value: 0,
                        //     groupValue: radioValue,
                        //     onChanged: (value) {
                        //       setState(() {
                        //         gender = value.toString();
                        //       });
                        //     }),

                        // RadioListTile<int>(
                        //   title: Text("Female"),
                        //   value: 1,
                        //   groupValue: radioValue,
                        //   onChanged: (radioValue) {
                        //     radioValue;
                        //   },
                        // ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: 400,
                          child: ElevatedButton(
                            onPressed: () {
                              
                              if(_formkey.currentState!.validate()){

                                 _register();
                              
                              
                              // print("1:${emailController.text}");
                              // print("1:${username1Controller.text}");
                              // print("1:${phonenumController.text}");
                              // print("1:${genderController.text}");
                              // print("1:${addressController.text}");
                              // print("1:${bloodController.text}");
                              // print("1:${altphnController.text}");
                              // print("1:${qualifyController.text}");
                              // print("1:${dobController.text}");
                              // print("1:${passwordController.text}");
                              // print("1:${confirmpassController.text}");
                            //   if (_formkey.currentState!.validate()) {
                            //     var response = RegisterRespository.Register(
                            //       username1Controller.text,
                            //       phonenumController.text,
                            //       emailController.text,
                            //       addressController.text,
                            //       bloodController.text,
                            //       genderController.text,
                            //       altphnController.text,
                            //       dobController.text,
                            //       qualifyController.text,
                            //       passwordController.text,
                            //       confirmpassController.text,
                            //     );
                            //   }
                              }
                            print(emailController.text);
                            },
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15),
                            ),
                            style:ElevatedButton.styleFrom(
                                    backgroundColor:  const Color.fromARGB(255, 87, 13, 136),
                                  ) ,
                          ),
                        ),
                        const Divider(height: 50),
                        Center(
                            child: Padding(
                          padding: const EdgeInsets.only(top: 55),
                          child: TextButton(
                    
                            onPressed: () {
                              Navigator.of(context).pop(MaterialPageRoute(
                                  builder: (context) => const Loginscreen()));
                            },
                            child: RichText(
                                text: const TextSpan(
                                    text: 'Already have an account?',
                                    style: TextStyle(color: Colors.black),
                                    children: [
                                  TextSpan(
                                      text: 'lOGIN',
                                      style: TextStyle(color: Colors.red))
                                ])),
                          ),
                        )),
                      ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  _register(){
RegisterReq UserData = RegisterReq();
UserData.username= username1Controller.text;
UserData.phonenumber= phonenumController.text;
UserData.email= emailController.text;
UserData.address= addressController.text;
UserData.gender= genderController.text;
UserData.bloodgroup= bloodController.text;
UserData.alternativePhoneNo= altphnController.text;
UserData.dob= dobController.text;
UserData.qualification= qualifyController.text;
UserData.password= passwordController.text;
UserData.confirmPassword= confirmpassController.text;

var api= Provider.of<ApiService>(ctx!, listen:false);
api.register(UserData).then((response){

  if(response.message== "Your account has been created successfully."){
    print("worked");
     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Padding(
            padding: EdgeInsets.only(left:105.0),
            child: Text("Register Sucessfully"),
          ),
        ));

  print(username1Controller.text);
    print(phonenumController.text);
    print(emailController.text);
    print(addressController.text);
    print(altphnController.text);
    print(dobController.text);
    print(qualifyController.text);
    print(bloodController.text);
    print(passwordController.text);
    print(confirmpassController.text);
    print(genderController.text);
    print('$UserData');
  }
  else {
    
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Padding(
            padding: const EdgeInsets.only(left:65.0),
            child: Text(response.message!),
          ),
        ));
  }
});
}
}

