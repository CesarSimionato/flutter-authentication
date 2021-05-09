import 'package:authentication/provider/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoggedInWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Container(
      alignment: Alignment.center,
      color: Colors.blueGrey.shade900,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 8),
          CircleAvatar(
            maxRadius: 50,
            backgroundImage: NetworkImage(user.photoURL),
          ),
          SizedBox(height: 8),
          Text(
            'Nome: ' + user.displayName,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          SizedBox(height: 8),
          Text(
            'Email: ' + user.email,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
            },
            child: Text(
              'Sair',
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
