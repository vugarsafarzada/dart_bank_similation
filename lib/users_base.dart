import 'dart:math';

class UsersBase{
  final Map<String, Map> _usersBase = {};

  void saveUserToBase(Map user){
    var userId = getRandomId();
    _usersBase[userId] = user; 
    print(usersList);
  } 
  get usersList => _usersBase;
}

String getRandomId() {
  // Create a Random object
  final random = Random();

  // Generate a random 8-digit number
  int randomId = random.nextInt(100000000);

  // Ensure the number has exactly 8 digits
  return randomId.toString().padLeft(8, '0');
}
