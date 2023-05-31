
import 'package:carmanager/Page/accountPage.dart';
import 'package:carmanager/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Home'),
        backgroundColor: kPrimaryColor,
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccountPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: 'Entrez votre texte',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Action à effectuer lors de l'appui sur le bouton
                String enteredText = _textEditingController.text;
                // Faire quelque chose avec le texte entré, par exemple l'envoyer à une autre page
              },
              child: Text('Envoyer'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: kPrimaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.send), // Icône pour aller vers la page 1
              onPressed: () {
                // Action à effectuer lors de l'appui sur l'icône de la page 1
                // Naviguer vers la page 1
              },
            ),
            IconButton(
              icon: Icon(Icons.send), // Icône pour aller vers la page 2
              onPressed: () {
                // Action à effectuer lors de l'appui sur l'icône de la page 2
                // Naviguer vers la page 2
              },
            ),
          ],
        ),
      ),
    );
  }
}
