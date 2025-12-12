


import 'package:xteammors/utils/teammors_log.dart';

import '../paras/parameters.dart';
import '../websocket/im_client_manager.dart';
import '../websocket/observer.dart';

class MessageHelper implements Observer {

  static final MessageHelper _instance = MessageHelper._internal();

  MessageHelper._internal() {
    if(!ParametersManager.getInstance().messageHelperObserverAdded) {
      IMClientManager.getInstance().subject.addObserver(this);
      ParametersManager.getInstance().messageHelperObserverAdded = true;
    }
  }

  static MessageHelper getInstance() => _instance;

  void init(){

  }

  void unInit(){
    if(ParametersManager.getInstance().messageHelperObserverAdded) {
      IMClientManager.getInstance().subject.removeObserver(this);
      ParametersManager.getInstance().messageHelperObserverAdded = false;
    }
  }


  @override
  void update(String message) {
    //TeammorsLogUtils.tlog(message);

  }

}