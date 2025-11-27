
import 'package:xteammors/utils/time_utils.dart';
import '../paras/parameters.dart';


class TeammorsLogUtils {

  static void tlog(String message){

    if(ParametersManager.getInstance().isDebug){
      print("XTeammors Log ${TimeUtils.getNowTime()} :$message");
    }

  }


}