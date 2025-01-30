class ReelsListResponse {
  int? statusCode;
  String? message;
  ReelsList? data;

  ReelsListResponse({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory ReelsListResponse.fromJson(Map<String, dynamic> json) =>
      ReelsListResponse(
        statusCode: json["statusCode"],
        message: json["message"],
        data: ReelsList.fromJson(json["data"]),
      );
}

class ReelsList {
  List<ReelModel> data;
  MetaData? metaData;

  ReelsList({
    required this.data,
    required this.metaData,
  });
  factory ReelsList.fromJson(Map<String, dynamic> json) => ReelsList(
        data: List<ReelModel>.from(
            json["data"].map((x) => ReelModel.fromJson(x))),
        metaData: MetaData.fromJson(json["meta_data"]),
      );
}

class ReelModel {
  int? id;
  dynamic title;
  dynamic url;
  dynamic cdnUrl;
  dynamic thumbCdnUrl;
  int? userId;
  dynamic status;
  dynamic slug;
  dynamic encodeStatus;
  int? priority;
  int? categoryId;
  int? totalViews;
  int? totalLikes;
  int? totalComments;
  int? totalShare;
  int? totalWishlist;
  int? duration;
  dynamic byteAddedOn;
  dynamic byteUpdatedOn;
  dynamic bunnyStreamVideoId;
  dynamic bytePlusVideoId;
  dynamic language;
  dynamic orientation;
  int? bunnyEncodingStatus;
  dynamic deletedAt;
  int? videoHeight;
  int? videoWidth;
  dynamic location;
  int? isPrivate;
  int? isHideComment;
  dynamic description;
  User? user;
  List<dynamic> resolutions;
  bool? isLiked;
  bool? isWished;
  bool? isFollow;
  dynamic videoAspectRatio;

  ReelModel({
    required this.id,
    required this.title,
    required this.url,
    required this.cdnUrl,
    required this.thumbCdnUrl,
    required this.userId,
    required this.status,
    required this.slug,
    required this.encodeStatus,
    required this.priority,
    required this.categoryId,
    required this.totalViews,
    required this.totalLikes,
    required this.totalComments,
    required this.totalShare,
    required this.totalWishlist,
    required this.duration,
    required this.byteAddedOn,
    required this.byteUpdatedOn,
    required this.bunnyStreamVideoId,
    required this.bytePlusVideoId,
    required this.language,
    required this.orientation,
    required this.bunnyEncodingStatus,
    required this.deletedAt,
    required this.videoHeight,
    required this.videoWidth,
    required this.location,
    required this.isPrivate,
    required this.isHideComment,
    required this.description,
    required this.user,
    required this.resolutions,
    required this.isLiked,
    required this.isWished,
    required this.isFollow,
    required this.videoAspectRatio,
  });

  factory ReelModel.fromJson(Map<String, dynamic> json) => ReelModel(
        id: json["id"],
        title: json["title"],
        url: json["url"],
        cdnUrl: json["cdn_url"],
        thumbCdnUrl: json["thumb_cdn_url"],
        userId: json["user_id"],
        status: json["status"],
        slug: json["slug"],
        encodeStatus: json["encode_status"],
        priority: json["profile_picture"],
        categoryId: json["category_id"],
        totalViews: json["total_views"],
        totalLikes: json["total_vikes"],
        totalComments: json["total_comments"],
        totalShare: json["total_share"],
        totalWishlist: json["total_wishlist"],
        duration: json["duration"],
        byteAddedOn: json["byte_added_on"],
        byteUpdatedOn: json["byte_updated_on"],
        bunnyStreamVideoId: json["bunny_stream_video_id"],
        bytePlusVideoId: json["byte_plus_video_id"],
        language: json["language"],
        orientation: json["orientation"],
        bunnyEncodingStatus: json["bunny_encoding_status"],
        deletedAt: json["deleted_at"].toString(),
        videoHeight: json["video_height"],
        videoWidth: json["video_width"],
        location: json["location"],
        isPrivate: json["is_private"],
        isHideComment: json["is_hide_comment"],
        description: json["description"],
        user: User.fromJson(json["user"]),
        resolutions: List<String>.from(json["resolutions"].map((x) => x)),
        isLiked: json["is_liked"],
        isWished: json["is_wished"],
        isFollow: json["is_follow"],
        videoAspectRatio: json["videoAspectRatio"].toString(),
      );
}

class User {
  int? userId;
  String? fullname;
  String? username;
  String? profilePicture;
  String? profilePictureCdn;
  String? designation;

  User({
    required this.userId,
    required this.fullname,
    required this.username,
    required this.profilePicture,
    required this.profilePictureCdn,
    required this.designation,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["user_id"],
        fullname: json["fullname"],
        username: json["username"],
        profilePicture: json["profile_picture"],
        profilePictureCdn: json["profile_picture_cdn"],
        designation: json["designation"],
      );
}

class MetaData {
  String? total;
  String? page;
  String? limit;

  MetaData({
    required this.total,
    required this.page,
    required this.limit,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
      total: json["total"].toString(),
      page: json["page"].toString(),
      limit: json["limit"].toString());
}
