import '../utils/all_imports.dart';

class Protection extends StatefulWidget {
  static String id = '/protection';
  @override
  _ProtectionState createState() => _ProtectionState();
}

class _ProtectionState extends State<Protection> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff042A64),
      appBar: AppBar(
        elevation: 0,
        title: Text('How to Protect Yourself',
          style: GoogleFonts.cabin(textStyle: TextStyle(),)),
        backgroundColor: Color(0xff042A64),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                CircleAvatar(
                    radius: 16.0 * SizeConfig.imageSizeMultiplier,
                    child: Image.asset(
                      ProtectionBank().protectionBank[index].image,
                      scale:1.0,
                    )),
                Padding(
                  padding: EdgeInsets.all( 2.0 * SizeConfig.imageSizeMultiplier,),
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(2.0 * SizeConfig.imageSizeMultiplier),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Text(
                              '${ProtectionBank().protectionBank[index].title}',
                              style:AppTheme.h1Style.copyWith(
                                  fontSize: 3.6 * SizeConfig.textMultiplier, color: LightColor.whiteText, height: 1.2 ),
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    _decreaseIndex();
                                  },
                                ),
                                Container(
                                  child: Center(
                                    child: Text(
                                      '${index + 1}/${ProtectionBank().protectionBank.length}',
                                      style:AppTheme.h3Style.copyWith(
                                          fontSize: 2.5 * SizeConfig.textMultiplier, color: LightColor.whiteText, height: 1.2 ),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    _increaseIndex();
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 2.5 * SizeConfig.heightMultiplier,
                          ),
                          Container(
                            child: Text(
                              '${ProtectionBank().protectionBank[index].body}',
                              style: AppTheme.h3Style.copyWith(
                                fontSize: 2.7 * SizeConfig.textMultiplier, color: LightColor.whiteText, height: 1.3, ), textAlign: TextAlign.left,
                            ),
                          ),
                          SizedBox(
                            height: 0.5 * SizeConfig.heightMultiplier,
                          ),

                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _increaseIndex() {
    setState(() {
      if (index >= 0 && index <=ProtectionBank().protectionBank.length-2) {
        index = index + 1;
      }
    });
  }

  void _decreaseIndex() {
    setState(() {
      if (index >= 1 && index <= ProtectionBank().protectionBank.length-1) {
        index = index - 1;
      }
    });
  }
}
