class AstrologerResponse {
  int? id;
  String? urlSlug;
  String? namePrefix;
  String? firstName;
  String? lastName;
  String? aboutMe;
  String? profliePicUrl;
  double? experience;
  List<Languages>? languages;
  int? minimumCallDuration;
  double? minimumCallDurationCharges;
  double? additionalPerMinuteCharges;
  bool? isAvailable;
  double? rating;
  List<Skills>? skills;
  bool? isOnCall;
  int? freeMinutes;
  int? additionalMinute;
  Images? images;
  Availability? availability;

  AstrologerResponse(
      {this.id,
      this.urlSlug,
      this.namePrefix,
      this.firstName,
      this.lastName,
      this.aboutMe,
      this.profliePicUrl,
      this.experience,
      this.languages,
      this.minimumCallDuration,
      this.minimumCallDurationCharges,
      this.additionalPerMinuteCharges,
      this.isAvailable,
      this.rating,
      this.skills,
      this.isOnCall,
      this.freeMinutes,
      this.additionalMinute,
      this.images,
      this.availability});

  AstrologerResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    urlSlug = json['urlSlug'];
    namePrefix = json['namePrefix'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    aboutMe = json['aboutMe'];
    profliePicUrl = json['profliePicUrl'];
    experience = json['experience'];
    if (json['languages'] != null) {
      languages = <Languages>[];
      json['languages'].forEach((v) {
        languages?.add(Languages.fromJson(v));
      });
    }
    minimumCallDuration = json['minimumCallDuration'];
    minimumCallDurationCharges = json['minimumCallDurationCharges'];
    additionalPerMinuteCharges = json['additionalPerMinuteCharges'];
    isAvailable = json['isAvailable'];
    rating = json['rating'];
    if (json['skills'] != null) {
      skills = <Skills>[];
      json['skills'].forEach((v) {
        skills?.add(Skills.fromJson(v));
      });
    }
    isOnCall = json['isOnCall'];
    freeMinutes = json['freeMinutes'];
    additionalMinute = json['additionalMinute'];
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
    availability = json['availability'] != null
        ? Availability.fromJson(json['availability'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['urlSlug'] = urlSlug;
    data['namePrefix'] = namePrefix;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['aboutMe'] = aboutMe;
    data['profliePicUrl'] = profliePicUrl;
    data['experience'] = experience;
    if (languages != null) {
      data['languages'] = languages?.map((v) => v.toJson()).toList();
    }
    data['minimumCallDuration'] = minimumCallDuration;
    data['minimumCallDurationCharges'] = minimumCallDurationCharges;
    data['additionalPerMinuteCharges'] = additionalPerMinuteCharges;
    data['isAvailable'] = isAvailable;
    data['rating'] = rating;
    if (skills != null) {
      data['skills'] = skills?.map((v) => v.toJson()).toList();
    }
    data['isOnCall'] = isOnCall;
    data['freeMinutes'] = freeMinutes;
    data['additionalMinute'] = additionalMinute;
    if (images != null) {
      data['images'] = images?.toJson();
    }
    if (availability != null) {
      data['availability'] = availability?.toJson();
    }
    return data;
  }
}

class Languages {
  int? id;
  String? name;

  Languages({this.id, this.name});

  Languages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Skills {
  int? id;
  String? name;
  String? description;

  Skills({this.id, this.name, this.description});

  Skills.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    return data;
  }
}

class Images {
  ImageDetail? small;
  ImageDetail? large;
  ImageDetail? medium;

  Images({this.small, this.large, this.medium});

  Images.fromJson(Map<String, dynamic> json) {
    small = json['small'] != null ? ImageDetail.fromJson(json['small']) : null;
    large = json['large'] != null ? ImageDetail.fromJson(json['large']) : null;
    medium =
        json['medium'] != null ? ImageDetail.fromJson(json['medium']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (small != null) {
      data['small'] = small?.toJson();
    }
    if (large != null) {
      data['large'] = large?.toJson();
    }
    if (medium != null) {
      data['medium'] = medium?.toJson();
    }
    return data;
  }
}

class ImageDetail {
  String? imageUrl;
  int? id;

  ImageDetail({this.imageUrl, this.id});

  ImageDetail.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imageUrl'] = imageUrl;
    data['id'] = id;
    return data;
  }
}

class Availability {
  List<String>? days;
  Slot? slot;

  Availability({this.days, this.slot});

  Availability.fromJson(Map<String, dynamic> json) {
    days = json['days'].cast<String>();
    slot = json['slot'] != null ? Slot.fromJson(json['slot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['days'] = days;
    if (slot != null) {
      data['slot'] = slot?.toJson();
    }
    return data;
  }
}

class Slot {
  String? toFormat;
  String? fromFormat;
  String? from;
  String? to;

  Slot({this.toFormat, this.fromFormat, this.from, this.to});

  Slot.fromJson(Map<String, dynamic> json) {
    toFormat = json['toFormat'];
    fromFormat = json['fromFormat'];
    from = json['from'];
    to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['toFormat'] = toFormat;
    data['fromFormat'] = fromFormat;
    data['from'] = from;
    data['to'] = to;
    return data;
  }
}
