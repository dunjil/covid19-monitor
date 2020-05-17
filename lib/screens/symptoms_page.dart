import '../utils/all_imports.dart';

class SignsAndSymptoms extends StatefulWidget {
  static String id = '/symptoms';
  @override
  _SignsAndSymptomsState createState() => _SignsAndSymptomsState();
}

class _SignsAndSymptomsState extends State<SignsAndSymptoms> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff042A64),
      appBar: AppBar(
        elevation: 0,
        title: Text('Symptoms'),
        backgroundColor: Color(0xff042A64),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Padding(
              padding:  EdgeInsets.only(top: 2.6 * SizeConfig.imageSizeMultiplier),
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                      radius: 18.0 * SizeConfig.imageSizeMultiplier,
                      backgroundColor: Color(0xff042A64) ,
                      backgroundImage: AssetImage(
                        SymptomsBank().symptomsBank[index].image,
                      )),
                  Padding(
                    padding: EdgeInsets.all(1.6 * SizeConfig.imageSizeMultiplier),
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.all(1.6 * SizeConfig.imageSizeMultiplier),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Text(
                                '${SymptomsBank().symptomsBank[index].symptom}',
                                style: AppTheme.h1Style.copyWith(color: LightColor.whiteText, fontWeight: FontWeight.bold, fontSize: 3.6 * SizeConfig.textMultiplier),
                              ),
                            ),
                            SizedBox(
                              height: 0.5 * SizeConfig.heightMultiplier,
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
                                        '${index + 1}/${SymptomsBank().symptomsBank.length}',
                                        style: AppTheme.h3Style.copyWith(
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
                              height: 0.5 * SizeConfig.heightMultiplier,
                            ),
                            Container(
                              child: Text(
                                '${SymptomsBank().symptomsBank[index].body}',
                                style: AppTheme.h3Style.copyWith(
                                  fontSize: 2.7 * SizeConfig.textMultiplier, color: LightColor.whiteText, height: 1.3, ),textAlign: TextAlign.left,
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
          ),
        ],
      ),
    );
  }

  void _increaseIndex() {
    setState(() {
      if (index >= 0 && index <=SymptomsBank().symptomsBank.length-2) {
        index = index + 1;
      }
    });
  }

  void _decreaseIndex() {
    setState(() {
      if (index >= 1 && index <=SymptomsBank().symptomsBank.length-1) {
        index = index - 1;
      }
    });
  }
}
