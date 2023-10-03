import 'package:flutter/material.dart';
import 'package:project/screen/app_utils.dart';
import 'package:project/screen/registration_screen.dart';
import 'package:project/widgets/primary_button.dart';

import '../widgets/input_field_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      body:SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.06,
            ),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    height: 10,
                    width: 20,
                    decoration:const BoxDecoration(
                      color: colorWhite,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      )
                    ),
                  ),
                const  SizedBox(height: 1.5,),

                Container(
                  height: 2.0,
                  width: 20,
                  decoration: const BoxDecoration(
                    color: colorWhite,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    )
                  ),
                ),
                ],
              ),
              const SizedBox(width: 10.0,),
              const Text('JOT',
              style: TextStyle(
                color: colorWhite,
                fontSize: 25.0,
                fontWeight: FontWeight.bold
              ),)
            ],
          ),
          const SizedBox(height: 30.0,),

          const Text('Welcome back !',
          style: TextStyle(
            color: colorWhite,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),),
          const SizedBox(height: 15.0,),
          const Text("Please enter your details below:",
          style: TextStyle(
            color: colorWhite,
            fontSize: 15,
          ),),

          const SizedBox(height: 15.0,),
        InputField(controller: emailController,
            icon: Icons.email,
            hintText: "Enter your email",),
            const  SizedBox(height: 15,),
            InputField(controller: passwordController,
            icon: Icons.password,
            hintText: "Enter your password",
            obscureText: true,),

            const  SizedBox(height: 70.0,),

          PrimaryButton(text: 'Sign In', onPressed: (){
            if (isValidate()){

            }
          },
          ),

           const  SizedBox(height: 22.0,),
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
             children: [
              const  Text("Don't have an account?",
               style: TextStyle(
                color: colorWhite
               ),),
               
               GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationScreen(),));
                },
                 child:const Text(' Sign Up',
                 style: TextStyle(
                  color: colorWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                 ),),
               ),
             ],
           )
          ],
        )
      ) ,
    
    
    );
  }
  bool isValidate(){ 
    if(emailController.text.isEmpty){
      showScaffold(context, 'Please enter your Email');
    return false;
    }
    if(passwordController.text.isEmpty){
      showScaffold(context, 'Please enter your Password');
    return false;
    }
    return true;
  }
}