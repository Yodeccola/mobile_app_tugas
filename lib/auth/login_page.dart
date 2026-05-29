import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:email_validator/email_validator.dart';
import 'register_page.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() =>
      _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController =
      TextEditingController();

  final passwordController =
      TextEditingController();

  bool obscure = true;

  void login() {
    String email =
        emailController.text.trim();

    String password =
        passwordController.text.trim();

    if (email.isEmpty ||
        password.isEmpty) {
      Fluttertoast.showToast(
        msg: "Semua field wajib diisi",
      );
      return;
    }

    if (!EmailValidator.validate(email)) {
      Fluttertoast.showToast(
        msg: "Email tidak valid",
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) =>
            HomePage(email: email),
      ),
    );
  }

  InputDecoration inputStyle(
    String hint,
    IconData icon,
  ) {
    return InputDecoration(
      hintText: hint,

      prefixIcon: Icon(icon),

      filled: true,

      fillColor: Colors.white,

      contentPadding:
          const EdgeInsets.symmetric(
        vertical: 18,
      ),

      border: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(12),

        borderSide: BorderSide(
          color: Colors.grey.shade300,
        ),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(12),

        borderSide: BorderSide(
          color: Colors.grey.shade300,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(12),

        borderSide: const BorderSide(
          color: Color(0xff3399FF),
          width: 2,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff4FACFE),
              Color(0xffC850FF),
            ],
          ),
        ),

        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding:
                  const EdgeInsets.all(24),

              child: Container(
                padding:
                    const EdgeInsets.all(24),

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius:
                      BorderRadius.circular(
                    28,
                  ),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black
                          .withOpacity(0.12),

                      blurRadius: 18,

                      offset:
                          const Offset(0, 8),
                    ),
                  ],
                ),

                child: Column(
                  children: [
                    const Icon(
                      Icons.lock_outline,
                      size: 80,
                      color: Color(
                        0xff3399FF,
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    const Text(
                      "Welcome Back",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(
                      height: 30,
                    ),

                    TextField(
                      controller:
                          emailController,

                      decoration:
                          inputStyle(
                        "Email",
                        Icons.email,
                      ),
                    ),

                    const SizedBox(
                      height: 18,
                    ),

                    TextField(
                      controller:
                          passwordController,

                      obscureText: obscure,

                      decoration:
                          inputStyle(
                        "Password",
                        Icons.lock,
                      ).copyWith(
                        suffixIcon:
                            IconButton(
                          icon: Icon(
                            obscure
                                ? Icons
                                    .visibility
                                : Icons
                                    .visibility_off,
                          ),

                          onPressed: () {
                            setState(() {
                              obscure =
                                  !obscure;
                            });
                          },
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 26,
                    ),

                    SizedBox(
                      width: double.infinity,
                      height: 55,

                      child: ElevatedButton(
                        style:
                            ElevatedButton
                                .styleFrom(
                          backgroundColor:
                              const Color(
                            0xff3399FF,
                          ),

                          shape:
                              RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius
                                    .circular(
                              12,
                            ),
                          ),
                        ),

                        onPressed: login,

                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color:
                                Colors.white,
                            fontSize: 16,
                            fontWeight:
                                FontWeight
                                    .bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 24,
                    ),

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .center,

                      children: [
                        const Text(
                          "Don't have an account? ",
                        ),

                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    const RegisterPage(),
                              ),
                            );
                          },

                          child: const Text(
                            "Register",
                            style:
                                TextStyle(
                              color: Colors
                                  .blue,
                              fontWeight:
                                  FontWeight
                                      .bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}