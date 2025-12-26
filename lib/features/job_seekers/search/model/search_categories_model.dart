class SearchCategoriesModel {
  final List<JobIndustries>? jobIndustries;
  final List<CareerLevels>? careerLevels;
  final List<WorkArrangements>? workArrangements;
  final List<JobTypes>? jobTypes;

  SearchCategoriesModel({
    this.jobIndustries,
    this.careerLevels,
    this.workArrangements,
    this.jobTypes,
  });

  factory SearchCategoriesModel.fromJson(Map<String, dynamic> json) {
    return SearchCategoriesModel(
      jobIndustries: (json['jobIndustries'] as List<dynamic>?)
          ?.map((e) => JobIndustries.fromJson(e))
          .toList(),
      careerLevels: (json['careerLevels'] as List<dynamic>?)
          ?.map((e) => CareerLevels.fromJson(e))
          .toList(),
      workArrangements: (json['workArrangements'] as List<dynamic>?)
          ?.map((e) => WorkArrangements.fromJson(e))
          .toList(),
      jobTypes: (json['jobTypes'] as List<dynamic>?)
          ?.map((e) => JobTypes.fromJson(e))
          .toList(),
    );
  }

}

class JobIndustries {
  final String? name;
  final int? count;

  JobIndustries({this.name, this.count});

  factory JobIndustries.fromJson(Map<String, dynamic> json) {
    return JobIndustries(
      name: json['name'] as String?,
      count: json['count'] as int?,
    );
  }
}
class CareerLevels {
  final String? name;
  final int? count;

  CareerLevels({this.name, this.count});

  factory CareerLevels.fromJson(Map<String, dynamic> json) {
    return CareerLevels(
      name: json['name'] as String?,
      count: json['count'] as int?,
    );
  }
}
class WorkArrangements {
  final String? name;
  final int? count;

  WorkArrangements({this.name, this.count});

  factory WorkArrangements.fromJson(Map<String, dynamic> json) {
    return WorkArrangements(
      name: json['name'] as String?,
      count: json['count'] as int?,
    );
  }
}
class JobTypes {
  final String? name;
  final int? count;

  JobTypes({this.name, this.count});

  factory JobTypes.fromJson(Map<String, dynamic> json) {
    return JobTypes(
      name: json['name'] as String?,
      count: json['count'] as int?,
    );
  }
}