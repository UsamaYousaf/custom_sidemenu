library custom_sidemenu;

import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  CustomDrawer(
      {Key? key,
      required this.menuItemsList,
      required this.homeWidget,
      required this.appBarTitle,
      required this.appBarActions,
      required this.menuIcon,
      this.elevation,
      this.padding,
      this.background})
      : super(key: key);

  /// menu item list
  List<CustomMenuItem> menuItemsList;

  /// title of appbar
  Widget appBarTitle;

  /// Actions of appbar
  List<Widget> appBarActions;

  /// home page widget,
  Widget homeWidget, menuIcon;

  /// elevation
  double? elevation;

  /// padding for list items
  EdgeInsets? padding;

  /// background color

  Color? background;

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
    Widget _buildDrawer() => Drawer(
          elevation: widget.elevation,
          backgroundColor:
              widget.background ?? const Color.fromARGB(255, 28, 92, 146),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
                height: MediaQuery.of(context).size.height,
                padding:
                    widget.padding ?? const EdgeInsets.fromLTRB(30, 90, 90, 0),
                child: ListView.builder(
                  itemBuilder: (context, index) => widget.menuItemsList[index],
                  itemCount: widget.menuItemsList.length,
                )),
          ),
        );

    Widget _buildHome(Widget homeWidget) => Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black45.withOpacity(0.25),
            spreadRadius: 10,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ], borderRadius: BorderRadius.circular(25)),
        child: HomeWidget(
          title: widget.appBarTitle,
          appBarActions: widget.appBarActions,
          menuIcon: widget.menuIcon,
          callBack: toggleAnimation,
          child: homeWidget,
        ));
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, _) {
          double slide = 200.0 * animationController.value;
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
        });
  }

  void toggleAnimation() {
    animationController.isDismissed
        ? animationController.forward()
        : animationController.reverse();
  }
}

class CustomMenuItem extends StatelessWidget {
  const CustomMenuItem({
    Key? key,
    required this.title,
    required this.callback,
    this.leadingIcon,
    this.iconColor,
    this.iconSize,
    this.titleSize,
    this.titleColor,
    this.overflow,
    this.trailingIcon,
    this.contentPadding,
  }) : super(key: key);

  /// menu item title

  final String title;

  /// menu item callback

  final VoidCallback callback;

  /// leading icon

  final IconData? leadingIcon;

  /// tailing icon

  final IconData? trailingIcon;

  /// color of icon default icon color is white
  final Color? iconColor;

  /// icon size default size is 16
  final double? iconSize;

  /// size of title
  final double? titleSize;

  /// color of tittle
  final Color? titleColor;

  /// title overflow default Clip used

  final TextOverflow? overflow;

  /// content padding if  null,EdgeInsets.symmetric(horizontal:16) used
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: callback,
      trailing: Icon(
        trailingIcon,
        color: iconColor ?? Colors.white,
        size: iconSize ?? 20,
      ),
      leading: Icon(
        leadingIcon,
        color: iconColor ?? Colors.white,
        size: iconSize ?? 20,
      ),
      title: Text(
        title,
        overflow: overflow ?? TextOverflow.clip,
        style: Theme.of(context).textTheme.headline2?.copyWith(
            color: titleColor ?? Colors.white, fontSize: titleSize ?? 10),
      ),
      contentPadding: contentPadding,
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget(
      {Key? key,
      required this.title,
      required this.child,
      required this.appBarActions,
      required this.menuIcon,
      required this.callBack})
      : super(key: key);
  final Widget title;

  final Widget child;
  final List<Widget> appBarActions;
  final Widget menuIcon;
  final VoidCallback callBack;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: title,
        menuIcon: InkWell(
          onTap: callBack,
          child: menuIcon,
        ),
        actions: appBarActions,
      ),
      body: child,
    );
  }
}

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  AppBarWidget({
    Key? key,
    required this.title,
    required this.menuIcon,
    this.orientation,
    required this.actions,

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
