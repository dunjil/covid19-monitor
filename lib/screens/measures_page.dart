import '../utils/all_imports.dart';

class MeasuresPage extends StatefulWidget {
  static String id = '/measures';
  @override
  _MeasuresState createState() => _MeasuresState();
}

class _MeasuresState extends State<MeasuresPage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff042A64),
      appBar: AppBar(
        elevation: 0,
        title: Text('What to do if Infected', style: GoogleFonts.cabin(textStyle:TextStyle()),),
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
                      MeasuresBank().measuresBank[index].image,
                      scale:1.0,
                    )),
                Padding(
                  padding: EdgeInsets.all(2 * SizeConfig.imageSizeMultiplier),
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(2 * SizeConfig.imageSizeMultiplier),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Text(
                              '${MeasuresBank().measuresBank[index].title}',
                              style: AppTheme.h1Style.copyWith(
                                  fontSize: 3.6 * SizeConfig.textMultiplier, color: LightColor.whiteText, height: 1.2 ),textAlign:TextAlign.left
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
                                    size: 3 * SizeConfig.textMultiplier,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    _decreaseIndex();
                                  },
                                ),
                                Container(
                                  child: Center(
                                    child: Text(
                                      '${index + 1}/${MeasuresBank().measuresBank.length}',
                                      style: AppTheme.h3Style.copyWith(
                                          fontSize: 2.5 * SizeConfig.textMultiplier, color: LightColor.whiteText, height: 1.2 ),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    size:  3 * SizeConfig.textMultiplier,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    _increaseIndex();
                                  },
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Text(
                              '${MeasuresBank().measuresBank[index].body}',
                              style: AppTheme.h3Style.copyWith(
                                  fontSize: 2.7 * SizeConfig.textMultiplier, color: LightColor.whiteText, height: 1.3, ),textAlign:TextAlign.left,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
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
      if (index >= 0 && index <=MeasuresBank().measuresBank.length-2) {
        index = index + 1;
      }
    });
  }

  void _decreaseIndex() {
    setState(() {
      if (index >= 1 && index <=MeasuresBank().measuresBank.length-1) {
        index = index - 1;
      }
    });
  }
}
