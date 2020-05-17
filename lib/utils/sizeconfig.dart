import 'package:ncov19_app/utils/all_imports.dart';

class SizeConfig{
  static double _screenHeight;
  static double _screenWidth;
  static double _blockSizeHorizontal;
  static double _blockSizeVertical;


  static double textMultiplier;
  static double imageSizeMultiplier;
  static double heightMultiplier;

  void init(BoxConstraints constraints,Orientation orientation){
    if(orientation==Orientation.portrait){
      _screenWidth=constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
    }else{
      _screenWidth=constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
    }
    _blockSizeVertical=_screenHeight/100;
    _blockSizeHorizontal=_screenWidth/100;


    textMultiplier=_blockSizeVertical;
    imageSizeMultiplier=_blockSizeHorizontal;
    heightMultiplier=_blockSizeVertical;

    print(_blockSizeHorizontal);
    print(_blockSizeVertical);
  }

}