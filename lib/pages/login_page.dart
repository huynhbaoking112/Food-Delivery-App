import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fooddelivery/components/my_button.dart';
import 'package:fooddelivery/components/my_text_field.dart';

class LoginPage extends StatelessWidget {
  
  final Function togglePage;
  
  LoginPage({super.key, required this.togglePage});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Icon
              const Icon(Icons.privacy_tip_outlined, size: 100,),

              const SizedBox(height: 20,),

              //Banner
              Text("Food Delivery App", style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Theme.of(context).colorScheme.inversePrimary
              ),),

              const SizedBox(height: 20,),

              //Email Field
              MyTextField(hintText: 'Email', obscureText: false, textController: emailController),

              const SizedBox(height: 10,),

              //Password Field
              MyTextField(hintText: 'Password', obscureText: false, textController: passwordController),

              const SizedBox(height: 10,),

              //SignIn
              MyButton(name: "Sign In", onTap: (){}),

              //Navigate to RegisterPage
              const SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a member? '),
                  GestureDetector(
                    onTap: (){
                      togglePage();
                    },
                    child: Text('Register now', style: TextStyle(
                      fontWeight: FontWeight.w700
                    ),),
                  )
                ],
              )
            ],
          ),
        ),
    );
  }
}
