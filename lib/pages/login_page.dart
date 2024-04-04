import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fooddelivery/components/my_button.dart';
import 'package:fooddelivery/components/my_text_field.dart';
import 'package:fooddelivery/pages/home.dart';
import 'package:fooddelivery/services/auths/auth_service.dart';

class LoginPage extends StatefulWidget {
  
  final void Function()?  togglePage;
  
  const LoginPage({super.key, required this.togglePage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //textEditingControllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  //login method
  void signIn() async {
    
     if (emailController!='' && passwordController!='') {
      try {
        AuthService credential = AuthService();
        await credential.signInWithEmailPassword(
            emailController.text, passwordController.text);
      } catch (e) {
        showDialog(context: context, builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),);
      }

    } else {
      showDialog(context: context, builder: (context) => AlertDialog(
          title: Text('Password and confirmPassword is not match!'),
        ),);
    }


  }

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
              MyTextField(hintText: 'Password', obscureText: true, textController: passwordController),

              const SizedBox(height: 10,),

              //SignIn
              MyButton(name: "Sign In", onTap: signIn),

              //Navigate to RegisterPage
              const SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Not a member? '),
                  GestureDetector(
                    onTap:
                      widget.togglePage,
                    child: const Text('Register now', style: TextStyle(
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
