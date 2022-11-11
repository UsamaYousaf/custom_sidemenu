<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

Package for using custom sidebar in flutter as an parent root widget.

## Features

- Custom Sidebar with animation
- Custom Appbar
- Parent widget to cover it all

## Screenshots
<img src="https://github.com/UsamaYousaf/UsamaYousafgithub.io/blob/main/assets/assets/photos/samplegif.gif" alt="How example looks" width="300" height="540">

## Getting started
pub.dev
## Usage
Create the List of MenuItems and add the MenuItem which you wish to add in your drawer using this widget

```dart
 List<CustomMenuItem> menuItemsList=[
     CustomMenuItem(
                        callback: () {
                        //Callback function to route to page on Click
                        },
                        title: 'Home',
                        leadingIcon: Icons.home,
                          iconSize: 22,
       titleSize: 16,


                      ),
    CustomMenuItem(
                        callback: () {
                        //Callback function to route to page on Click
                        },
                        title: 'History',
                           leadingIcon: Icons.history,
                                 iconSize: 22,
      titleSize: 16,
                       
                      ),
                      ];

                     

```

Add the List of menuItems in CustomDrawer widget with other customised details .
see example for further information

```dart
Scaffold(
      // appBar: AppBar(

      //   title: Text(widget.title),
      // ),
      body:CustomDrawer(homeWidget: Center(child:Text('Your Home Widget'),),
      menuItemsList: menuItemsList, appBarActions: [], appBarTitle: Text('Your Home Widget') , menuIcon: const Icon(Icons.menu),
      )
      
      );
```


## Additional information
For contribution and issues: https://github.com/UsamaYousaf/custom_sidemenu
