import 'package:flutter/material.dart';
import 'principal/principal_dashboard.dart';
import 'teacher/teacher_dashboard.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String selectedRole = "Principal"; // default role

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  // 🔵 App Title
                  Text(
                    "Admission Tracker Login",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: Colors.blue.shade700,
                      letterSpacing: 1.5,
                      shadows: [
                        Shadow(
                          offset: Offset(2, 2),
                          blurRadius: 6,
                          color: Colors.black26,
                        )
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 40),

                  // 🔵 Username Field
                  TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      labelText: "Username",
                      prefixIcon: Icon(Icons.person),
                      filled: true,
                      fillColor: Colors.blue.shade50,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) return "Enter Username";
                      if (value.length < 4) return "Minimum 4 characters";
                      return null;
                    },
                  ),

                  SizedBox(height: 20),

                  // 🔵 Password Field
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: Icon(Icons.lock),
                      filled: true,
                      fillColor: Colors.blue.shade50,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) return "Enter Password";
                      if (value.length < 6) return "Password must be at least 6 characters";
                      return null;
                    },
                  ),

                  SizedBox(height: 25),

                  // 🔵 Role Dropdown
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.blue.shade200),
                    ),
                    child: DropdownButton<String>(
                      value: selectedRole,
                      isExpanded: true,
                      underline: SizedBox(),
                      items: ["Principal", "Teacher"]
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedRole = value!;
                        });
                      },
                    ),
                  ),

                  SizedBox(height: 30),

                  // 🔵 Login Button (Animated)
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        if (selectedRole == "Principal") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => PrincipalDashboard()),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => TeacherDashboard()),
                          );
                        }
                      }
                    },
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          colors: [Colors.blue, Colors.lightBlueAccent],
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(4, 4),
                            blurRadius: 8,
                            color: Colors.black26,
                          )
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
