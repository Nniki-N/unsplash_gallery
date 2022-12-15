class UnsplashPhoto {
  UnsplashPhoto({
    required this.id,
    required this.createdAt,
    this.updatedAt,
    this.width,
    this.height,
    this.color,
    this.blurHash,
    this.likes,
    this.likedByUser,
    this.description,
    required this.user,
    this.currentUserCollections,
    required this.urls,
    this.links,
  });

  String id;
  DateTime createdAt;
  DateTime? updatedAt;
  int? width;
  int? height;
  String? color;
  String? blurHash;
  int? likes;
  bool? likedByUser;
  String? description;
  User user;
  List<CurrentUserCollection>? currentUserCollections;
  Urls urls;
  WelcomeLinks? links;

  factory UnsplashPhoto.fromJson(Map<String, dynamic> json) => UnsplashPhoto(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        width: json["width"],
        height: json["height"],
        color: json["color"],
        blurHash: json["blur_hash"],
        likes: json["likes"],
        likedByUser: json["liked_by_user"],
        description: json["description"],
        user: User.fromJson(json["user"]),
        currentUserCollections: List<CurrentUserCollection>.from(
            json["current_user_collections"]
                .map((x) => CurrentUserCollection.fromJson(x))),
        urls: Urls.fromJson(json["urls"]),
        links: WelcomeLinks.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "width": width,
        "height": height,
        "color": color,
        "blur_hash": blurHash,
        "likes": likes,
        "liked_by_user": likedByUser,
        "description": description,
        "user": user.toJson(),
        "current_user_collections": currentUserCollections != null
            ? List<dynamic>.from(currentUserCollections!.map((x) => x.toJson()))
            : null,
        "urls": urls.toJson(),
        "links": links?.toJson(),
      };
}

class CurrentUserCollection {
  CurrentUserCollection({
    required this.id,
    required this.title,
    required this.publishedAt,
    required this.lastCollectedAt,
    required this.updatedAt,
    this.coverPhoto,
    this.user,
  });

  int id;
  String title;
  DateTime publishedAt;
  DateTime lastCollectedAt;
  DateTime updatedAt;
  String? coverPhoto;
  String? user;

  factory CurrentUserCollection.fromJson(Map<String, dynamic> json) =>
      CurrentUserCollection(
        id: json["id"],
        title: json["title"],
        publishedAt: DateTime.parse(json["published_at"]),
        lastCollectedAt: DateTime.parse(json["last_collected_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        coverPhoto: json["cover_photo"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "published_at": publishedAt.toIso8601String(),
        "last_collected_at": lastCollectedAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "cover_photo": coverPhoto,
        "user": user,
      };
}

class WelcomeLinks {
  WelcomeLinks({
    required this.self,
    required this.html,
    required this.download,
    required this.downloadLocation,
  });

  String self;
  String html;
  String download;
  String downloadLocation;

  factory WelcomeLinks.fromJson(Map<String, dynamic> json) => WelcomeLinks(
        self: json["self"],
        html: json["html"],
        download: json["download"],
        downloadLocation: json["download_location"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "download": download,
        "download_location": downloadLocation,
      };
}

class Urls {
  Urls({
    this.raw,
    required this.full,
    required this.regular,
    this.small,
    required this.thumb,
  });

  String? raw;
  String full;
  String regular;
  String? small;
  String thumb;

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        raw: json["raw"],
        full: json["full"],
        regular: json["regular"],
        small: json["small"],
        thumb: json["thumb"],
      );

  Map<String, dynamic> toJson() => {
        "raw": raw,
        "full": full,
        "regular": regular,
        "small": small,
        "thumb": thumb,
      };
}

class User {
  User({
    required this.id,
    required this.username,
    required this.name,
    this.portfolioUrl,
    this.bio,
    this.location,
    this.totalLikes,
    this.totalPhotos,
    this.totalCollections,
    this.instagramUsername,
    this.twitterUsername,
    this.profileImage,
    this.links,
  });

  String id;
  String username;
  String name;
  String? portfolioUrl;
  String? bio;
  String? location;
  int? totalLikes;
  int? totalPhotos;
  int? totalCollections;
  String? instagramUsername;
  String? twitterUsername;
  ProfileImage? profileImage;
  UserLinks? links;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        name: json["name"],
        portfolioUrl: json["portfolio_url"],
        bio: json["bio"],
        location: json["location"],
        totalLikes: json["total_likes"],
        totalPhotos: json["total_photos"],
        totalCollections: json["total_collections"],
        instagramUsername: json["instagram_username"],
        twitterUsername: json["twitter_username"],
        profileImage: ProfileImage.fromJson(json["profile_image"]),
        links: UserLinks.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "name": name,
        "portfolio_url": portfolioUrl,
        "bio": bio,
        "location": location,
        "total_likes": totalLikes,
        "total_photos": totalPhotos,
        "total_collections": totalCollections,
        "instagram_username": instagramUsername,
        "twitter_username": twitterUsername,
        "profile_image": profileImage != null ? profileImage!.toJson() : null,
        "links": links != null ? links!.toJson() : null,
      };
}

class UserLinks {
  UserLinks({
    required this.self,
    required this.html,
    required this.photos,
    required this.likes,
    required this.portfolio,
  });

  String self;
  String html;
  String photos;
  String likes;
  String portfolio;

  factory UserLinks.fromJson(Map<String, dynamic> json) => UserLinks(
        self: json["self"],
        html: json["html"],
        photos: json["photos"],
        likes: json["likes"],
        portfolio: json["portfolio"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "photos": photos,
        "likes": likes,
        "portfolio": portfolio,
      };
}

class ProfileImage {
  ProfileImage({
    this.small,
    this.medium,
    this.large,
  });

  String? small;
  String? medium;
  String? large;

  factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
        small: json["small"],
        medium: json["medium"],
        large: json["large"],
      );

  Map<String, dynamic> toJson() => {
        "small": small,
        "medium": medium,
        "large": large,
      };
}
