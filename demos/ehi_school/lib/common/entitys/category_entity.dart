import 'package:ehi_school/generated/json/base/json_convert_content.dart';

class CategoryEntity with JsonConvert<CategoryEntity> {
	int? id;
	int? isDeleted;
	String? name;
}
