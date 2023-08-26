import 'dart:io';

import 'package:bank_similation_app/account.dart';
import 'package:bank_similation_app/users_base.dart';

UsersBase userBase = UsersBase();
var input = stdin;

void main() {
  UserAccount userAccount = UserAccount(null, null, null);
  while (true) {
    print('\ncommand >>'.toUpperCase());
    var cmd = input.readLineSync();
    cmd = cmd?.toLowerCase();
    if(cmd == 'register'){
      if(userAccount.accountIsNull){
        userAccount.createAnAccount();
      } else {
        userAccount.sayWelcomeToUser();
      }
    } else if(cmd == 'login'){
     var user = Auth(null, null, null).login();
     print(user ?? '');
    } else if(cmd == 'exit'){
      print('\nGoodbye!');
      break;
    } else {
      print('[X] Command not found -> "$cmd"');
    }
    userAccount = UserAccount(null, null, null);    
  }
}
