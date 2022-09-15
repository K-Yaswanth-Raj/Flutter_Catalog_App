import 'package:catalog_app/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = '';
  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context){
    if(_formKey.currentState!.validate()){
    Navigator.pushNamed(context, MyRoutes.homeRoute);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
              child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Text(
                "Welcome $name",
                style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Username Cannot be empty";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                    decoration: InputDecoration(
                        hintText: "Enter UserName", labelText: "Username"),
                  ),
                  TextFormField(
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Password Cannot be empty";
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Enter Password", labelText: "Password"),
                  )
                ],
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              style: TextButton.styleFrom(minimumSize: Size(150, 40)),
              onPressed: () => moveToHome(context),
              child: Text(
                "Login",
              ),
            ),
          ],
              ),
            ),
        ));
  }
}
