part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<Product> listCart = [];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int bottomNavbarIndex = 0;
    PageController pageController =
        PageController(initialPage: bottomNavbarIndex);
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (value) {
          bottomNavbarIndex = value;
          setState(() {});
        },
        children: const [
          ProductPage(),
          CartPage(),
          MyTransaction(),
          AccountPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Product',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'My Transaction',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        currentIndex: bottomNavbarIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (value) {
          setState(() {
            pageController.jumpToPage(value);
            bottomNavbarIndex = value;
          });
        },
      ),
    );
  }
}
