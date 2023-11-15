import 'dart:io' show Platform;

bool isHostDesktop(){
  bool isDesktop = false;
  if(Platform.isLinux || Platform.isMacOS || Platform.isWindows){
    isDesktop = true;
  }

  return isDesktop;
}