import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PrincipalHome(),
  ));
}

// -------------------------------------------------------------
// PRINCIPAL HOME PAGE
// -------------------------------------------------------------
class PrincipalHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F6FA),
      appBar: AppBar(
        title: Text("Principal Dashboard"),
        backgroundColor: Colors.blue,
        elevation: 2,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome, Principal",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatCard("Total Students", "520", Colors.blue),
                _buildStatCard("Teachers", "35", Colors.green),
              ],
            ),
            SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatCard("Pending Admissions", "18", Colors.orange),
                _buildStatCard("Completed", "502", Colors.purple),
              ],
            ),

            SizedBox(height: 25),
            Text("Actions",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 15),

            _buildActionButton(
              icon: Icons.table_chart,
              title: "View Students Table",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => StudentsTablePage()));
              },
            ),

            SizedBox(height: 10),
            _buildActionButton(
              icon: Icons.person_add,
              title: "Add New Student",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => AddStudentPage()));
              },
            ),

            SizedBox(height: 10),
            _buildActionButton(
              icon: Icons.settings,
              title: "Settings",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => PrincipalSettingsPage()));
              },
            ),

            SizedBox(height: 10),
            _buildActionButton(
              icon: Icons.school,
              title: "Teacher Dashboard",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => TeacherHomePage()));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, Color color) {
    return Container(
      width: 165,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade300, blurRadius: 6, offset: Offset(1, 3))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 14, color: Colors.black54)),
          SizedBox(height: 8),
          Text(value,
              style: TextStyle(
                  fontSize: 26, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }

  Widget _buildActionButton(
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(color: Colors.grey.shade300, blurRadius: 6, offset: Offset(1, 4))
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 30, color: Colors.blue),
            SizedBox(width: 16),
            Text(title,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}

// -------------------------------------------------------------
// STUDENT TABLE PAGE
// -------------------------------------------------------------
class StudentsTablePage extends StatelessWidget {
  final List<Map<String, String>> students = [
    {"name": "Abdul Rahman", "parent": "Mujahid"},
    {"name": "Fatima Noor", "parent": "Saeed"},
    {"name": "Ali Khan", "parent": "Iqbal"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Students Table")),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: DataTable(
          columns: [
            DataColumn(label: Text("Name")),
            DataColumn(label: Text("Parent Contact")),
          ],
          rows: students
              .map(
                (s) => DataRow(
                  cells: [
                    DataCell(Text(s["name"]!)),
                    DataCell(Text(s["parent"]!)),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

// -------------------------------------------------------------
// ADD STUDENT FORM
// -------------------------------------------------------------
class AddStudentPage extends StatefulWidget {
  @override
  State<AddStudentPage> createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController parentCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Student")),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameCtrl,
              decoration: InputDecoration(
                labelText: "Student Name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            TextField(
              controller: parentCtrl,
              decoration: InputDecoration(
                labelText: "Parent Contact",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 25),

            ElevatedButton(
              onPressed: () {
                if (nameCtrl.text.isNotEmpty &&
                    parentCtrl.text.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Student Added Successfully")),
                  );
                }
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}

// -------------------------------------------------------------
// PROFESSIONAL SETTINGS MENU
// -------------------------------------------------------------
class PrincipalSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),

      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.person, color: Colors.blue),
            title: Text("Profile Settings"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.lock, color: Colors.green),
            title: Text("Change Password"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.notifications, color: Colors.orange),
            title: Text("Notification Settings"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text("Logout"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

// -------------------------------------------------------------
// TEACHER VERSION PAGES
// -------------------------------------------------------------
class TeacherHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teacher Dashboard"),
        backgroundColor: Colors.green,
      ),

      body: Padding(
        padding: EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome, Teacher",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),

            _buildTeacherButton(
              icon: Icons.list,
              title: "My Class Students",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => StudentsTablePage()));
              },
            ),

            SizedBox(height: 10),

            _buildTeacherButton(
              icon: Icons.assignment,
              title: "Assign Homework",
              onTap: () {},
            ),

            SizedBox(height: 10),

            _buildTeacherButton(
              icon: Icons.check_circle,
              title: "Attendance",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeacherButton(
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(color: Colors.grey.shade300, blurRadius: 5, offset: Offset(1, 4))
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 30, color: Colors.green),
            SizedBox(width: 16),
            Text(title,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
