import 'package:aht_dimigo/themes/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:aht_dimigo/screens/home_screen.dart';
import 'package:aht_dimigo/screens/menu_screen.dart';
import 'package:aht_dimigo/screens/screen1.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

/*void navigateToInitPINScreen() {
  Get.to(() => const InitPINScreen());
}*/

/*void navigateToChangePINScreen() {
  Get.to(() => const ChangePINScreen());
}*/

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  String? PIN;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      initialIndex: 1,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double screenHeight = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF6B19DC),
        ),
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: TabBarView(
            controller: _tabController,
            children: const [
              Screen1(),
              HomeScreen(),
              MenuScreen(),
            ],
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      bottomNavigationBar: SizedBox(
        height: 0,
        child: Padding(
          padding: EdgeInsets.only(
              left: screenWidth / 390 * 0,
              right: screenWidth / 390 * 0,
              top: screenHeight / 844 * 2),
          child: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(
                icon: Icon(
                  Icons.search,
                  size: 32,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.home_outlined,
                  size: 32,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.menu_sharp,
                  size: 32,
                ),
              ),
            ],
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: AhtColors.Main_Color,
            indicatorWeight: 4,
            labelColor: AhtColors.Main_Color,
            unselectedLabelColor: const Color.fromARGB(255, 142, 142, 142),
          ),
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}