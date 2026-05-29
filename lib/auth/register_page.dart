import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:email_validator/email_validator.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() =>
      _RegisterPageState();
}

class _RegisterPageState
    extends State<RegisterPage> {
  final nameController =
      TextEditingController();

  final emailController =
      TextEditingController();

  final passwordController =
      TextEditingController();

  final confirmController =
      TextEditingController();

  bool obscure1 = true;
  bool obscure2 = true;

  void register() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Semua field wajib diisi",
      );
      return;
    }

    if (!EmailValidator.validate(
        emailController.text)) {
      Fluttertoast.showToast(
        msg: "Email tidak valid",
      );
      return;
    }

    if (passwordController.text !=
        confirmController.text) {
      Fluttertoast.showToast(
        msg: "Password tidak sama",
      );
      return;
    }

    Fluttertoast.showToast(
      msg: "Register berhasil",
    );

    Navigator.pop(context);
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
                      Icons.person_add_alt_1,
                      size: 80,
                      color: Color(
                        0xff3399FF,
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    const Text(
                      "Create Account",
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
                          nameController,

                      decoration:
                          inputStyle(
                        "Full Name",
                        Icons.person,
                      ),
                    ),

                    const SizedBox(
                      height: 18,
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

                      obscureText:
                          obscure1,

                      decoration:
                          inputStyle(
                        "Password",
                        Icons.lock,
                      ).copyWith(
                        suffixIcon:
                            IconButton(
                          icon: Icon(
                            obscure1
                                ? Icons
                                    .visibility
                                : Icons
                                    .visibility_off,
                          ),

                          onPressed: () {
                            setState(() {
                              obscure1 =
                                  !obscure1;
                            });
                          },
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 18,
                    ),

                    TextField(
                      controller:
                          confirmController,

                      obscureText:
                          obscure2,

                      decoration:
                          inputStyle(
                        "Confirm Password",
                        Icons
                            .lock_outline,
                      ).copyWith(
                        suffixIcon:
                            IconButton(
                          icon: Icon(
                            obscure2
                                ? Icons
                                    .visibility
                                : Icons
                                    .visibility_off,
                          ),

                          onPressed: () {
                            setState(() {
                              obscure2 =
                                  !obscure2;
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

                        onPressed: register,

                        child: const Text(
                          "Register",
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
                          "Already have an account? ",
                        ),

                        GestureDetector(
                          onTap: () {
                            Navigator.pop(
                              context,
                            );
                          },

                          child: const Text(
                            "Login",
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