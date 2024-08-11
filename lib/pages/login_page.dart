import 'package:flutter/cupertino.dart';
import 'package:my_notes_app/pages/register_page.dart';

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
          SizedBox(
            width: 250,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: CupertinoTextField(
                placeholder: 'Email',
                padding: const EdgeInsets.all(12),
                spellCheckConfiguration:
                    const SpellCheckConfiguration.disabled(),
                decoration: BoxDecoration(
                  border: Border.all(color: CupertinoColors.systemGrey2),
                  borderRadius: BorderRadius.circular(8),
                ),
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
              ),
            ),
          ),
          SizedBox(
            width: 250,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: CupertinoTextField(
                placeholder: 'Password',
                obscureText: true,
                spellCheckConfiguration:
                    const SpellCheckConfiguration.disabled(),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: CupertinoColors.systemGrey2),
                  borderRadius: BorderRadius.circular(8),
                ),
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
              ),
            ),
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
