import 'package:flutter/material.dart';
import 'package:uichallenge/src/screens/about_page.dart';
import 'package:uichallenge/src/screens/help_page.dart';
import 'package:uichallenge/src/screens/home_page.dart';
import 'package:uichallenge/src/screens/main_page.dart';

class LandingPage extends StatefulWidget {
  final String page;
  final String extras;
  const LandingPage({
    Key? key,
    required this.page,
    required this.extras,
  }) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<String> pages = [
    'home',
    'about',
    'profile',
    'settings',
    'help',
  ];

  List<IconData> icons = [
    Icons.home,
    Icons.pages_rounded,
    Icons.person_rounded,
    Icons.settings_rounded,
    Icons.help_rounded
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.1,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: icons.map((e) {
                  return NavItem(
                      icon: e,
                      onTap: () {
                        if (icons.indexOf(e) == 1) {
                          Navigator.pushNamed(context,
                              '/main/${pages[icons.indexOf(e)]}/Allison/2');
                        } else {
                          Navigator.pushNamed(
                              context, '/main/${pages[icons.indexOf(e)]}');
                        }
                      },
                      isSelected:
                          icons.indexOf(e) == pages.indexOf(widget.page));
                }).toList(),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Center(
                  child: IndexedStack(
                index: pages.indexOf(widget.page),
                children: [
                  const HomePageCustomHook(),
                  const AboutPage(
                    name: 'Scott',
                  ),
                  const HelpPage(),
                  const MainPage(),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}

class NavItem extends StatefulWidget {
  final IconData icon;
  final bool isSelected;
  final void Function()? onTap;
  const NavItem({
    Key? key,
    required this.icon,
    required this.isSelected,
    this.onTap,
  }) : super(key: key);

  @override
  _NavItemState createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => widget.onTap!(),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 375),
          width: double.infinity,
          height: 60.0,
          color: widget.isSelected ? Colors.black87 : Colors.white,
          child: Icon(
            widget.icon,
            color: widget.isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
