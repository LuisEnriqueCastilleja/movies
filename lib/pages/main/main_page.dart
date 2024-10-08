import 'package:flutter/material.dart';
import 'package:movies/helpers/colors_movies.dart';
import 'package:movies/helpers/font_awesome.dart';
import 'package:movies/helpers/style_movies.dart';
import 'package:movies/pages/activity/activity_page.dart';
import 'package:movies/pages/home/home_page.dart';
import 'package:movies/pages/my_lists/my_lists_page.dart';
import 'package:movies/pages/search/search_page.dart';
import 'package:movies/widgets/app_bars/appbar_home_widget.dart';

//Pagina princiapl que contiene las 4 paginas, de Home, Activity, MyLists, Search
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

//Paginas del BottomNavigationBar
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ActivityPage(),
    MyListsPage(),
    SearchPage(),
  ];

//Cuando le de al icono guardamos el index para cambiar de pagina
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarHomeWidget(
        title: 'Hi Luis',
        onPressedNotifications: () => {},
        onPressedUser: () => {},
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      //BottomNavigationBar para tener las 4 paginas
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        unselectedIconTheme: const IconThemeData(color: ColorsMovies.darkGrey),
        unselectedLabelStyle: StyleMovies.greyMedium12,
        showUnselectedLabels: true,
        items: [
          //Listado de iconos del BottomNavigationBar
          BottomNavigationBarItem(
            backgroundColor: ColorsMovies.darkBlue,
            icon: (_selectedIndex == 0)
                ? FontAwesome.whiteHouse25
                : FontAwesome.greyHouse20,
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: ColorsMovies.darkBlue,
            icon: (_selectedIndex == 1)
                ? FontAwesome.whiteChartLine25
                : FontAwesome.greyChartLine20,
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            backgroundColor: ColorsMovies.darkBlue,
            icon: (_selectedIndex == 2)
                ? FontAwesome.whiteList25
                : FontAwesome.greyList20,
            label: 'My List',
          ),
          BottomNavigationBarItem(
            backgroundColor: ColorsMovies.darkBlue,
            icon: (_selectedIndex == 3)
                ? FontAwesome.whiteMagnifyingGlass25
                : FontAwesome.darkBlueMagnifyingGlass20,
            label: 'Search',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
