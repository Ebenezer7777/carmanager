import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../constants.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Récupérer l'utilisateur actuel
    User? user = _auth.currentUser;
    if (user != null) {
      // Pré-remplir les informations avec l'email récupéré
      _firstNameController.text = user.displayName ?? '';
      _lastNameController.text = '';
      _phoneController.text = user.phoneNumber ?? '';
    }
  }

  void _saveAccountInfo() {
    String firstName = _firstNameController.text;
    String lastName = _lastNameController.text;
    String phone = _phoneController.text;

    // Enregistrer les informations de compte dans la base de données ou effectuer une action appropriée
    print('First Name: $firstName');
    print('Last Name: $lastName');
    print('Phone: $phone');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              TextField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  labelText: 'Nom',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              ),
              TextField(
                controller: _lastNameController,
                decoration: InputDecoration(
                  labelText: 'Prénom',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              ),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Numéro de téléphone',
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _saveAccountInfo,
                child: Text('Enregistrer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
