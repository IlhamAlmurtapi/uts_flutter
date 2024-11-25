import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const SettingsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          _buildBackgroundImage(), // Panggil fungsi untuk menampilkan background
          _pages[_selectedIndex],
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Wisata Pangandaran'),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }

  Widget _buildBackgroundImage() {
    return const Image(
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      image: AssetImage('assets/Background1.jpg'),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Daftar nama untuk ditampilkan di ListView
    final List<String> itemNames = [
      'Pantai Pangandaran',
      'Pasir Putih',
      'Pangandaran Sunset',
      'Pangandaran Sunrise',
      'Pantai Batu hiu',
      'Pantai Batu Karas',
      'Pantai Madasari',
      'Cagar Alam Pangandaran',
    ];

    return ListView.builder(
      itemCount: itemNames.length, // Jumlah item berdasarkan daftar nama
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(itemNames[index]), // Menampilkan nama item
          ),
        );
      },
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(title: Text('Setting 1')),
        ListTile(title: Text('Setting 2')),
        ListTile(title: Text('Setting 3')),
      ],
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Text(
        'User  Profile',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}
