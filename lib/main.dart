import 'package:flutter/cupertino.dart';

// //=> Cupertino
// void main() {
//   runApp(AdaptivePage());
// }
//
// class AdaptivePage extends StatefulWidget {
//   @override
//   _AdaptivePageState createState() => _AdaptivePageState();
// }
//
// class _AdaptivePageState extends State<AdaptivePage> {
//   bool _isSelected = true;
//   double _sliderValue = 75;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Adaptive Widget'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Switch.adaptive(
//               value: _isSelected,
//               onChanged: (value) {
//                 setState(() {
//                   _isSelected = value;
//                 });
//               },
//             ),
//             Slider.adaptive(
//               value: _sliderValue,
//               min: 0,
//               max: 100,
//               onChanged: (value) {
//                 setState(() {
//                   _sliderValue = value;
//                 });
//               },
//             ),
//             defaultTargetPlatform == TargetPlatform.iOS ? Text('iOS') : Text('Android')
//           ],
//         ),
//       ),
//     );
//   }
// }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.systemOrange,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.news),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search)
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings)
          )
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return const FeedsPage();
          case 1:
            return const SearchPage();
          case 2:
            return const SettingsPage();
          default:
            return const Center(
              child: Text('Page not found!'),
            );
        }
      },
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Seach Page'),
      ),
      child: Center(
        child: Text(
          'Search Page',
          style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
        ),
      ),
    );
  }
}

class FeedsPage extends StatelessWidget {
  const FeedsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
          middle: Text('Feeds Page')
      ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Feeds Page',
                style:
                CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
              ),
              const SizedBox(height: 8),
              CupertinoButton.filled(
                child: const Text('Select Category'),
                onPressed: (){
                  showCupertinoModalPopup(
                      context: context,
                      builder: (context){
                        return CupertinoActionSheet(
                          title: const Text('Select Category'),
                          actions: [
                            CupertinoActionSheetAction(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => const CategoryPage(
                                        selectedCategory: 'Technology'),
                                  ),
                                );
                              },
                              child: const Text('Technology'),
                            ),
                            CupertinoActionSheetAction(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => const CategoryPage(
                                        selectedCategory: 'Business'),
                                  ),
                                );
                              },
                              child: const Text('Business'),
                            ),
                            CupertinoActionSheetAction(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) =>
                                        const CategoryPage(selectedCategory: 'Sport'),
                                  ),
                                );
                              },
                              child: const Text('Sport'),
                            ),
                          ],
                          cancelButton: CupertinoActionSheetAction(
                            child: const Text('Close'),
                            onPressed: () => Navigator.pop(context),
                          ),
                        );
                      });
                },
              )
            ],
          ),
        )
    );
  }
}

class CategoryPage extends StatelessWidget {
  final String selectedCategory;

  const CategoryPage({Key? key, required this.selectedCategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('$selectedCategory Page'),
      ),
      child: Center(
        child: Text(
          '$selectedCategory Page',
          style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget{
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Settings Page'),
      ),
      child: Center(
        child: CupertinoButton(
          child: const Text('Log out'),
          onPressed: () {
            showCupertinoDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: const Text('Are you sure to log out?'),
                  actions: [
                    CupertinoDialogAction(
                      child: const Text('No'),
                      onPressed: () => Navigator.pop(context),
                    ),
                    CupertinoDialogAction(
                      child: const Text('Yes'),
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                );
              }
            );
          },
        ),
      ),
    );
  }
}

















