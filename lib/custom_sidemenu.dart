library custom_sidemenu;

import 'dart:io';

import 'package:flutter/material.dart';



class CustomDrawer extends StatefulWidget {
 const CustomDrawer({Key? key, required this.menuItemsList, required this.homeWidget, required this.appBarTitle, required this.appBarActions, required this.menuIcon}) : super(key: key);
   final List<Menuitem> menuItemsList;
   final Widget appBarTitle;
  final List<Widget> appBarActions;
   final Widget homeWidget,menuIcon;
  

  @override
  CustomDrawerState createState() => CustomDrawerState();
}

class CustomDrawerState extends State<CustomDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  bool visible = false;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 250));
  }



  
  
  @override
  Widget build(BuildContext context) {

    Widget _buildDrawer() =>  Drawer(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 28, 92, 146),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              height: 800,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: ListView.builder(itemBuilder:(context, index) => widget.menuItemsList[index],itemCount: widget.menuItemsList.length,)
            ),
          ),
        

    );

    Widget _buildHome(Widget homeWidget) =>  Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.black45.withOpacity(0.25),
              spreadRadius: 10,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ], borderRadius: BorderRadius.circular(25)),
          child: HomeWidget(title: widget.appBarTitle, appBarActions: widget.appBarActions, menuIcon: widget.menuIcon,callBack: toggleAnimation, child: homeWidget,)
        

          
    );
    return   AnimatedBuilder(
            animation: animationController,
            builder: (context, _) {

              double slide =  200.0 * animationController.value;
              double scale = 1 - (animationController.value * 0.15);
              return Stack(
                children: [

                  _buildDrawer(),
                  Transform(
                      transform: Matrix4.identity()
                        ..translate(slide)
                        ..scale(scale),
                      alignment: Alignment.center,
                      child: GestureDetector(
                        child: _buildHome(widget.homeWidget),
                        onTap: () {
                          //  animationController.reverse();
                        },
                        onPanUpdate: (details) {
                          // if (details.delta.dx < 0) {
                          //   animationController.reverse();
                          // }
                        },
                      )),
                ],
              );
            })
    ;
  
  }

  void toggleAnimation() {
    animationController.isDismissed
        ? animationController.forward()
        : animationController.reverse();
  }
}

class Menuitem extends StatelessWidget {
  const Menuitem({
    Key? key,
    required this.title,
    required this.callback,
    required this.iconData, 

  }) : super(key: key);
  final String title;
  final VoidCallback callback;
  final IconData iconData;
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        callback();
      },
      child: Row(
 
        children: [
          Padding(
            padding:  EdgeInsets.only(right: 8,),
            child: Icon(
              iconData,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 60, //color: Colors.white,
            child: Text(
              title,
              overflow: TextOverflow.clip,
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  ?.copyWith(color: Colors.white, fontSize:10),
            ),
          )
        ],
      ),
    );
  }
}
class HomeWidget extends StatelessWidget {
 const HomeWidget({Key? key, required this.title,required this.child, required this.appBarActions, required this.menuIcon,  required this.callBack}) : super(key: key);
  final Widget title;
 
   final Widget child;
   final List<Widget> appBarActions;
  final Widget menuIcon;
  final VoidCallback callBack;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      appBar: AppBarWidget(title:title , menuIcon:InkWell(onTap: callBack,child:menuIcon ,
      ), actions:appBarActions ,),

      body: child,
    
  );
  }
}


class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  AppBarWidget({
    Key? key,
    required this.title,
    required this.menuIcon,
    this.orientation, required this.actions,

    // ignore: non_constant_identifier_names
  }) : super(key: key);

  final Widget title;
  final Widget menuIcon;
  final List<Widget> actions;
  
  Orientation? orientation;

  @override
  Widget build(BuildContext context) {
    return AppBar(

        leading: menuIcon,
        title: title,
         actions: actions,
        backgroundColor: const Color.fromARGB(255, 28, 92, 146));

  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
