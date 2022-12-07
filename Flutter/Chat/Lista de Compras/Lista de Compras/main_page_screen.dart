import 'package:flutter/material.dart';
import 'package:listcom/commons/set_appbar.dart';
import 'package:listcom/screen/charts/charts_screen.dart';
import 'package:listcom/screen/contacts/contacts_page.dart';
import 'package:listcom/screen/home/home_page.dart';
import 'package:listcom/screen/home/home_page_screen.dart';
import 'package:listcom/screen/products/product_add_page2.dart';
import 'package:listcom/screen/products/product_list_page.dart';
import 'package:listcom/screen/shoplist/shoplist.dart';
import 'package:listcom/utils/responsive.dart';

class MainPageScreen extends StatefulWidget {
  const MainPageScreen({Key? key}) : super(key: key);

  @override
  State<MainPageScreen> createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
  //criando uma lista de widgets vazia
  final List<Widget> _pages = [];
  int _currentIndex = 0;
  late String _title;
  @override
  void initState() {
    super.initState();
    _title = "ListCom - App de Compras";
    _pages.add(const HomePage()); //índice 0
    _pages.add(ChartsScreen()); //índice 1
    _pages.add(const ProductListPage()); //índice 2
    _pages.add(ProductAddPage2());
    _pages.add(ChartsScreen()); //HomePageScreen  // shoplist())
  }

  final List _isHovering = [false, false, false, false];

  GlobalKey<ScaffoldState> _key = GlobalKey(); // add this
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        key: _key,
        // appBar: PreferredSize(
        //   preferredSize: Size(screenSize.width, 1000),
        //   child: Container(
        //     color: Colors.blue,
        //     child: Padding(
        //       padding: const EdgeInsets.all(20),
        //       child: Row(
        //         children: [
        //           const Text('Lista de Compras'),
        //           Expanded(
        //             child: Row(
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               children: [
        //                 InkWell(
        //                   onHover: (value) {
        //                     setState(() {
        //                       _isHovering[0] = value;
        //                     });
        //                   },
        //                   child: Column(
        //                     mainAxisSize: MainAxisSize.min,
        //                     children: [
        //                       Text(
        //                         'Discover',
        //                         style: TextStyle(
        //                           color: _isHovering[0]
        //                               ? Colors.blue.shade200
        //                               : Colors.white,
        //                         ),
        //                       ),
        //                       SizedBox(height: 5),
        //                       // For showing an underline on hover
        //                       Visibility(
        //                         maintainAnimation: true,
        //                         maintainState: true,
        //                         maintainSize: true,
        //                         visible: _isHovering[0],
        //                         child: Container(
        //                           height: 2,
        //                           width: 20,
        //                           color: Colors.white,
        //                         ),
        //                       )
        //                     ],
        //                   ),
        //                 ),
        //                 SizedBox(width: screenSize.width / 20),
        //                 InkWell(
        //                   onTap: () {},
        //                   child: const Text(
        //                     'Contact Us',
        //                     style: TextStyle(color: Colors.black),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //           InkWell(
        //             onTap: () {},
        //             child: const Text(
        //               'Sign Up',
        //               style: TextStyle(color: Colors.black),
        //             ),
        //           ),
        //           SizedBox(
        //             width: screenSize.width / 50,
        //           ),
        //           InkWell(
        //             onTap: () {},
        //             child: const Text(
        //               'Login',
        //               style: TextStyle(color: Colors.black),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        body: IndexedStack(
          index: _currentIndex,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          currentIndex: _currentIndex,
          onTap: onTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Início",
              backgroundColor: Color.fromARGB(255, 207, 216, 220),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Perfil de Usuário",
              backgroundColor: Color.fromARGB(255, 144, 164, 174),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.miscellaneous_services),
              label: "Crud",
              backgroundColor: Color.fromARGB(255, 120, 144, 156),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance),
              label: "Crud com Imagem",
              backgroundColor: Color.fromARGB(255, 96, 125, 139),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket),
              label: "Lista de Compras",
              backgroundColor: Color.fromARGB(255, 96, 125, 139),
            ),
          ],
        ),
        drawer: Responsive.isMobile(context)
            ? Drawer(
                elevation: 2.0,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    const DrawerHeader(
                      child: Text(
                        "ListCom - Apps",
                        textScaleFactor: 1.5,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          ListTile(
                            leading: const Icon(Icons.category),
                            title: const Text('Categorias'),
                            onTap: () {
                              debugPrint("teste");
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.multiline_chart),
                            title: const Text('Perfil do Usuário'),
                            onTap: () {},
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            : null,
      ),
    );
  }

  //método/função para atualizar o índice do Widget BottomNavigationBar
  void onTapped(int index) {
    setState(() {
      _currentIndex = index;
      switch (index) {
        case 0:
          {
            _title = 'Lista de Compras - APP';
          }
          break;
        case 1:
          {
            _title = 'Exemplo de Listview';
          }
          break;
        case 2:
          {
            _title = 'Listagem de Compras';
          }
          break;
        case 3:
          {
            _title = 'Crud com Imagem';
          }
          break;
        case 4:
          {
            _title = 'Lista de Compras';
          }
          break;
      }
    });
  }

  Widget? createAppBar() {
    return AppBar(
      leading: IconButton(
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        icon: const Icon(Icons.menu),
        onPressed: () {},
      ),
      title: Text(
        _title,
        style: const TextStyle(color: Colors.black),
      ),
      actions: [
        IconButton(
          tooltip: 'Favorite',
          icon: const Icon(
            Icons.favorite,
          ),
          onPressed: () {},
        ),
        IconButton(
          tooltip: 'Buscar',
          icon: const Icon(
            Icons.search,
          ),
          onPressed: () {},
        ),
        PopupMenuButton<Text>(
          itemBuilder: (context) {
            return [
              const PopupMenuItem(
                child: Text('Primeiro'),
              ),
              const PopupMenuItem(
                child: Text('Segundo'),
              ),
              const PopupMenuItem(
                child: Text('Terceiro'),
              ),
            ];
          },
        )
      ],
    );
  }
}
