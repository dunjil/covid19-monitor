import '../utils/all_imports.dart';
import '../services/api_service.dart';
import '../models/cases.dart';
import 'package:intl/intl.dart';

class Dashboard extends StatefulWidget {
  static String id = '/dashboard';
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final formatter = NumberFormat("#,###");
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
   GlobalKey<RefreshIndicatorState>();
  bool loading=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xff042A64),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Global Data", style:  GoogleFonts.cabin(textStyle: TextStyle(color: Color(0xff042A64)),),),
      ),
      backgroundColor:Colors.white,
      body: Center(
        child: RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: fetchData,
          child: ListView(
            children: <Widget>[
              FutureBuilder(
                  future: fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                          child: Padding(
                            padding:  EdgeInsets.all(2.0 * SizeConfig.heightMultiplier),
                            child: Text(
                        "Something went wrong, pull to refresh",
                        style: GoogleFonts.cabin(textStyle:TextStyle( color:Colors.red), fontSize: 2.5 * SizeConfig.textMultiplier),textAlign: TextAlign.center,
                      ),
                          ));
                    } else if (snapshot.hasData) {
                      List<Results> result = snapshot.data;
                      return Column(
                        children: <Widget>[
                          BoardCard(
                            color: Colors.white,
                              recovered:formatter.format(result[0].totalRecovered),
                               countriesAffected: formatter.format(result[0].totalAffectedCountries),
                            seriousCases: formatter.format(result[0].totalSeriousCases),
                            activeCases: formatter.format(result[0].totalActiveCases),
                          ),
                          ItemTile(
                            color: Colors.white,
                            icon: Icons.check_circle_outline,
                            title: "Total Cases",
                            number: formatter.format(result[0].totalCases),
                            newCases:  formatter.format(result[0].totalNewCasesToday),
                          ),
                          ItemTile(
                              color: Colors.white,
                              icon: Icons.local_hospital,
                              title: "Deaths",
                              number: formatter.format(result[0].totalDeaths),
                              newCases:  formatter.format(result[0].totalNewDeathsToday)
                          ),
                    Center(
                    child: Padding(
                    padding:  EdgeInsets.all(2.0 * SizeConfig.heightMultiplier),
                    child: Text(
                    "Pull to refresh",
                    style: GoogleFonts.cabin(textStyle:TextStyle( color:Colors.green), fontSize: 2.5  * SizeConfig.textMultiplier),textAlign: TextAlign.center,
                    ),
                    ),),
                        ],
                      );
                    } else {
                      return Center(child:
                    Column(
                      children: <Widget>[
                        SizedBox(height: 1.5 * SizeConfig.heightMultiplier,),
                        CircularProgressIndicator(),
                        Text("Loading data...",
                          style:  GoogleFonts.cabin(textStyle:TextStyle( color:Colors.green)),),
                      ],
                    ),);
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }

  Future<List<Results>> fetchData() {
    return APIService().fetchData();
  }
}


