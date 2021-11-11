// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:video_player/video_player.dart';
import 'dart:math' as math;

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {

  final List<Map> tiktokItems = [
    {
      "video": "assets/videos/video-1.mp4"
    },
    {
      "video": "assets/videos/video-2.mp4"
    },
    {
      "video": "assets/videos/video-3.mp4"
    },
  ];


  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: double.infinity,
          scrollDirection: Axis.vertical,
          viewportFraction: 1.0,

      ),

      items: tiktokItems.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                    color: Color(0xFF141518),
                    child: Stack(
                      children: [Video(videoUrl: item['video']),
                        const PostContent()
                      ],
                ),
            );
          },
        );
      }).toList(),
    );
  }
}

class Video extends StatefulWidget {
  const Video({Key? key, required this.videoUrl}) : super(key: key);
  final String videoUrl;

  @override
  _VideoState createState() => _VideoState(this.videoUrl);
}

class _VideoState extends State<Video> {
  late VideoPlayerController _controller;
  final String videoUrl;
  _VideoState(this.videoUrl);


  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
        widget.videoUrl)
      ..initialize().then((_) {
        _controller.play();
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayer(_controller);
  }
}

class PostContent extends StatelessWidget {
  const PostContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          padding: EdgeInsets.only(top: 40),
          //color: Colors.blue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Abonnement',
              style: TextStyle(color: Colors.white54,
                  fontWeight: FontWeight.w600),
              ),
              SizedBox(width: 20),
              Text('Pour toi',
                style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),

            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(child: Container(
                //color: Colors.red.withOpacity(0.5),
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('@awakeita',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
                    const Text('tiktok .tiktoktiktok',
                      style: TextStyle(color: Colors.white54,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: const [
                        Icon(
                            Icons.music_note,
                            color: Colors.white,
                            size: 15,
                          ),
                         SizedBox(width: 10),
                          Text('tiktok .tiktoktiktok',
                        style: TextStyle(color: Colors.white),
                    ),
                  ],
                    )
                  ],
                ),
              ),
              ),
              SizedBox(
                width: 80,
                //color: Colors.green,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 80,
                      //color: Colors.blue,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                           Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: const CircleAvatar(
                              radius: 25,
                              backgroundImage:
                              AssetImage('assets/images/photo_1.jpg'),
                            ),
                          ),

                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 15,
                            ),
                          )

                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      //color: Colors.teal,
                      child: Column(
                        children: [
                          Icon(Icons.favorite, color: Colors.white.withOpacity(0.85),
                            size: 50,
                          ),
                          const Text('55.0k',
                            style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600,),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      //color: Colors.yellow,
                      child: Column(
                        children: [
                          Image.asset("assets/images/chat.png", height: 50, width: 50,),
                          const Text('210',
                            style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600,),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      //color: Colors.orange,
                      child: Column(
                        children: [
                        Image.asset("assets/images/partager.png", height: 50, width: 50,),
                      const Text('102',
                        style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600,),
                      ),
                      ],
                      ),
                    ),
                    const Animation()

                  ],
                ),
              ),
            ],
          )
        )
      ],
    );
  }
}

class Animation extends StatefulWidget {
  const Animation({Key? key}) : super(key: key);

  @override
  _AnimationState createState() => _AnimationState();
}

class _AnimationState extends State<Animation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 4));
    _controller.repeat();

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: _controller,
      builder: (_, child){
      return Transform.rotate(angle: _controller.value * 2 * math.pi,
      child: child,
      );
      },
      child: Container(
        height: 45,
        width: 45,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),
        image: const DecorationImage(
          image: AssetImage("assets/images/disc_icon.png"),
        )),
        child: Image.asset("assets/images/tiktok_icon.png"),
      ),
    );
  }
}


