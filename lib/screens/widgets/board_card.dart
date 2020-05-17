import 'package:ncov19_app/utils/all_imports.dart';
class BoardCard extends StatelessWidget {
  BoardCard(
      {@required this.color,
        @required this.recovered,
        @required this.countriesAffected,
  @required this.seriousCases,
        @required  this.activeCases
      });

  final Color color;
  final String recovered;
  final String countriesAffected;
  final String seriousCases;
  final String activeCases;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0.5 * SizeConfig.heightMultiplier),
      child: Container(
        height: 26 * SizeConfig.heightMultiplier,
        decoration: BoxDecoration(color:  Color(0xff042A64).withOpacity(0.55),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(0.5 * SizeConfig.heightMultiplier),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:  EdgeInsets.all(0.5 * SizeConfig.heightMultiplier),
                child: Icon(LineIcons.line_chart, color: Colors.yellow[500],size: 4 * SizeConfig.heightMultiplier,),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(0.5 * SizeConfig.heightMultiplier),
                          decoration: BoxDecoration(
                            color:  Color(0xff042A64).withOpacity(0.6),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text(
                            "Active Cases",
                            style: AppTheme.h1Style.copyWith(
                                fontSize: 2.0 * SizeConfig.textMultiplier,
                                fontWeight: FontWeight.normal,
                                color: color, letterSpacing: 1.2), textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(height: 0.3 * SizeConfig.heightMultiplier,),
                        Text(
                          activeCases != null ? activeCases : "0",
                          style: AppTheme.h1Style.copyWith(
                            fontSize:  2.3 * SizeConfig.textMultiplier,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow[500],
                              letterSpacing: 1.2
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color:  Color(0xff042A64).withOpacity(0.6),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text(
                            "Recovered",
                            style: AppTheme.h1Style.copyWith(
                                fontSize: 1.8 * SizeConfig.textMultiplier,
                                color: color, letterSpacing: 1.2), textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(height: 0.3 * SizeConfig.heightMultiplier,),
                        Text(
                          recovered != null ? recovered : "0",
                          style: AppTheme.h1Style.copyWith(
                            fontSize:  2.3 * SizeConfig.textMultiplier,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow[500],
                              letterSpacing: 1.2
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color:  Color(0xff042A64).withOpacity(0.6),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text(
                            "Countries Affected",
                            style: AppTheme.h1Style.copyWith(
                                fontSize: 1.8 * SizeConfig.textMultiplier,
                                fontWeight: FontWeight.bold,
                                color: color, letterSpacing: 1.2), textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(height: 0.5 * SizeConfig.heightMultiplier,),
                        Text(
                          countriesAffected != null ? countriesAffected : "0",
                          style: AppTheme.h1Style.copyWith(
                            fontSize:  2.3 * SizeConfig.textMultiplier,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow[500],
                              letterSpacing: 1.2
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding:  EdgeInsets.all(8.0),
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color:  Color(0xff042A64).withOpacity(0.6),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Text(
                              "Serious Cases",
                              style: TextStyle(
                                  fontSize: 1.8 * SizeConfig.textMultiplier,
                                  letterSpacing: 1.2,
                                  fontWeight: FontWeight.bold,
                                  color: color), textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        Text(
                          seriousCases != null ? seriousCases : "0",
                          style: AppTheme.h1Style.copyWith(
                            fontSize:  2.3 * SizeConfig.textMultiplier,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow[500],
                              letterSpacing: 1.2
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}