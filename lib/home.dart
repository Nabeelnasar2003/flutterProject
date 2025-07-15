import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = 'Muhammed Nabeel';
  int age = 21;
  String bio = 'Aspiring Flutter developer from Kerala.';

  void openForm() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileFormPage(

          currentName: name,
          currentAge: age,
          currentBio: bio,
        ),
      ),
    );

    if (result != null) {
      setState(() {
        name = result['name'];
        age = result['age'];
        bio = result['bio'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Profile Card')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/images/5332447875512265802.j'),
            ),
            SizedBox(height: 20),
            Text(
              name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Age: $age',
              style:  TextStyle(fontSize: 18),
            ),
            Padding(
              padding:  EdgeInsets.all(12.0),
              child: Text(
                bio,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: openForm,
              child:  Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileFormPage extends StatefulWidget {

  final String currentName;
  final int currentAge;
  final String currentBio;

  const ProfileFormPage({
    super.key,
    required this.currentName,
    required this.currentAge,
    required this.currentBio,
  });

  @override
  State<ProfileFormPage> createState() => ProfileFormPageState();
}

class ProfileFormPageState extends State<ProfileFormPage> {
  late TextEditingController nameController;
  late TextEditingController ageController;
  late TextEditingController bioController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.currentName);
    ageController = TextEditingController(text: widget.currentAge.toString());
    bioController = TextEditingController(text: widget.currentBio);
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    bioController.dispose();
    super.dispose();
  }

  void submitForm() {
    String name = nameController.text.trim();
    String ageText = ageController.text.trim();
    String bio = bioController.text.trim();

    if (name.isEmpty || ageText.isEmpty || bio.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text('Please fill all fields')),
      );
    } else if (int.tryParse(ageText) == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid age')),
      );
    } else {
      Navigator.pop(context, {
        'name': name,
        'age': int.parse(ageText),
        'bio': bio,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: ageController,
                decoration: const InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: bioController,
                decoration: const InputDecoration(labelText: 'Bio'),
                maxLines: 3,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: submitForm,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      
    );
  }
}
