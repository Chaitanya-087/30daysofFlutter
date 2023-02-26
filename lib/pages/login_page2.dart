import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPwd = false;
  String name = '';
  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 50, 24, 16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Hello Again!',
                          style: TextStyle(
                              fontFamily: GoogleFonts.cookie().fontFamily,
                              color: Colors.black,
                              fontSize: 45,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Wellcome back you\'ve',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'been missed!',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        )
                      ]),
                  const SizedBox(height: 50.0),
                  Container(
                    // color: Colors.white,

                    decoration: BoxDecoration(
                        color: const Color(0xFFFDFCFC),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            offset: Offset.zero,
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1,
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'username cannot be empty';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            name = value;
                          });
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter username',
                            hintStyle: TextStyle(color: Colors.grey)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          offset: Offset.zero,
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'password cannot be empty';
                          }
                          if (value.length < 6) {
                            return 'password must be atleast of 6 characters';
                          }
                          return null;
                        },
                        obscureText: !showPwd,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  showPwd = !showPwd;
                                });
                              },
                              child: showPwd
                                  ? const Icon(
                                      Icons.visibility,
                                      color: Colors.grey,
                                    )
                                  : const Icon(Icons.visibility_off,
                                      color: Colors.grey),
                            ),
                            border: InputBorder.none,
                            hintText: 'Password',
                            hintStyle: const TextStyle(color: Colors.grey)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 24),
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: const Text(
                        'Recovery Password',
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        moveToHome(context);
                      },
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 45.0,
                        alignment: Alignment.center,
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
