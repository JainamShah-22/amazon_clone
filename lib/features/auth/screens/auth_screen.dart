import 'package:amazaon_clone/common/widgets/custom_button.dart';
import 'package:amazaon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/custom_textfield.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

enum Auth { login, register }

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController _name = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();
  final _registerFormKey = GlobalKey<FormState>();
  Auth _auth = Auth.register;

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalVariable.greyBackgroundCOlor,
        centerTitle: true,
        title: const Text(
          "Welcome",
          style: TextStyle(
              color: Colors.black87, fontSize: 22, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          ListTile(
              tileColor: _auth == Auth.register
                  ? GlobalVariable.backgroundColor
                  : GlobalVariable.greyBackgroundCOlor,
              title: const Text("Create Account",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              leading: Radio(
                  value: Auth.register,
                  groupValue: _auth,
                  activeColor: GlobalVariable.secondaryColor,
                  onChanged: (value) => setState(() {
                        _auth = value!;
                      }))),
          if (_auth == Auth.register)
            Form(
                key: _loginFormKey,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: GlobalVariable.backgroundColor,
                  child: Column(
                    children: [
                      CustomTextField(
                        textController: _name,
                        hintText: "Name",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        textController: _email,
                        hintText: "Email",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        textController: _password,
                        hintText: "Password",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        action: "Sign-up",
                        onTap: () {},
                      )
                    ],
                  ),
                )),
          ListTile(
              title: const Text("Sign-in",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              leading: Radio(
                  value: Auth.login,
                  activeColor: GlobalVariable.secondaryColor,
                  groupValue: _auth,
                  onChanged: (value) => setState(() {
                        _auth = value!;
                      }))),
          if (_auth == Auth.login)
            Form(
                key: _registerFormKey,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                  child: Column(
                    children: [
                      CustomTextField(
                        textController: _email,
                        hintText: "Email",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        textController: _password,
                        hintText: "Password",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        action: "Sign-in",
                        onTap: () {},
                      )
                    ],
                  ),
                )),
        ],
      ),
    );
  }
}
