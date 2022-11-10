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
  
  List<Menuitem> menuItemsList=[
     Menuitem(
                        callback: () {
                        
                        },
                        title: 'Home',
                        leadingIcon: Icons.home,
                
                      ),


                         Menuitem(
                        callback: () {
                        
                        },
                        title: 'History',
                           leadingIcon: Icons.history,
                       
                      ),
                        Menuitem(
                        callback: () {
                        
                        },
                        title: 'Alarm',
                          leadingIcon: Icons.access_alarm,
                       
                      ),
                         Menuitem(
                        callback: () {
                        
                        },
                        title: '',
                           leadingIcon: Icons.history,
                       
                      ),
                       Menuitem(
                        callback: () {
                        
                        },
                        title: 'History',
                         leadingIcon: Icons.history,
                       
                      ),
                     Menuitem(
                        callback: () {
                        
                        },
                        title: 'History',
                       leadingIcon: Icons.history,
                       
                      ),
                       Menuitem(
                        callback: () {
                        
                        },
                        title: 'History',
                         leadingIcon: Icons.history,
                       
                      ),
  ];

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      // appBar: AppBar(

      //   title: Text(widget.title),
      // ),
      body:CustomDrawer(homeWidget:  const Scaffold(
        body: Center(child:Text('Your Home Widget'),)),
      menuItemsList: menuItemsList, appBarActions: [], appBarTitle:Text('Your Home Widget') , menuIcon: Icon(Icons.menu),
      )
      
      );
 
  }
}
