import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:my_notes_app/pages/register_page.dart';
import 'package:my_notes_app/services/auth_service.dart';
import 'package:my_notes_app/widgets/my_form_text_field.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:my_notes_app/pages/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    final auth = AuthService(client: Supabase.instance.client);
    try {
      await auth.loginWithEmail(
          emailController.text, passwordController.text);
      Navigator.of(context).push(
        CupertinoPageRoute(
          builder: (context) => const Homepage(title: 'My notes'),
        ),
      );
    } catch (e) {
      throw Exception('Error logging in: $e');
    }
  }

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
                child: Text('Login',
                    style:
                        TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
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
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: CupertinoButton(
                  color: CupertinoColors.activeOrange,
                  onPressed: () {
                    login();
                  },
                  minSize: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Text('Login', style: TextStyle(fontSize: 16)),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: const TextStyle(
                      color: CupertinoColors.systemGrey,
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: 'Register here',
                        style: const TextStyle(
                          color: CupertinoColors.activeBlue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).push(
                              CupertinoPageRoute(
                                builder: (context) => const RegisterPage(),
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
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
