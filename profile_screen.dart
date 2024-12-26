import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userName = "Muzamil Nawab";

  void editProfile(String newName) {
    setState(() {
      userName = newName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("Profile",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.person, size: 40, color: Colors.deepPurple),
                const SizedBox(width: 16),
                Text(
                  userName,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 220),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  final newName = await showDialog<String>(
                    context: context,
                    builder: (context) {
                      String tempName = userName;
                      return AlertDialog(
                        title: const Text("Edit Profile"),
                        content: TextField(
                          onChanged: (value) {
                            tempName = value;
                          },
                          decoration:
                              const InputDecoration(hintText: "Enter new name"),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context, null);
                            },
                            child: const Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context, tempName);
                            },
                            child: const Text("Save"),
                          ),
                        ],
                      );
                    },
                  );

                  if (newName != null && newName.isNotEmpty) {
                    editProfile(newName);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text(
                  "Edit Profile Name",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
