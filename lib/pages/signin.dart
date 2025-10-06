import 'package:flutter/material.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Image.asset('assets/logo/logo-landscape.png'),

              Text(
                'Sign In',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Email',
                ),
              ),
              SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
              ),
              SizedBox(height: 8),
              Text('Tidak memiliki akun?'),
              SizedBox(height: 8),
              ElevatedButton(onPressed: () {}, child: Text('Sign In')),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Image.asset('assets/logo/logo-landscape.png'),
          ),
        ],
      ),
    );
  }
}
