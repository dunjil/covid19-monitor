import 'package:ncov19_app/utils/all_imports.dart';
class ItemTile extends StatelessWidget {
  ItemTile(
      {@required this.color,
        @required this.icon,
        @required this.title,
        @required this.number,
        this.newCases
      });

  final Color color;
  final IconData icon;
  final String title;
  final String number;
  final String newCases;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(1.1 * SizeConfig.heightMultiplier),
      child: Container(
        height: 25 * SizeConfig.heightMultiplier,
        decoration: BoxDecoration(color:  Color(0xff042A64).withOpacity(0.85),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(1.2 * SizeConfig.heightMultiplier),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:  EdgeInsets.all(10.0),
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color:  Color(0xff042A64).withOpacity(0.6),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    title,
                    style: AppTheme.h1Style.copyWith(
                        fontSize: 2.6 * SizeConfig.textMultiplier,
                        fontWeight: FontWeight.bold,
                        color: color), textAlign: TextAlign.left,
                  ),
                ),
              ),
              SizedBox(height: 0.3 * SizeConfig.heightMultiplier,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        Text(
                          number != null ? number : "0",
                          style: AppTheme.h1Style.copyWith(
                            fontSize:  2.5 * SizeConfig.textMultiplier,
                            fontWeight: FontWeight.bold,
                            color: color,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(height: 1.5 * SizeConfig.heightMultiplier,),
                        Text(
                          "Total",
                          style: AppTheme.h1Style.copyWith(
                              fontSize: 2.0 * SizeConfig.textMultiplier,
                              fontWeight: FontWeight.normal,
                              color: color.withOpacity(0.7)), textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[

                        Text(
                          newCases != null ? newCases : "0",
                          style: AppTheme.h1Style.copyWith(
                            fontSize:  2.5 * SizeConfig.textMultiplier,
                            fontWeight: FontWeight.bold,
                            color: color,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(height: 1.5 * SizeConfig.heightMultiplier,),
                        Text(
                          "Today",
                          style: AppTheme.h1Style.copyWith(
                              fontSize: 2.0 * SizeConfig.textMultiplier,
                              fontWeight: FontWeight.normal,
                              color: color.withOpacity(0.7)), textAlign: TextAlign.left,
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