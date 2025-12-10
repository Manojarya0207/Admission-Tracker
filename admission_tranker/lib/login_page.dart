import 'package:flutter/material.dart';
import 'principal/principal_dashboard.dart';
import 'teacher/teacher_dashboard.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String selectedRole = "Principal";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Modern Gradient Background
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade800, Colors.blue.shade300],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [

                  // Logo Section
                  Column(
                    children: [
                      Container(
                        height: 110,
                        width: 110,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("assets/images/gttc_logo.jpg"),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 15,
                              spreadRadius: 2,
                              offset: Offset(3, 3),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 18),
                      Text(
                        "Admission Tracker",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 40),

                  // Login Form Card
                  Container(
                    padding: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 20,
                          offset: Offset(3, 3),
                        )
                      ],
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [

                          // Phone Number Field
                          TextFormField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              labelText: "Phone Number",
                              prefixIcon:
                                  Icon(Icons.phone, color: Colors.blue),
                              filled: true,
                              fillColor: Colors.blue.shade50,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) return "Enter phone number";
                              if (value.length != 10)
                                return "Phone number must be 10 digits";
                              return null;
                            },
                          ),

                          SizedBox(height: 18),

                          // Password Field
                          TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: "Password",
                              prefixIcon:
                                  Icon(Icons.lock, color: Colors.blue),
                              filled: true,
                              fillColor: Colors.blue.shade50,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) return "Enter password";
                              if (value.length < 6)
                                return "Password must be at least 6 characters";
                              return null;
                            },
                          ),

                          SizedBox(height: 18),

                          // Role Dropdown
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade50,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.blue.shade200),
                            ),
                            child: DropdownButton(
                              value: selectedRole,
                              isExpanded: true,
                              underline: SizedBox(),
                              items: [
                                DropdownMenuItem(
                                  value: "Principal",
                                  child: Text("Principal"),
                                ),
                                DropdownMenuItem(
                                  value: "Teacher",
                                  child: Text("Teacher"),
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  selectedRole = value!;
                                });
                              },
                            ),
                          ),

                          SizedBox(height: 28),

                          // Login Button With Loader
                          InkWell(
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() => isLoading = true);

                                await Future.delayed(Duration(seconds: 2));

                                setState(() => isLoading = false);

                                if (selectedRole == "Principal") {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              PrincipalDashboard()));
                                } else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => TeacherDashboard()));
                                }
                              }
                            },
                            child: Container(
                              height: 55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.blue.shade700,
                                    Colors.lightBlueAccent
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 12,
                                    color: Colors.blue.shade300,
                                    offset: Offset(3, 3),
                                  )
                                ],
                              ),
                              child: Center(
                                child: isLoading
                                    ? CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : Text(
                                        "LOGIN",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
