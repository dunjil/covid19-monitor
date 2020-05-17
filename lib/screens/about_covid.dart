import '../utils/all_imports.dart';

class About extends StatefulWidget {
  static String id = '/about';
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff042A64),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff042A64),
        title: Text('About the virus',style: GoogleFonts.cabin(textStyle:TextStyle()),),
      ),
      body: ListView(

        children: <Widget>[
          Padding(
            padding:  EdgeInsets.all(14.0),
            child: Container(
                    child: Column(
                children: <Widget>[
                 Padding(
                   padding:  EdgeInsets.all(1.2 * SizeConfig.imageSizeMultiplier),
                   child: Text(Values().boutcovid1Header,style: TextStyle(fontSize: 3.6 * SizeConfig.textMultiplier, color: Colors.white, fontWeight: FontWeight.bold,fontFamily: 'Raleway'),textAlign: TextAlign.left,),
                 ),
                  Padding(
                    padding:  EdgeInsets.all(1.7 * SizeConfig.imageSizeMultiplier),
                    child: Text(Values().boutCovid1,
                      style: AppTheme.h3Style.copyWith(
                        fontSize: 2.7 * SizeConfig.textMultiplier, color: LightColor.whiteText, height: 1.3, ),
                      textAlign: TextAlign.left, ),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(2 * SizeConfig.imageSizeMultiplier),
                    child: Text(Values().boutcovid1Header2,style: TextStyle(fontSize: 3.6 * SizeConfig.textMultiplier, color:  Colors.white,fontWeight: FontWeight.bold,fontFamily: 'Raleway'),textAlign: TextAlign.left,),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(3.2 * SizeConfig.imageSizeMultiplier),
                    child: Text(Values().boutCovid2,
                      style: AppTheme.h3Style.copyWith(
                        fontSize: 2.7 * SizeConfig.textMultiplier, color: LightColor.whiteText, height: 1.3, ),
                      textAlign: TextAlign.left,),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


}
