
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "username")
  String username;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "avatar")
  String avatar;
  @JsonKey(name: "phoneNumber")
  String phoneNumber;

  User({this.id, this.username, this.name, this.avatar, this.phoneNumber});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return 'User{id: $id, username: $username, name: $name, avatar: $avatar, phoneNumber: $phoneNumber}';
  }

}