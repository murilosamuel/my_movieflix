import 'package:flutter/material.dart';
import 'package:my_movieflix/src/features/home/presentation/ui/pages/home.page.dart';
import 'package:my_movieflix/src/features/profile/presentation/ui/pages/profile.page.dart';
import 'package:my_movieflix/src/features/media/presentation/ui/pages/search.page.dart';

class HomeControl extends StatefulWidget {
  const HomeControl({Key? key}) : super(key: key);

  @override
  _HomeControlState createState() => _HomeControlState();
}

class _HomeControlState extends State<HomeControl> {
  final _controller = PageController();
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _hboMaxDecoration,
        child: PageView(
          controller: _controller,
          onPageChanged: (currentIndex){
            setState(() {
              _currentIndex = currentIndex;
            });
          },
          children: const [
            HomePage(),
            SearchPage(),
            ProfilePage(),
          ],
        ),
      ),
      bottomNavigationBar: _bottomNavigationBar,
    );
  }

  Widget get _bottomNavigationBar {
    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.white, width: 0.2)),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.deepPurple.shade300,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 25,
        currentIndex: _currentIndex,
        onTap: (currentIndex){
          _controller.animateToPage(
            currentIndex,
            duration: const Duration(milliseconds: 350),
            curve: Curves.linear,
          );
          setState(() {
            _currentIndex = currentIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }

  BoxDecoration get _hboMaxDecoration {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color(0xFF0A0211),
          Color(0xFF1E053E),
          Color(0xFF1C032B),
          Color(0xFF350442),
        ],
        stops: [0.05, 0.31, 0.56, 0.79],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );
  }
}
