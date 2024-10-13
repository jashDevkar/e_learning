import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  String routeName;

  VideoScreen({required this.routeName});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late FlickManager _flickManager;
  late String videoPath;
  int _index=0;

  List<String> info = [
    'Adobe XD prototyping allows designers to create interactive, clickable prototypes for websites, mobile apps, or other digital interfaces. It enables users to link artboards, define transitions, and add animations to simulate user interactions, making it easier to visualize user flows and test designs before development. XD supports features like auto-animate for smooth transitions between states, voice triggers for hands-free interactions, and the ability to share prototypes with stakeholders for feedback. It\'s a powerful tool for creating dynamic prototypes that closely mimic the final product experience.',
    'UI/UX design is the process of creating visually appealing and user-friendly interfaces that enhance the overall user experience. **UI (User Interface)** design focuses on the look and feel of a product, ensuring it is aesthetically pleasing, consistent, and easy to navigate. This involves choosing appropriate color schemes, typography, layout, and interactive elements like buttons or icons. **UX (User Experience)** design, on the other hand, centers on how users interact with the product, aiming to make the experience as seamless, intuitive, and enjoyable as possible. It includes user research, wireframing, prototyping, and usability testing to ensure the design meets user needs and expectations, while also being efficient and accessible. The combination of both UI and UX creates a balanced product that is not only beautiful but also functional and user-centric.',
    'Sketch offers a range of shortcuts and tricks to speed up UI/UX design work. Key shortcuts include zooming with `Cmd` + `+/-`, grouping/ungrouping layers using `Cmd` + `G` or `Cmd` + `Shift` + `G`, and aligning objects with `Cmd` + `Option` + arrow keys. You can quickly duplicate layers with `Cmd` + `D` and lock/unlock them using `Cmd` + `L`. For panning, simply hold the `Spacebar`. These shortcuts, along with features like smart alignment and resizing, allow designers to streamline their workflow, making the design process faster and more efficient in Sketch.'
  ];

  String getVideoPath() {
    if (widget.routeName == 'Adobe') {
      videoPath = 'assets/videos/dummy1.mp4';
    } else if (widget.routeName == 'Sketch') {
      videoPath = 'assets/videos/dummy2.mp4';
      _index = 1;
    } else {
      videoPath = 'assets/videos/dummy3.mp4';
      _index = 2;
    }
    return videoPath;
  }

  @override
  void initState() {
    super.initState();
    _flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.asset(getVideoPath()));
  }

  @override
  void dispose() {
    _flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.routeName,
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.pinkAccent[200],
        ),
        body: Column(
          children: [
            SizedBox(
            width: double.infinity,
            height: 200.0,
            child: FlickVideoPlayer(flickManager: _flickManager),
          ),
            SizedBox(height: 20.0,),
            Text('Infomation about video',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
            Container(
              padding: EdgeInsets.all(10.0),
                child: Text(info[_index],style: TextStyle(),textAlign: TextAlign.justify,))
          ]
        ),
      ),
    );
  }
}
