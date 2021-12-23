class PanchangResponse {
  String? day;
  String? sunrise;
  String? sunset;
  String? moonrise;
  String? moonset;
  String? vedicSunrise;
  String? vedicSunset;
  Tithi? tithi;
  Nakshatra? nakshatra;
  Yog? yog;
  Karan? karan;
  HinduMaah? hinduMaah;
  String? paksha;
  String? ritu;
  String? sunSign;
  String? moonSign;
  String? ayana;
  String? panchangYog;
  int? vikramSamvat;
  int? shakaSamvat;
  String? vkramSamvatName;
  String? shakaSamvatName;
  String? dishaShool;
  String? dishaShoolRemedies;
  NakShool? nakShool;
  String? moonNivas;
  AbhijitMuhurta? abhijitMuhurta;
  AbhijitMuhurta? rahukaal;
  AbhijitMuhurta? guliKaal;
  AbhijitMuhurta? yamghantKaal;

  PanchangResponse(
      {this.day,
      this.sunrise,
      this.sunset,
      this.moonrise,
      this.moonset,
      this.vedicSunrise,
      this.vedicSunset,
      this.tithi,
      this.nakshatra,
      this.yog,
      this.karan,
      this.hinduMaah,
      this.paksha,
      this.ritu,
      this.sunSign,
      this.moonSign,
      this.ayana,
      this.panchangYog,
      this.vikramSamvat,
      this.shakaSamvat,
      this.vkramSamvatName,
      this.shakaSamvatName,
      this.dishaShool,
      this.dishaShoolRemedies,
      this.nakShool,
      this.moonNivas,
      this.abhijitMuhurta,
      this.rahukaal,
      this.guliKaal,
      this.yamghantKaal});

  PanchangResponse.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    moonrise = json['moonrise'];
    moonset = json['moonset'];
    vedicSunrise = json['vedic_sunrise'];
    vedicSunset = json['vedic_sunset'];
    tithi = json['tithi'] != null ? Tithi.fromJson(json['tithi']) : null;
    nakshatra = json['nakshatra'] != null
        ? Nakshatra.fromJson(json['nakshatra'])
        : null;
    yog = json['yog'] != null ? Yog.fromJson(json['yog']) : null;
    karan = json['karan'] != null ? Karan.fromJson(json['karan']) : null;
    hinduMaah = json['hindu_maah'] != null
        ? HinduMaah.fromJson(json['hindu_maah'])
        : null;
    paksha = json['paksha'];
    ritu = json['ritu'];
    sunSign = json['sun_sign'];
    moonSign = json['moon_sign'];
    ayana = json['ayana'];
    panchangYog = json['panchang_yog'];
    vikramSamvat = json['vikram_samvat'];
    shakaSamvat = json['shaka_samvat'];
    vkramSamvatName = json['vkram_samvat_name'];
    shakaSamvatName = json['shaka_samvat_name'];
    dishaShool = json['disha_shool'];
    dishaShoolRemedies = json['disha_shool_remedies'];
    nakShool =
        json['nak_shool'] != null ? NakShool.fromJson(json['nak_shool']) : null;
    moonNivas = json['moon_nivas'];
    abhijitMuhurta = json['abhijit_muhurta'] != null
        ? AbhijitMuhurta.fromJson(json['abhijit_muhurta'])
        : null;
    rahukaal = json['rahukaal'] != null
        ? AbhijitMuhurta.fromJson(json['rahukaal'])
        : null;
    guliKaal = json['guliKaal'] != null
        ? AbhijitMuhurta.fromJson(json['guliKaal'])
        : null;
    yamghantKaal = json['yamghant_kaal'] != null
        ? AbhijitMuhurta.fromJson(json['yamghant_kaal'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    data['moonrise'] = moonrise;
    data['moonset'] = moonset;
    data['vedic_sunrise'] = vedicSunrise;
    data['vedic_sunset'] = vedicSunset;
    if (tithi != null) {
      data['tithi'] = tithi?.toJson();
    }
    if (hinduMaah != null) {
      data['hindu_maah'] = hinduMaah?.toJson();
    }
    data['paksha'] = paksha;
    data['ritu'] = ritu;
    data['sun_sign'] = sunSign;
    data['moon_sign'] = moonSign;
    data['ayana'] = ayana;
    data['panchang_yog'] = panchangYog;
    data['vikram_samvat'] = vikramSamvat;
    data['shaka_samvat'] = shakaSamvat;
    data['vkram_samvat_name'] = vkramSamvatName;
    data['shaka_samvat_name'] = shakaSamvatName;
    data['disha_shool'] = dishaShool;
    data['disha_shool_remedies'] = dishaShoolRemedies;
    if (nakShool != null) {
      data['nak_shool'] = nakShool?.toJson();
    }
    data['moon_nivas'] = moonNivas;
    if (abhijitMuhurta != null) {
      data['abhijit_muhurta'] = abhijitMuhurta?.toJson();
    }
    if (rahukaal != null) {
      data['rahukaal'] = rahukaal?.toJson();
    }
    if (guliKaal != null) {
      data['guliKaal'] = guliKaal?.toJson();
    }
    if (yamghantKaal != null) {
      data['yamghant_kaal'] = yamghantKaal?.toJson();
    }
    return data;
  }
}

class Tithi {
  TithiDetails? details;
  EndTime? endTime;
  int? endTimeMs;

  Tithi({this.details, this.endTime, this.endTimeMs});

  Tithi.fromJson(Map<String, dynamic> json) {
    details =
        json['details'] != null ? TithiDetails.fromJson(json['details']) : null;
    endTime =
        json['end_time'] != null ? EndTime.fromJson(json['end_time']) : null;
    endTimeMs = json['end_time_ms'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (details != null) {
      data['details'] = details?.toJson();
    }
    if (endTime != null) {
      data['end_time'] = endTime?.toJson();
    }
    data['end_time_ms'] = endTimeMs;
    return data;
  }
}

class TithiDetails {
  int? tithiNumber;
  String? tithiName;
  String? special;
  String? summary;
  String? deity;

  TithiDetails(
      {this.tithiNumber,
      this.tithiName,
      this.special,
      this.summary,
      this.deity});

  TithiDetails.fromJson(Map<String, dynamic> json) {
    tithiNumber = json['tithi_number'];
    tithiName = json['tithi_name'];
    special = json['special'];
    summary = json['summary'];
    deity = json['deity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tithi_number'] = tithiNumber;
    data['tithi_name'] = tithiName;
    data['special'] = special;
    data['summary'] = summary;
    data['deity'] = deity;
    return data;
  }
}

class EndTime {
  int? hour;
  int? minute;
  int? second;

  EndTime({this.hour, this.minute, this.second});

  EndTime.fromJson(Map<String, dynamic> json) {
    hour = json['hour'];
    minute = json['minute'];
    second = json['second'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hour'] = hour;
    data['minute'] = minute;
    data['second'] = second;
    return data;
  }
}

class NakshatraDetails {
  int? nakNumber;
  String? nakName;
  String? ruler;
  String? deity;
  String? special;
  String? summary;

  NakshatraDetails(
      {this.nakNumber,
      this.nakName,
      this.ruler,
      this.deity,
      this.special,
      this.summary});

  NakshatraDetails.fromJson(Map<String, dynamic> json) {
    nakNumber = json['nak_number'];
    nakName = json['nak_name'];
    ruler = json['ruler'];
    deity = json['deity'];
    special = json['special'];
    summary = json['summary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nak_number'] = nakNumber;
    data['nak_name'] = nakName;
    data['ruler'] = ruler;
    data['deity'] = deity;
    data['special'] = special;
    data['summary'] = summary;
    return data;
  }
}

class YogDetails {
  int? yogNumber;
  String? yogName;
  String? special;
  String? meaning;

  YogDetails({this.yogNumber, this.yogName, this.special, this.meaning});

  YogDetails.fromJson(Map<String, dynamic> json) {
    yogNumber = json['yog_number'];
    yogName = json['yog_name'];
    special = json['special'];
    meaning = json['meaning'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['yog_number'] = yogNumber;
    data['yog_name'] = yogName;
    data['special'] = special;
    data['meaning'] = meaning;
    return data;
  }
}

class KaranDetails {
  int? karanNumber;
  String? karanName;
  String? special;
  String? deity;

  KaranDetails({this.karanNumber, this.karanName, this.special, this.deity});

  KaranDetails.fromJson(Map<String, dynamic> json) {
    karanNumber = json['karan_number'];
    karanName = json['karan_name'];
    special = json['special'];
    deity = json['deity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['karan_number'] = karanNumber;
    data['karan_name'] = karanName;
    data['special'] = special;
    data['deity'] = deity;
    return data;
  }
}

class HinduMaah {
  bool? adhikStatus;
  String? purnimanta;
  String? amanta;
  int? amantaId;
  int? purnimantaId;

  HinduMaah(
      {this.adhikStatus,
      this.purnimanta,
      this.amanta,
      this.amantaId,
      this.purnimantaId});

  HinduMaah.fromJson(Map<String, dynamic> json) {
    adhikStatus = json['adhik_status'];
    purnimanta = json['purnimanta'];
    amanta = json['amanta'];
    amantaId = json['amanta_id'];
    purnimantaId = json['purnimanta_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adhik_status'] = adhikStatus;
    data['purnimanta'] = purnimanta;
    data['amanta'] = amanta;
    data['amanta_id'] = amantaId;
    data['purnimanta_id'] = purnimantaId;
    return data;
  }
}

class NakShool {
  String? direction;
  String? remedies;

  NakShool({this.direction, this.remedies});

  NakShool.fromJson(Map<String, dynamic> json) {
    direction = json['direction'];
    remedies = json['remedies'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['direction'] = direction;
    data['remedies'] = remedies;
    return data;
  }
}

class AbhijitMuhurta {
  String? start;
  String? end;

  AbhijitMuhurta({this.start, this.end});

  AbhijitMuhurta.fromJson(Map<String, dynamic> json) {
    start = json['start'];
    end = json['end'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['start'] = start;
    data['end'] = end;
    return data;
  }
}

class Nakshatra {
  NakshatraDetails? nakshatraDetails;
  EndTime? endTime;

  Nakshatra({this.nakshatraDetails, this.endTime});

  Nakshatra.fromJson(Map<String, dynamic> json) {
    nakshatraDetails = NakshatraDetails.fromJson(json['details']);
    endTime =
        json['end_time'] != null ? EndTime.fromJson(json['end_time']) : null;
  }
}

class Yog {
  YogDetails? yogDetails;
  EndTime? endTime;

  Yog({this.yogDetails, this.endTime});

  Yog.fromJson(Map<String, dynamic> json) {
    yogDetails = YogDetails.fromJson(json['details']);
    endTime =
        json['end_time'] != null ? EndTime.fromJson(json['end_time']) : null;
  }
}

class Karan {
  KaranDetails? karanDetails;
  EndTime? endTime;

  Karan({this.karanDetails, this.endTime});

  Karan.fromJson(Map<String, dynamic> json) {
    karanDetails = KaranDetails.fromJson(json['details']);
    endTime =
        json['end_time'] != null ? EndTime.fromJson(json['end_time']) : null;
  }
}
