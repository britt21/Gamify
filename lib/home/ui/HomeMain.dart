import 'package:animatedapp/home/ui/game_home/GameHome.dart';
import 'package:animatedapp/home/ui/scene/start_video.dart';
import 'package:animatedapp/home/utils/images/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';

class HomeOne extends StatefulWidget {

  const HomeOne({super.key});

  @override
  State<HomeOne> createState() => _HomeOneState();
}

class _HomeOneState extends State<HomeOne> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              startscreen,
              fit: BoxFit
                  .cover, // This will make the image cover the entire screen
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => VideoPlayerScreen());
                },
                child: Container(height: 70,
                  width: 120,
                  child: Image.asset(
                    playbtn,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
