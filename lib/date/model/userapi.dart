class UserApi {
  List<Key>? key;

  UserApi({this.key});

  UserApi.fromJson(Map<String, dynamic> json) {
    if (json['key'] != null) {
      key = <Key>[];
      json['key'].forEach((v) {
        key!.add(new Key.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.key != null) {
      data['key'] = this.key!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Key {
  int? id;
  String? username;
  String? password;

  Key({this.id, this.username, this.password});

  Key.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['password'] = this.password;
    return data;
  }
}
