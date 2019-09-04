class User{
  String _username;
  double _salary;
  int _id;
  User(this._id,this._username,this._salary);

  
set id(int id){
  this.id=_id;
}
 
set name(String nam){
  this._username=nam;
}
 
set salary(double sal){
  this._salary=sal;
}




    // User.map(dynamic obj){
  //   this._salary=obj['salary'];
  //   this._username=obj['username'];
  //   this._id=obj['id'];
  // }
  
  String get username=>_username;
  double get salary=>_salary;
  int get id=>_id;
 
  // Map<String,dynamic> tomap(){
  //   var map=new Map<String,dynamic>();
  //   map['username']=_username;
  //   map['salary']=_salary;
  //   if(_id!=null){
  //     map['id']=_id;
  //   }
  //   return map;
  // }

  // User.fromMap(Map<String,dynamic> map){
  //   this._username=map['username'];
  //   this._salary=map['salary'];
  //   this._id=map['id'];
  // }

}