class Newusers{
  String? email;
  String? number;
  String? address;

  Newusers(this.email,this.number,this.address);
  Newusers.fromJson(Map<String , dynamic> json)
        :email = json['email'],
        number = json['number'],
        address= json["address"];

  Map<String , dynamic> toJson()=>{

    'email':email,
    'number':number,
    'address':address,
  };

}