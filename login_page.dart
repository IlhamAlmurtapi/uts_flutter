import 'package:flutter/material.dart';
import 'home_page.dart'; // Import halaman dashboard

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackgroundImage(),
          _buildLoginForm(context),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return const Image(
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      image: AssetImage('assets/Background.jpg'),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildUsernameField(),
            const SizedBox(height: 16.0),
            _buildPasswordField(),
            const SizedBox(height: 24.0),
            _buildLoginButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildUsernameField() {
    return TextField(
      controller: _usernameController,
      decoration: InputDecoration(
        labelText: 'Username',
        border: const OutlineInputBorder(),
        fillColor: Colors.white, // Atur warna latar belakang
        filled: true, // Mengaktifkan pengisian warna
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextField(
      controller: _passwordController,
      decoration: InputDecoration(
        labelText: 'Password',
        border: const OutlineInputBorder(),
        fillColor: Colors.white, // Atur warna latar belakang
        filled: true, // Mengaktifkan pengisian warna
      ),
      obscureText: true,
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        String username = _usernameController.text;
        String password = _passwordController.text;

        // Validasi login
        if (username == 'ilham' && password == '12345') {
          // Navigasi ke dashboard
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        } else {
          // Tampilkan AlertDialog jika login gagal
          _showLoginErrorDialog(context);
        }
      },
      child: const Text('Login'),
    );
  }

  void _showLoginErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Login Failed'),
          content: const Text('Invalid username or password.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
