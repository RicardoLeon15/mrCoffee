import 'package:flutter/material.dart';
import 'package:mrcoffee/Colores/degradado.dart';
import '../../widgets/ListaProductos.dart';
import 'Carrito.dart';
import 'Menu.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  List _listPages = [];
  late Widget _currentPage;
  @override
  void initState() {
    super.initState();
    _listPages
      ..add(Menu())
      ..add(FetchData())
      //..add(Perfil())
      ..add(Carrito());
    _currentPage = Menu();
  }

  void _changePage(int selectedIndex) {
    setState(() {
      _currentIndex = selectedIndex;
      _currentPage = _listPages[selectedIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: hexStringToColor('#FFFFFF'),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.search,color: hexStringToColor("#757575"),),
          onPressed: (){},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart,color: hexStringToColor("#757575"),),
            onPressed: (){},
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: _currentPage,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: hexStringToColor('#FF5722'),
        fixedColor: hexStringToColor('#4CAF50'),
        unselectedItemColor: Colors.white,
          iconSize: 26,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: 'Carrito',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Perfil',
          ),
        ],
        onTap: (selectedIndex) => _changePage(selectedIndex),
      ),
    );
  }
}
