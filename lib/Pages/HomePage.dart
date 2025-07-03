import 'package:flutter/material.dart';
import 'package:fluttermachinetest/Pages/Dashboard-Page.dart';
import 'package:fluttermachinetest/Services/Call-List-API-Service/Call-List-API.dart';
import 'package:fluttermachinetest/Utils/User-Preference-Data.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late YoutubePlayerController _controller;

  late String? name;

  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final videoUrl = 'https://www.youtube.com/watch?v=YMx8Bbev6T4';
    final videoId = YoutubePlayer.convertUrlToId(videoUrl)!;

    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        controlsVisibleAtStart: true,
      ),
    );

    getName();
  }

  void getName() async{
    String? fetchedName = await UserPreferencesData.getName();
    setState(() {
      name = fetchedName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 15),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blue[700],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(Icons.person, color: Colors.white, size: 50),

                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                       name ?? "User",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Calley Personal',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                ),
              ),
            ),

            Spacer(),
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.green),
                  ),
                  child: Icon(Icons.call, color: Colors.green),
                ),

                SizedBox(width: 10),
                Expanded(
                  child: InkWell(
                    onTap:_isLoading ? null : () async{

                      final userId = await UserPreferencesData.getUserId();

                      setState(() {
                        _isLoading = true;
                      });
                      final status = await CallListAPI.callList();

                      if(status['clientId'] == userId) {
                        final callId = status['_id'];
                        await UserPreferencesData.saveCallId(callId);

                        // print(userId);
                        // print(callId);
                        setState(() {
                          _isLoading = false;
                        });
                        if (context.mounted) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Dashboardpage(callId: callId),
                            ),
                          );
                        }
                      }

                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue[700],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: _isLoading ? CircularProgressIndicator() : Text(
                          'Start Calling Now',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
