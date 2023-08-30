class BannersModel {
  bool? status;
  int? statusCode;
  String? message;
  List<Data>? data;

  BannersModel({this.status, this.statusCode, this.message, this.data});

  BannersModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['status_code'] = statusCode;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? cardName;
  int? cardType;
  String? aspectRatio;
  List<ContentList>? contentList;

  Data({this.cardName, this.cardType, this.aspectRatio, this.contentList});

  Data.fromJson(Map<String, dynamic> json) {
    cardName = json['card_name'];
    cardType = json['card_type'];
    aspectRatio = json['aspect_ratio'];
    if (json['content_list'] != null) {
      contentList = <ContentList>[];
      json['content_list'].forEach((v) {
        contentList!.add(ContentList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['card_name'] = cardName;
    data['card_type'] = cardType;
    data['aspect_ratio'] = aspectRatio;
    if (contentList != null) {
      data['content_list'] = contentList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ContentList {
  String? imageUrl;
  String? name;
  String? contentId;
  String? aspectRatio;
  bool? isAvod;
  bool? isTvod;
  bool? isSvod;
  String? duration;
  bool? isResume;
  String? watchedDuration;

  ContentList(
      {this.imageUrl,
      this.name,
      this.contentId,
      this.aspectRatio,
      this.isAvod,
      this.isTvod,
      this.isSvod,
      this.duration,
      this.isResume,
      this.watchedDuration});

  ContentList.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
    name = json['name'];
    contentId = json['content_id'];
    aspectRatio = json['aspect_ratio'];
    isAvod = json['is_avod'];
    isTvod = json['is_tvod'];
    isSvod = json['is_svod'];
    duration = json['duration'];
    isResume = json['is_resume'];
    watchedDuration = json['watched_duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image_url'] = imageUrl;
    data['name'] = name;
    data['content_id'] = contentId;
    data['aspect_ratio'] = aspectRatio;
    data['is_avod'] = isAvod;
    data['is_tvod'] = isTvod;
    data['is_svod'] = isSvod;
    data['duration'] = duration;
    data['is_resume'] = isResume;
    data['watched_duration'] = watchedDuration;
    return data;
  }
}
