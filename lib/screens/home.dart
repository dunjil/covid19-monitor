import '../utils/all_imports.dart';

class Home extends StatefulWidget {
  static String id='/';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  String videoUrl="https://www.youtube.com/watch?v=mOV1aBVYKGA";
  YoutubePlayerController _controller;
  String videoThumbnail="http://i3.ytimg.com/vi/mOV1aBVYKGA/hqdefault.jpg";

  @override
  void initState(){
    _controller=YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoUrl),
    );
  }

  @override 
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(context).wp;
    final Function hp = Screen(context).hp;
    return Scaffold(
      appBar: AppBar(title: Text('Covid19 Monitor', style: GoogleFonts.cabin(textStyle:TextStyle())),
        elevation: 0.0,
        backgroundColor: Color(0xff042A64),),
      backgroundColor: Color(0xff042A64),
      body: ListView (
        padding: EdgeInsets.all(3.0 * SizeConfig.imageSizeMultiplier),
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom:hp(2)),
             child: YoutubePlayer(
              progressIndicatorColor: Colors.red,
              controller: _controller,
              showVideoProgressIndicator: true,
              bottomActions: [
                CurrentPosition(),
                ProgressBar(isExpanded: true),
              ],
              thumbnailUrl: videoThumbnail,
              onReady: (){
                _controller.play();
              },
            ),
          ),
         Padding(
           padding: EdgeInsets.only(left:wp(2.0),right: wp(2.0)),
           child: Column(
             children: <Widget>[
               Row(
                 children: <Widget>[
                   GestureDetector(child: HomeCard(icon: LineIcons.share_alt, iconColor: CardColors.blue, subTitle: 'Learn about the virus ', title: 'About covid19',)
                     , onTap: (){
                       _controller.pause();
                       Navigator.pushNamed(context, About.id);
                     },
                   ),
                   SizedBox(width: wp(10.0)),
                   GestureDetector(child: HomeCard(icon: LineIcons.medkit, iconColor:CardColors.green, subTitle: 'How to Protect yourself', title: 'Protect yourself',),
                       onTap:(){
                         _controller.pause();
                         Navigator.pushNamed(context, Protection.id);
                       }
                   ),
                 ],
               ),
               SizedBox(height: hp(2.5)),
               Row(children: <Widget>[
                 GestureDetector(child: HomeCard(icon: LineIcons.warning, iconColor: CardColors.cyan, subTitle: 'Learn Covid-19 symptoms', title: 'Symptoms',)  , onTap: (){
                   _controller.pause();
                   Navigator.pushNamed(context, SignsAndSymptoms.id);
                 },),

                 SizedBox(width: wp(10.0)),
                 GestureDetector(child: HomeCard(icon: LineIcons.question_circle, iconColor:CardColors.green, subTitle: 'What to do if you are infected', title: 'What to do',),
                     onTap:(){
                       _controller.pause();
                       Navigator.pushNamed(context, MeasuresPage.id);
                     }
                 ),
               ],),
               SizedBox(height: hp(2.5)),
               Row(
                 children: <Widget>[
                   GestureDetector(child: HomeCard(icon: LineIcons.bar_chart, iconColor:CardColors.red, subTitle: 'See Global data', title: 'Global Statistics',)
                       ,onTap:(){
                         _controller.pause();
                         Navigator.pushNamed(context, Dashboard.id);
                       }
                   ),
                   SizedBox(width: wp(10.0)),
                   GestureDetector(child: HomeCard(icon: LineIcons.hospital_o, iconColor:CardColors.blue, subTitle: 'Self Diagnosis', title: 'Check yourself',),
                     onTap: (){
                       _controller.pause();
                       Navigator.pushNamed(context, Diagnosis.id);
                     },
                   ),

                 ],
               ),
             ],
           ),
         ),
          SizedBox(height: hp(10.0)),
        ],
      ),
    );
  }
}
