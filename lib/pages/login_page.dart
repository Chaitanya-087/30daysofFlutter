import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset("assets/images/login_image.png", fit: BoxFit.cover),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              "Welcome",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Enter username', labelText: 'Username'),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: 'Enter password', labelText: 'Password'),
                  ),
                  const SizedBox(height: 10.0),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(150.0, 30.0)),
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.homeRoute);
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
