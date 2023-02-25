import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool isChanged = false;
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
            Text(
              "Welcome $name",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    decoration: const InputDecoration(
                        hintText: 'Enter username', labelText: 'Username'),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: 'Enter password', labelText: 'Password'),
                  ),
                  const SizedBox(height: 12.0),
                  Material(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(isChanged ? 50 : 4),
                    child: InkWell(
                      onTap: () async {
                        setState(() {
                          isChanged = true;
                        });
                        await Future.delayed(const Duration(seconds: 1));
                        await Navigator.pushNamed(context, MyRoutes.homeRoute);
                        setState(() {
                          isChanged = false;
                        });
                      },
                      splashColor: Colors.white.withOpacity(0.2),
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        width: isChanged ? 50 : 150,
                        height: 35,
                        alignment: Alignment.center,
                        child: isChanged
                            ? const Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : const Text('Login',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                      ),
                    ),
                  )
                  // ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //         minimumSize: const Size(150.0, 30.0)),
                  //     onPressed: () {
                  //       Navigator.pushNamed(context, MyRoutes.homeRoute);
                  //     },
                  //     child: const Text(
                  //       'Login',
                  //       style: TextStyle(
                  //           color: Colors.white, fontWeight: FontWeight.bold),
                  //     ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
