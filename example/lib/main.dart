import 'package:custom_sidemenu/custom_sidemenu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
       
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  List<CustomMenuItem> menuItemsList=[
     CustomMenuItem(
                        callback: () {
                        
                        },
                        title: 'Home',
                        leadingIcon: Icons.home,
                          iconSize: 22,
       titleSize: 16,


                      ),


    CustomMenuItem(
                        callback: () {
                        
                        },
                        title: 'History',
                           leadingIcon: Icons.history,
                                 iconSize: 22,
      titleSize: 16,
                       
                      ),
    CustomMenuItem(
                        callback: () {
                        
                        },
                        title: 'Setting',
                          leadingIcon: Icons.settings,
                              iconSize: 22,
      titleSize: 16,
                      ),
    CustomMenuItem(
                        callback: () {
                        
                        },
                        title: 'profile',
                           leadingIcon: Icons.account_circle_outlined,
                            iconSize: 22,
      titleSize: 16,
                      ),
    CustomMenuItem(
                        callback: () {
                        
                        },
                        title: 'Help',
                         leadingIcon: Icons.help,
                            iconSize: 22,
      titleSize: 16,
                       
                      ),
    CustomMenuItem(
                        callback: () {
                        
                        },
                        title: 'Log Out',
                       leadingIcon: Icons.logout,
                            iconSize: 22,
                        titleSize: 16,
                       
                      ),
  ];

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      // appBar: AppBar(

      //   title: Text(widget.title),
      // ),
      body:CustomDrawer(homeWidget: Center(child:Text('Your Home Widget'),),
      menuItemsList: menuItemsList, appBarActions: [], appBarTitle: Text('Your Home Widget') , menuIcon: const Icon(Icons.menu),
      )
      
      );
 
  }
}
