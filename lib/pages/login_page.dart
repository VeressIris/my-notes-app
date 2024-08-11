import 'package:flutter/cupertino.dart';
import 'package:my_notes_app/pages/register_page.dart';
import 'package:my_notes_app/widgets/my_form_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Text('Login',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          ),
          const MyFormTextField(
            text: 'Email',
            obscureText: false,
          ),
          const MyFormTextField(
            text: 'Password',
            obscureText: true,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 16),
            child: CupertinoButton(
              color: CupertinoColors.activeOrange,
              onPressed: () {
                //login
              },
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text('Login', style: TextStyle(fontSize: 16)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Don\'t have an account? Register ',
                  style: TextStyle(
                      color: CupertinoColors.systemGrey, fontSize: 16)),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => const RegisterPage()));
                },
                child: const Text(
                  'here',
                  style: TextStyle(
                      color: CupertinoColors.activeBlue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Text('.',
                  style: TextStyle(
                      color: CupertinoColors.systemGrey, fontSize: 16)),
            ],
          ),
        ],
      ),
    ));
  }
}
