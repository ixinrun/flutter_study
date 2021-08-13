import 'package:ehi_school/common/entitys/category_entity.dart';

categoryEntityFromJson(CategoryEntity data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['isDeleted'] != null) {
		data.isDeleted = json['isDeleted'] is String
				? int.tryParse(json['isDeleted'])
				: json['isDeleted'].toInt();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	return data;
}

Map<String, dynamic> categoryEntityToJson(CategoryEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['isDeleted'] = entity.isDeleted;
	data['name'] = entity.name;
	return data;
}