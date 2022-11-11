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
<img src="https://github.com/UsamaYousaf/custom_sidemenu/blob/main/example/assets/samplegif.gif" alt="How example looks" width="300" height="540">

## Getting started
pub.dev
## Usage



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
For Contribution and issues: https://github.com/UsamaYousaf/custom_sidemenu
