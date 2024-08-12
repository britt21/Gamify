import 'package:animatedapp/home/ui/game_home/GameHome.dart';
import 'package:animatedapp/home/utils/images/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  bool _showControls = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/video/sceneone.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _isPlaying = true;
      });

    _controller.addListener(() {
      if (_isPlaying && _controller.value.position >= _controller.value.duration) {
        Get.to(() => GameHome());
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller.pause();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        _isPlaying = false;
      } else {
        _controller.play();
        _isPlaying = true;
      }
      _showControls = true;
    });

    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _showControls = false;
      });
    });
  }

  void _onSliderChanged(double value) {
    final duration = _controller.value.duration;
    final position = duration * value;
    _controller.seekTo(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: _togglePlayPause,
        child: Stack(
          children: [
            GestureDetector(
              onTap: _togglePlayPause,
              child: Center(
                child: _controller.value.isInitialized
                    ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0.0, right: 0),
                    child: VideoPlayer(_controller),
                  ),
                )
                    : Container(),

              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Container(
                  height: 50,
                  width: 100,
                  child: GestureDetector(onTap: (){
                    Navigator.pop(context);
                  },
                      child: Image.asset(arrow)),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 18.0, right: 20),
                child: Container(
                  height: 50,
                  width: 100,
                  child: GestureDetector(
                      onTap: (){
                        Get.to(() => GameHome());
                        _controller.pause();


                      },
                      child: Image.asset(skip)),
                ),
              ),
            ),
            if (_showControls)
              Center(
                child: Icon(
                  _isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                  size: 100,
                ),
              ),
            Positioned(
              bottom: 30,
              left: 30,
              right: 30,
              child: VideoProgressIndicator(
                _controller,
                allowScrubbing: true,
                padding: EdgeInsets.all(8.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
