import 'diagnostic.dart';
class DiagnosticBank{

  List<Diagnostic> diagnosticBank1=[
    Diagnostic.name('''Do you have Fever?''', false, 20),

  ];

  List<Diagnostic> diagnosticBank2=[
    Diagnostic.name("Do you often feel Tired?", false,20 ),
  ];

  List<Diagnostic> diagnosticBank3=[
    Diagnostic.name("Do you have dry cough?", false, 20),
  ];
  List<Diagnostic> diagnosticBank4=[
    Diagnostic.name('''Do you have difficulty in breathing?''', false, 19),

  ];

  List<Diagnostic> diagnosticBank5=[
    Diagnostic.name("Do you have  sore throat or diarrhea?", false, 7),
  ];
  List<Diagnostic> diagnosticBank6=[
    Diagnostic.name("Do you have runny nose?", false, 7),
  ];

  List<Diagnostic> diagnosticBank7=[
    Diagnostic.name('''Do you have nasal congestion?''', false, 7),
  ];

  List<Diagnostic> diagnosticNegativeAnswer=[
    Diagnostic.name('''It Appears you don't have reasonable symptoms of the virus. Always Stay Safe''', false, 40),
  ];

  List<Diagnostic> diagnosticPositiveAnswer=[
    Diagnostic.name(''' It appears you have high chances of having the virus. Please seek immediate medical attention''', false, 40),
  ];
 }