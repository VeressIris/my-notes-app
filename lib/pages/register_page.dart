import 'package:flutter/cupertino.dart';
import 'package:my_notes_app/pages/login_page.dart';
import 'package:my_notes_app/widgets/my_form_text_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
            child: Text('Register',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          ),
          const MyFormTextField(text: 'Username', obscureText: false),
          const MyFormTextField(
            text: 'Email',
            obscureText: false,
          ),
          const MyFormTextField(
            text: 'Password',
            obscureText: true,
          ),
          const MyFormTextField(text: 'Confirm password', obscureText: true),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 16),
            child: CupertinoButton(
              color: CupertinoColors.activeOrange,
              onPressed: () {
                // Register
              },
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text('Register', style: TextStyle(fontSize: 16)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Already have an account? Login ',
                  style: TextStyle(
                      color: CupertinoColors.systemGrey, fontSize: 16)),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => const LoginPage()));
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
