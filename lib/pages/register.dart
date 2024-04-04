import 'package:flutter/material.dart';
import 'package:fooddelivery/components/my_button.dart';
import 'package:fooddelivery/components/my_text_field.dart';
import 'package:fooddelivery/services/auths/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? togglePage;

  const RegisterPage({super.key, required this.togglePage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController cofirmpasswordController =
      TextEditingController();

  void signUp() async {
    if (checkMatch(passwordController.text, cofirmpasswordController.text)) {
      try {
        AuthService credential = AuthService();
        await credential.signUpWithEmailPassword(
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

  bool checkMatch(String a, String b) {
    return a == b;
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
            const Icon(
              Icons.privacy_tip_outlined,
              size: 100,
            ),

            const SizedBox(
              height: 20,
            ),

            //Banner
            Text(
              "Create an account",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),

            const SizedBox(
              height: 20,
            ),

            //Email Field
            MyTextField(
                hintText: 'Email',
                obscureText: false,
                textController: emailController),

            const SizedBox(
              height: 10,
            ),

            //Password Field
            MyTextField(
                hintText: 'Password',
                obscureText: true,
                textController: passwordController),

            const SizedBox(
              height: 10,
            ),

            //ConfirmPassword Field
            MyTextField(
                hintText: 'Confirm Password',
                obscureText: true,
                textController: cofirmpasswordController),

            const SizedBox(
              height: 10,
            ),

            //SignIn
            MyButton(name: "Sign Up", onTap: signUp),

            //Navigate to RegisterPage
            const SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Have an account? '),
                GestureDetector(
                  onTap: widget.togglePage,
                  child: const Text(
                    'Login now',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
    ;
  }
}
