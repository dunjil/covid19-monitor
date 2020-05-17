import 'utils/all_imports.dart';

void main() => runApp(CovidInfo());

class CovidInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        return  OrientationBuilder(
            builder: (context, orientation){
              SizeConfig().init(constraints, orientation);
              return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Covid19 Tracker',
                  theme: ThemeData(
                    primarySwatch: Colors.blue,
                  ),
                  initialRoute: Home.id,
                  routes: {
                    Home.id:(context)=>Home(),
                    Dashboard.id:(context)=>Dashboard(),
                    Diagnosis.id:(context)=>Diagnosis(),
                    SignsAndSymptoms.id:(context)=>SignsAndSymptoms(),
                    Protection.id:(context)=>Protection(),
                    About.id:(context)=>About(),
                    MeasuresPage.id:(context)=>MeasuresPage(),
                  }
              );
            }
        );
      }
    );
  }
}