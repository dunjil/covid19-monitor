import '../utils/all_imports.dart';
import '../models/diagnostic.dart';

class Diagnosis extends StatefulWidget {
  static String id = '/diagnosis';
  @override
  _DiagnosisState createState() => _DiagnosisState();
}

class _DiagnosisState extends State<Diagnosis> {
  int index = 0;
  List<List<Diagnostic>> questionBank=[DiagnosticBank().diagnosticBank1,DiagnosticBank().diagnosticBank2,DiagnosticBank().diagnosticBank3,DiagnosticBank().diagnosticBank4,DiagnosticBank().diagnosticBank5,DiagnosticBank().diagnosticBank6,DiagnosticBank().diagnosticBank7,];
  List<List<Diagnostic>> replyBank=[DiagnosticBank().diagnosticNegativeAnswer,DiagnosticBank().diagnosticPositiveAnswer,];
  bool positiveAns = false;
  bool negativeAns = false;
  List<List<Diagnostic>> selectedBank;
  int negativeCount=0;
  int score=0;

  @override
  Widget build(BuildContext context) {
    selectedBank=questionBank;
    return Scaffold(
      backgroundColor: Color(0xff042A64),
      appBar: AppBar(
        elevation: 0,
        title: Text('Self Diagnosis', style: GoogleFonts.cabin(textStyle: TextStyle()),),
        backgroundColor: Color(0xff042A64),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                CircleAvatar(
                    radius: 4 * SizeConfig.heightMultiplier * SizeConfig.imageSizeMultiplier,
                    child: Image.asset(
                      MeasuresBank().measuresBank[1].image,
                      scale:1.0,
                    )),
                Padding(
                  padding: EdgeInsets.all( 2.0 * SizeConfig.heightMultiplier),
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(2.0 * SizeConfig.heightMultiplier),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child:optionResponse().length>2? Text(
                                'Click Yes or No:',
                                style:AppTheme.h3Style.copyWith(
                                  fontSize: 3.3 * SizeConfig.textMultiplier, color: LightColor.whiteText, height: 1.3, ),textAlign:TextAlign.left
                            ):SizedBox(),
                          ),
                          Container(
                            child:positiveAns? Text(
                                "You've ${(score/100)* 100 }% chances of having the virus:",
                                style:AppTheme.h3Style.copyWith(
                                  fontSize: 3.3 * SizeConfig.textMultiplier, color: LightColor.whiteText, height: 1.3, ),textAlign:TextAlign.left
                            ):SizedBox(),
                          ),
                          Container(
                            child:negativeAns? Text(
                                "You've just ${(score/100)* 100 }% chances of having the virus:",
                                style:AppTheme.h3Style.copyWith(
                                  fontSize: 3.3 * SizeConfig.textMultiplier, color: LightColor.whiteText, height: 1.3, ),textAlign:TextAlign.left
                            ):SizedBox(),
                          ),
                          SizedBox(
                            height: 2.0 * SizeConfig.heightMultiplier,
                          ),
                          Container(
                            child: buildQuestions(context, optionResponse()[index]),
                          ),
                          SizedBox(
                            height: 1.2 * SizeConfig.heightMultiplier,
                          ),
                          Container(
                            child: optionResponse().length>2? Column(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.green//Color(0xffEF0101)//Colors.white

                                  ),
                                  child: MaterialButton(
                                    child: Center(
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(child: Icon(Icons.check, color: Colors.white, size: 5.31 * SizeConfig.textMultiplier,),flex: 1,),
                                          Expanded(child:Text("Yes",style: TextStyle(fontSize: 2.5*SizeConfig.textMultiplier, color: Colors.white, fontWeight: FontWeight.bold),textAlign: TextAlign.left,),flex:1),
                                        ],
                                      ),
                                    ),
                                    onPressed: (){
                                      List<Diagnostic> item =questionBank[index];
                                      setState(() {
                                        score=score + item[0].valAmount;
                                        if(index == questionBank.length -1 && score >50 ) {
                                          positiveAns = true;
                                        }
                                      });
                                      print(score);
                                      _increaseIndex();


                                    },
                                  ),
                                ),
                                       SizedBox(height: 1.8 * SizeConfig.heightMultiplier,),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.red[900]//Color(0xffEF0101)//Colors.white

                                  ),
                                  child: MaterialButton(
                                    child: Center(
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(child: Icon(Icons.cancel, color: Colors.white, size: 5.31 * SizeConfig.textMultiplier,),flex: 1,),
                                          Expanded(child:Text("No",style: TextStyle(fontSize: 2.5*SizeConfig.textMultiplier, color: Colors.white, fontWeight: FontWeight.bold),textAlign:TextAlign.left),flex:1),
                                        ],
                                      ),
                                    ),
                                    onPressed: (){
                                      _increaseIndex();
                                      setState(() {
                                        if(index == questionBank.length -1 && score < 50){
                                          negativeAns=true;
                                        }
                                      });
                                    },
                                  ),
                                ),

                              ],
                            ):SizedBox(),
                          ),
                          Container(
                            child: index > 0 || negativeAns ?  MaterialButton(
                              child: Center(
                                child: Row(
                                  children: <Widget>[
                                    Expanded(child:Text("<<Restart the test",style:
                                    AppTheme.h3Style.copyWith(
                                      fontSize: 3.0 * SizeConfig.textMultiplier, color: Colors.red, height: 1.3,fontWeight: FontWeight.bold )

                                      ,textAlign: TextAlign.left,),flex:1),
                                  ],
                                ),
                              ),
                              onPressed: (){
                                setState(() {
                                  index=0;
                                  selectedBank=questionBank;
                                  score=0;
                                  positiveAns=false;
                                  negativeAns=false;
                                });

                              },
                            ):SizedBox(),
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
      if (index >= 0 && index <=selectedBank.length-2) {
        index = index + 1;
      }
    });
  }

  List<List<Diagnostic>> optionResponse(){
    if(positiveAns){
      setState(() {
        selectedBank=replyBank;
        index=1;
      });
      return replyBank;
    }
    if(negativeAns){
      setState(() {
        selectedBank=replyBank;
        index=0;
      });
      return replyBank;
    }
    setState(() {
      selectedBank=questionBank;
    });

    return questionBank;
  }
  void _decreaseIndex() {
    setState(() {
      if (index >= 1 && index <=selectedBank.length-1) {
        index = index - 1;
        negativeCount = negativeCount -1;
      }
    });
  }
  Widget buildQuestions(BuildContext context , List<Diagnostic> questions){
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: questions.length,
        itemBuilder: (context, index ){
      return Container(
        padding:positiveAns || negativeAns?EdgeInsets.all(8.0):EdgeInsets.all(0.0) ,
        decoration:positiveAns || negativeAns?BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),

        ):BoxDecoration(),
        child: Text(
          '${questions[index].question}',
          style:
          AppTheme.h3Style.copyWith(
            fontSize:positiveAns || negativeAns?4.0 * SizeConfig.textMultiplier: 5.0 * SizeConfig.textMultiplier, color:positiveAns || negativeAns? LightColor.brighter:LightColor.whiteText, height: 1.3, ),textAlign:TextAlign.left,
        ),
      );
    });
  }
}
