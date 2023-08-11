class User {
  final String name;
  final String email;
  final String id;

  // Constructor
  User(this.name,this.email, this.id);

  // Convert a user to a Map<String,dynamic>
  Map<String, dynamic> toJson() => {
    name : name, 
    email : email,
    id : id
  };

  // Convert json to a User instance
  User.fromJson(Map<String, dynamic> json):
    name = json["name"],
    email = json["email"],
    id = json["id"];
}