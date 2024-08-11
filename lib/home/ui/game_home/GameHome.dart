import 'package:animatedapp/home/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';

import '../../utils/images/assets.dart';
import 'GameScreenTwo.dart';

class GameHome extends StatefulWidget {
  const GameHome({super.key});

  @override
  State<GameHome> createState() => _GameHomeState();
}

class _GameHomeState extends State<GameHome> {
  Set<int> selectedItems = {}; // Track selected items

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    super.initState();
  }

  var items = [1, 2, 3, 4, 5, 6];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: green,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 400,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: containermilk,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Look for Something ',
                        style: TextStyle(
                          fontSize: 26.0,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: 'Cold, Sweet ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'and that makes you ',
                          ),
                          TextSpan(
                            text: 'happy',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0, left: 15, right: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: items.map((item) => itemSelected(item)).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget itemSelected(int itemId) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (selectedItems.contains(itemId)) {
            selectedItems.remove(itemId); // Deselect if already selected
          } else {
            selectedItems.add(itemId); // Select item
          }

          if (selectedItems.length == 1) {
            if (selectedItems.contains(3)
            ) {

              Get.to(()=>ScreenTwo());
            } else {
              _showResultDialog(context, "INCORRECT", "Try again");
              print("INCORRECT");
            }

            selectedItems.clear();
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: containermilk.withOpacity(
                    selectedItems.contains(itemId) ? 0.5 : 1.0),
              ),
              height: 100,
              width: 100,
              child: Image.asset(getImageForItem(itemId)),
            ),
            if (selectedItems.contains(itemId))
              Positioned(
                top: 10,
                right: 10,
                child: Icon(
                  Icons.check_circle,
                  color: Colors.green,
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _showResultDialog(BuildContext context, String title, String buttonText) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),

          actions: [
            Container(
              height: 40,
              width: 100,
              color: Colors.black,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(buttonText),
              ),
            ),
          ],
        );
      },
    );
  }

  // Map itemId to image assets
  String getImageForItem(int itemId) {
    switch (itemId) {
      case 1:
        return beans;
      case 2:
        return drum;
      case 3:
        return icecream;
      case 4:
        return mango;
      case 5:
        return lion;
      case 6:
        return sun;
      default:
        return '';
    }
  }
}
