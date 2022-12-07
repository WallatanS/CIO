import 'package:flutter/material.dart';
import 'package:sic_dev/pages/dashboard_screen.dart';
import 'package:sic_dev/pages/firts_page.dart';
import 'package:sic_dev/pages/second_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPage = 0;
  List<Widget> pageList = [];

  @override
  void initState() {
    pageList.add(const FirstPage());
    pageList.add(const SecondPage());
    pageList.add(const DashboardScreen());
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sistema de Conversa SIC"),
      ),
      body: IndexedStack(
        children: pageList,
        index: _selectedPage,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedPage,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Início"),
          BottomNavigationBarItem(
              icon: Icon(Icons.list_alt), label: "Categorias"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    _selectedPage = index;
  }
}
