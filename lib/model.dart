
import 'dart:convert';

ActorModel actorModelFromJson(String str) => ActorModel.fromJson(json.decode(str));

String actorModelToJson(ActorModel data) => json.encode(data.toJson());

class ActorModel {
    bool success;
    Data? data;
    dynamic error;

    ActorModel({
        required this.success,
        this.data, 
        required this.error,
    });

    factory ActorModel.fromJson(Map<String, dynamic> json) => ActorModel(
        success: json["success"],
        data: json["data"] != null ? Data.fromJson(json["data"]) : null,
        error: json["error"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
        "error": error,
    };
}

class Data {
    User user;
    String message;

    Data({
        required this.user,
        required this.message,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "message": message,
    };
}

class User {
    int userId;
    String name;
    int age;
    String profession;
    String profileImage;

    User({
        required this.userId,
        required this.name,
        required this.age,
        required this.profession,
        required this.profileImage,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["user_id"],
        name: json["name"],
        age: json["age"],
        profession: json["profession"],
        profileImage: json["profile_image"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
        "age": age,
        "profession": profession,
        "profile_image": profileImage,
    };
}
