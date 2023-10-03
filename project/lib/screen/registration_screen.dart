// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/screen/app_utils.dart';
import 'package:project/screen/login_screen.dart';

import '../widgets/input_field_widgets.dart';
import '../widgets/primary_button.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  TextEditingController emailController =TextEditingController();
  TextEditingController nameController =TextEditingController();
  TextEditingController passwordController =TextEditingController();
  TextEditingController birthdateController =TextEditingController();

  String genderSelected= "male";

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset:false,
      backgroundColor: colorPrimary,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          const Center(
              child: Text('Jack',
                style:TextStyle(
                  color: colorWhite,
                  fontSize: 28,
                  fontFamily: AutofillHints.countryCode,
                ) ,),
            ),
          const SizedBox(height: 8.0,),
          const Center(
              child: Text('of all trades',
                style:TextStyle(
                  color: colorWhite,
                  fontSize: 28,
                  fontFamily: AutofillHints.countryCode,
                ) ,),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),
          const Center(
              child: Text('Please enter your information',
                style:TextStyle(
                  color: colorWhite,
                  fontSize: 14.0,
                  fontFamily: AutofillHints.countryCode,
                ) ,),
            ),
            InputField(controller: nameController,
            icon: Icons.person,
            hintText: "Enter your name",), 
            const  SizedBox(height: 15,),
            InputField(controller: emailController,
            icon: Icons.email,
            hintText: "Enter your email",),
            const  SizedBox(height: 15,),
            InputField(controller: passwordController,
            icon: Icons.password,
            hintText: "Enter your password",
            obscureText: true,),
            const  SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 24),
              child: TextFormField(
                style:const TextStyle(
                  color: colorWhite, 
                ),
                textAlign: TextAlign.center,
                controller: birthdateController,
                decoration:const InputDecoration(
                  prefixIcon: Icon(
                    Icons.calendar_month,
                    color: colorWhite,
                  ),
                  hintText: "Enter your birthdate",
                  hintStyle: TextStyle(
                    color: colorGrey,
                    fontSize: 12,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: colorWhite),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: colorWhite)
                  ),
                ),
                onTap: () async {
                  DateTime date = DateTime(1900);
                  FocusScope.of(context).requestFocus(FocusNode());

                 date = (await showDatePicker(
                  context: context, 
                  initialDate: DateTime.now(), 
                  firstDate: DateTime(1900), 
                  lastDate: DateTime(2100)))!;

                String dateFormatter = date.toIso8601String();
                DateTime dt = DateTime.parse(dateFormatter);
                var formatter = DateFormat('dd-MMMM-yyyy');
                birthdateController.text = formatter.format(dt);
                },
              ),
            ),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 22.0),
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 const SizedBox(height: 10.0,),
                 const  Text('GENDER',
                    style: TextStyle(
                      color: colorWhite,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1, 
                    ),),
                 const   SizedBox(height: 10.0,),
                    Row(
                      children: [
                        Flexible(
                          fit: FlexFit.loose,
                          child: RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            groupValue: genderSelected,
                            activeColor: colorWhite,
                            title:const Text(
                              'MALE',style: TextStyle(
                                color: colorWhite,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            value: 'male',
                            onChanged: (val){
                              setState(() {
                                genderSelected = val.toString();
                              });
                            print(genderSelected);
                            },
                        ),
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          child: RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            groupValue: genderSelected,
                            activeColor: colorWhite,
                            title:const Text(
                              'FEMALE',style: TextStyle(
                                color: colorWhite,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            value: 'female',
                            onChanged: (val){
                              setState(() {
                                genderSelected = val.toString();
                              });
                            print(genderSelected);
                            },
                        ),
                        ),
                      ],
                    ),
                ],
              ),
             ),
           const  SizedBox(height: 22.0,),
             PrimaryButton(
            text: 'Sign Up',
            onPressed:(){
              if(isValidate()){
                print('Data is validated');
                //Navigate to landing screen after signup
              }
            } ,
           ),
           const  SizedBox(height: 22.0,),
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
             children: [
              const  Text('Already have an account!',
               style: TextStyle(
                color: colorWhite
               ),),
               
               GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen(),));
                },
                 child:const Text(' Sign In',
                 style: TextStyle(
                  color: colorWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                 ),),
               ),
             ],
           ), 
          ],
        ),
      ),
    );
  }

  bool isValidate(){
    if(nameController.text.isEmpty){
      showScaffold(context, 'Please enter your Name');
    return false;
    }
    if(emailController.text.isEmpty){
      showScaffold(context, 'Please enter your Email');
    return false;
    }
    if(passwordController.text.isEmpty){
      showScaffold(context, 'Please enter your Password');
    return false;
    }
    if(birthdateController.text.isEmpty){
      showScaffold(context, 'Please enter your Birthdate');
    return false;
    }
    return true;
  }
}


