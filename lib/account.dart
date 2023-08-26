import 'dart:io';
import 'users_base.dart';
var input = stdin;
String divider = '\n-------------------------------\n';
UsersBase userBase = UsersBase();

class User{
  String? firstName;
  String? lastName;
  User(this.firstName, this.lastName);
  void sayWelcomeToUser(){
    print('Welcome $firstName $lastName \n');
  }
}

class UserAccount extends User{
  double? balance = 0.0;
  String? password;
  UserAccount(String? firstName, String? lastName, double? balance) : super(firstName, lastName); 

  bool _accountIsNull() => firstName == null || lastName == null;
  bool get accountIsNull => _accountIsNull();

  void createAnAccount(){
    print(divider);
    print('Create an account!\n');

    print('Enter your name: ');
    firstName = input.readLineSync();
    
    print('Enter your surname: ');
    lastName = input.readLineSync();
    
    print('Enter your password: ');
    password = input.readLineSync().toString();
    
    balance = 0.0;
    print(divider);

    Map<String, dynamic> newUser = {
      'firstName': firstName.toString(),
      'lastName': lastName.toString(),
      'balance': balance,
      'password': password
    };
    userBase.saveUserToBase(newUser);
  }
  @override
  void sayWelcomeToUser(){
    print('Welcome $firstName $lastName \n');
    print('Balance:\n $balance');
  }

  dynamic login(){
    print(divider);
    print('Enter your id: ');
    var id = input.readLineSync().toString();
    Map userList = userBase.usersList;
    print('Enter your password: ');
    var password = input.readLineSync().toString();
    if(!userList.containsKey(id)){
      print('Id or password is wrong');
    } else {
      var targetedUser = userList[id];
      if(targetedUser['password'] == password){
        return userList[id];
      } else {
        print('Id or password is wrong');
      }
    }
    return null;
  }
}

class Auth extends UserAccount{
  Auth(String? firstName, String? lastName, double? balance) : super(firstName, lastName, balance);

  @override
  dynamic login(){
    print('From Login class');
    return super.login();
  }

  dynamic register(){
    print('From Register class');
    return super.createAnAccount();
  }
}