import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Scaffold & Drawer Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "About")
        ],
      ),
      drawer: const NavigationDrawer(),
      /*
      Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.blue),
              child: Column(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    'https://demos.infosofttech.com/flutter/profile/salim/profile.png',
                    height: 100,
                    width: 100,
                  ),
                ),
                
              ]),
            ),
          ],
        ),
       
      ), */ // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context),
            buildMenuItems(context),
          ],
        )),
      );
}

Widget buildHeader(BuildContext context) => Material(
      color: Colors.blue.shade700,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          Navigator.of(context).push(
              MaterialPageRoute(builder: ((context) => const UserPage())));
        },
        child: Container(
          padding: EdgeInsets.only(
            top: 24 + MediaQuery.of(context).padding.top,
            bottom: 24.0,
          ),
          child: Column(
            children: const [
              CircleAvatar(
                radius: 72,
                backgroundImage: NetworkImage(
                    'https://demos.infosofttech.com/flutter/profile/salim/profile.png'),
              ),
              SizedBox(height: 10),
              Text(
                "Salim Shaikh",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
Widget buildMenuItems(BuildContext context) => Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 16,
        children: [
          ListTile(
            title: const Text("Home"),
            leading: const Icon(Icons.home),
            onTap: () {
              //Navigator.pop(context);

              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const MyHomePage(title: "Home")));
            },
          ),
          ListTile(
            title: const Text("Cart"),
            leading: const Icon(Icons.shopping_cart),
            onTap: () {},
          ),
          const Divider(
            color: Colors.black,
          ),
          ListTile(
            title: const Text("Account"),
            leading: const Icon(Icons.account_box),
            onTap: () {
              //Navigator.pop(context);

              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AcountPage()));
            },
          ),
          ListTile(
            title: const Text("Logout"),
            leading: const Icon(Icons.logout),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text("Close"),
            leading: const Icon(Icons.close),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Page"),
      ),
      body: Image.network(
          "https://demos.infosofttech.com/flutter/profile/salim/profile.png"),
    );
  }
}

class AcountPage extends StatelessWidget {
  const AcountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account"),
      ),
      drawer: const NavigationDrawer(),
    );
  }
}
