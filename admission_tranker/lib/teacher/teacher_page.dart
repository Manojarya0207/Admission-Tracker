import 'package:flutter/material.dart';

class TeacherPage extends StatefulWidget {
  const TeacherPage({Key? key}) : super(key: key);

  @override
  State<TeacherPage> createState() => _TeacherPageState();
}

class _TeacherPageState extends State<TeacherPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const TeacherHomeTab(),
    const TeacherStudentsTab(),
    const TeacherSettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Teacher Dashboard"),
        centerTitle: true,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Students"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}

// ------------------------------------------------------
// HOME TAB
// ------------------------------------------------------

class TeacherHomeTab extends StatefulWidget {
  const TeacherHomeTab({Key? key}) : super(key: key);

  @override
  State<TeacherHomeTab> createState() => _TeacherHomeTabState();
}

class _TeacherHomeTabState extends State<TeacherHomeTab> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  String _status = "Waiting";
  final List<Map<String, String>> _localEntries = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Add Student Details", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),

          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: "Student Name"),
          ),

          const SizedBox(height: 15),
          TextField(
            controller: _phoneController,
            decoration: const InputDecoration(labelText: "Phone Number"),
            keyboardType: TextInputType.phone,
          ),

          const SizedBox(height: 20),
          DropdownButtonFormField<String>(
            value: _status,
            items: const [
              DropdownMenuItem(value: "Waiting", child: Text("Waiting")),
              DropdownMenuItem(value: "Ready to Join", child: Text("Ready to Join")),
              DropdownMenuItem(value: "Not Interested", child: Text("Not Interested")),
            ],
            onChanged: (value) => setState(() => _status = value!),
            decoration: const InputDecoration(labelText: "Status"),
          ),

          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _localEntries.add({
                  "name": _nameController.text,
                  "phone": _phoneController.text,
                  "status": _status,
                });
              });

              _nameController.clear();
              _phoneController.clear();
            },
            child: const Text("Add Student"),
          ),

          const SizedBox(height: 30),
          const Text("Local Entries", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

          const SizedBox(height: 10),
          ..._localEntries.map((entry) => Card(
                child: ListTile(
                  title: Text(entry["name"]!),
                  subtitle: Text("Status: ${entry["status"]}"),
                ),
              )),
        ],
      ),
    );
  }
}

// ------------------------------------------------------
// STUDENTS TAB
// ------------------------------------------------------

class TeacherStudentsTab extends StatelessWidget {
  const TeacherStudentsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("Students Assigned by Principal",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

          SizedBox(height: 20),
          Text("This list will display student data pushed by the principal."),
        ],
      ),
    );
  }
}

// ------------------------------------------------------
// SETTINGS TAB
// ------------------------------------------------------

class TeacherSettingsTab extends StatelessWidget {
  const TeacherSettingsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // TODO: logout logic
        },
        child: const Text("Logout"),
      ),
    );
  }
}
