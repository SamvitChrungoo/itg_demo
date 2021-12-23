import 'package:itg_demo/model/astrologer_response.dart';

String getName(AstrologerResponse astrologer) {
  var astrologerName = '';
  astrologerName +=
      astrologer.namePrefix != null ? (astrologer.namePrefix! + ' ') : '';
  astrologerName +=
      astrologer.firstName != null ? (astrologer.firstName! + ' ') : '';
  astrologerName +=
      astrologer.lastName != null ? (astrologer.lastName! + ' ') : '';
  return astrologerName;
}

String getSkills(AstrologerResponse astrologer) {
  var skills = '';
  if (astrologer.skills!.isEmpty) {
    return 'Not Available';
  } else {
    astrologer.skills?.forEach((element) {
      skills = skills + element.name! + ', ';
    });
    return skills.substring(0, skills.length - 2);
  }
}

String getLanguage(AstrologerResponse astrologer) {
  var language = '';
  if (astrologer.languages!.isEmpty) {
    return 'Not Available';
  } else {
    astrologer.languages?.forEach((element) {
      language = language + element.name! + ', ';
    });
    return language.substring(0, language.length - 2);
  }
}

bool isImageValid(AstrologerResponse astrologer) =>
    astrologer.images!.large!.imageUrl!.endsWith('.jpg') ||
    astrologer.images!.large!.imageUrl!.endsWith('.png');
