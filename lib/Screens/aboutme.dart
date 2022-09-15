
// ignore_for_file: non_constant_identifier_names, avoid_print, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_application_2/Network/ApiService.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Aboutme extends StatefulWidget {
  const Aboutme({Key? key}) : super(key: key);

  @override
  State<Aboutme> createState() => _AboutmeState();
}

class _AboutmeState extends State<Aboutme> {

  var ctx;
  String task="";
  String description ="";
  String Project="";
  String startTime="";
  String endTime="";
  String  dateInput="";

  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController ProjectController = TextEditingController();
  TextEditingController TaskController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateInputController = TextEditingController();
  


  var maskFormatter = MaskTextInputFormatter(
  mask: '##:##', 
  filter: { "#": RegExp(r'[0-9]') },
  type: MaskAutoCompletionType.lazy
);

static GlobalKey<FormFieldState> form_key= GlobalKey<FormFieldState>();
@override
void initState() {
    // ignore: todo
    // TODO: implement initState
    //  dateInputController.text = ""; 
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_)=> aboutme());
  }



  @override
  Widget build(BuildContext context) {
    return Provider(create: (context) => ApiService.create(),
    child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Builder(builder: (BuildContext newContext){
        return aboutme(newContext);
      }),
    ),);
  }
   aboutme(BuildContext newContext){
    return SafeArea(child: Scaffold(
      appBar: AppBar( title: const Text("Today Task")),


      body: Container(
        key: form_key,
        width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child:SingleChildScrollView (
            child: Column(
              
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(width: MediaQuery.of(context).size.width*0.4,
                      child: TextFormField(
                        controller: startTimeController,
                        autovalidateMode: AutovalidateMode.always,
                       validator: (value) {
                        startTime = value!;
                         if(startTime.isEmpty){
                          return "enter time";
                         }
                         else if(startTime.length<5){
                          return "Invalid time";
                        }
                       },
                        
                        
                        maxLength: 5,
                        maxLines: 1,
                        inputFormatters: [
                          maskFormatter,
                        ],
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                          
                          hintText: "10:00",
                          label: Text("start time")
                          
                        ),
                      ),
                    ),
                     Container(width: MediaQuery.of(context).size.width*0.4,
                      child: TextFormField(
                        controller: endTimeController,
                        autovalidateMode: AutovalidateMode.always,
                       validator: (value) {
                        endTime = value!;
                         if(endTime.isEmpty){
                          return "enter time";
                         }
                         else if(endTime.length<5){
                          return "Invalid time";
                        }
                       },
                        maxLength: 5,
                        maxLines: 1,
                        inputFormatters: [
                          maskFormatter,
                        ],
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
          
          
                          hintText: "18:00",
                          labelText: "End time",
                          
                          
                        ),
                      ),
                    ),
                    
                    
                    
                  ],
                ),
                const SizedBox(height: 10,),
          
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                   children: [
                    TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      validator: (dateInput) {
                        if(dateInput!.isEmpty){
                          return "select date";
                        }
                        
                      },
              controller: dateInputController,
              //editing controller of this TextField
              decoration: const InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  icon: Icon(Icons.calendar_today), //icon of text field
                  labelText: "Enter Date" //label text of field
                  ),
                  readOnly: true,
              //set it true, so that user will not able to edit text
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2100));
 
                if (pickedDate != null) {
                  print(
                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  // ignore: avoid_print
                  print(
                      formattedDate); //formatted date output using intl package =>  2021-03-16
                  setState(() {
                    dateInputController.text =
                        formattedDate; //set output date to TextField value.
                  });
                } else {}
              },
                    ),
                    const SizedBox(height: 18,),
                    
                    TextFormField(
                      controller: ProjectController,
                      autovalidateMode: AutovalidateMode.always,
                      validator: (value){
                        Project =value!;
                        if(Project.isEmpty){
                          return "please enter field";
                        }
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                        hintText: "Add Project",
                        labelText: "Projects"
          
                      ),
                    ),
                    const SizedBox(height: 18,),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.always,
                    validator:(value) {
                      task = value!;
                          if(task.isEmpty){
                            return "please enter field";
                          }
          
                          
                        },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                      hintText: "Task",
                      labelText: "Your Task"
          
                    ),
                  ),
          
                          const SizedBox(height: 18,),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.always,
                    validator:(value) {
                      description =value!;
                          if(description.isEmpty){
                            return "please enter feild";
                          }
          
                          
                        },
                    decoration: const InputDecoration(
                      
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                      hintText: "Task description",
                      labelText: "Dfescription"
          
                    ),
                  ),
          
                   ]
                  ),
                ),
                          
                  ElevatedButton(onPressed: (){
                    print("start--$startTime");
                    print("end--$endTime");
                    print("project--$Project");
                    print("stack$task");
                    print("des$description");
                    print("date${dateInputController.text}");
                    
                    
// &&(endTimeController ==null)&&(ProjectController==null)&&(descriptionController==null)&&(TaskController==null))

                    
                       if((startTime!="")&& (endTime!="")&&(startTime.length>4)&&(endTime.length>4) &&(Project!="")&&(task!="")&&(description!="")&&(dateInput.isNotEmpty)) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("valid form")));
                      print("$startTime");
                      print("$endTime");
                      print("valid form");
          
                       }else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("invalid form")));

                       }; 
                  },
                  child: const Text("Add"),)
                 ], 
                ),
          )
            ,
          
          
        ),
        
        
        
        
      ),
      
    )
    );





  }
}