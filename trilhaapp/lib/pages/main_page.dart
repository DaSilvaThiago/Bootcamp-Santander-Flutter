import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/firstPage.dart';
import 'package:trilhaapp/pages/redistered_datas.dart';
import 'package:trilhaapp/pages/secondPage.dart';
import 'package:trilhaapp/pages/thirdPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller = PageController(initialPage: 0);
  int positionPage = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Main Page")),
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  child: Container(
                      padding:
                          const EdgeInsetsDirectional.symmetric(vertical: 5),
                      width: double.infinity,
                      child: const Text("Registered Datas")),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisteredPage()));
                  },
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  child: Container(
                      padding:
                          const EdgeInsetsDirectional.symmetric(vertical: 5),
                      width: double.infinity,
                      child: const Text("Use terms and privacity")),
                  onTap: () {},
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  child: Container(
                      padding:
                          const EdgeInsetsDirectional.symmetric(vertical: 5),
                      width: double.infinity,
                      child: const Text("Settings")),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                  controller: controller,
                  onPageChanged: (value) {
                    setState(() {
                      positionPage = value;
                    });
                  },
                  children: const [FirstPage(), SecondPage(), ThirdPage()]),
            ),
            BottomNavigationBar(
                onTap: (value) {
                  controller.jumpToPage(value);
                },
                currentIndex: positionPage,
                items: const [
                  BottomNavigationBarItem(
                      label: "Pag1", icon: Icon(Icons.home)),
                  BottomNavigationBarItem(label: "Pag2", icon: Icon(Icons.add)),
                  BottomNavigationBarItem(
                      label: "Pag3", icon: Icon(Icons.person))
                ])
          ],
        ),
      ),
    );
  }
}
