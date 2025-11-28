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

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String selectedRole = "Principal";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                // 🔵 College Logo
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/images/gttc_logo.jpg"),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 15,
                        spreadRadius: 3,
                        color: Colors.black26,
                        offset: Offset(3, 3),
                      )
                    ],
                  ),
                ),

                SizedBox(height: 20),

                Text(
                  "Admission Tracker",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: Colors.blue.shade900,
                    letterSpacing: 1.5,
                  ),
                ),

                SizedBox(height: 35),

                // 🟣 Glassmorphic Login Card
                Container(
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.85),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 15,
                        color: Colors.black26,
                        offset: Offset(4, 4),
                      )
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [

                        // Username
                        TextFormField(
                          controller: usernameController,
                          decoration: InputDecoration(
                            labelText: "Username",
                            prefixIcon: Icon(Icons.person, color: Colors.blue),
                            filled: true,
                            fillColor: Colors.blue.shade50,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) return "Enter Username";
                            if (value.length < 4) return "Minimum 4 characters";
                            return null;
                          },
                        ),

                        SizedBox(height: 18),

                        // Password
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Password",
                            prefixIcon: Icon(Icons.lock, color: Colors.blue),
                            filled: true,
                            fillColor: Colors.blue.shade50,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) return "Enter Password";
                            if (value.length < 6) return "Password too short";
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
                              )
                            ],
                            onChanged: (value) {
                              setState(() => selectedRole = value!);
                            },
                          ),
                        ),

                        SizedBox(height: 25),

                        // 💙 Login Button With Loader
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
                                        builder: (_) => PrincipalDashboard()));
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
                                  Colors.lightBlueAccent,
                                ],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 10,
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
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
