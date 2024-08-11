import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:my_notes_app/pages/login_page.dart';
import 'package:my_notes_app/widgets/my_form_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final verifyPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Text('Register',
                    style:
                        TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              ),
              MyFormTextField(
                text: 'Username',
                controller: usernameController,
              ),
              MyFormTextField(
                text: 'Email',
                controller: emailController,
              ),
              MyFormTextField(
                text: 'Password',
                obscureText: true,
                controller: passwordController,
              ),
              MyFormTextField(
                text: 'Confirm password',
                obscureText: true,
                controller: verifyPasswordController,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: CupertinoButton(
                  color: CupertinoColors.activeOrange,
                  onPressed: () {
                    // Handle registration logic here
                  },
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text('Register', style: TextStyle(fontSize: 16)),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: const TextStyle(
                      color: CupertinoColors.systemGrey,
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: 'Login here',
                        style: const TextStyle(
                          color: CupertinoColors.activeBlue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).push(
                              CupertinoPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          },
                      ),
                      const TextSpan(
                        text: '.',
                        style: TextStyle(
                          color: CupertinoColors.systemGrey,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    verifyPasswordController.dispose();
    super.dispose();
  }
}
