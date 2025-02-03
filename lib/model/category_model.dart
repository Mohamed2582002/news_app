class CategoryModel {
  String id ;
  String title ;
  String imagePath ;

  CategoryModel({required this.title , required this.id ,
    required this.imagePath});

  static List<CategoryModel> getCategoriesList(bool isDark){
    return [
      CategoryModel(title: 'General', id: 'general',
          imagePath: !isDark? 'assets/images/general_image_light.png' : 'assets/images/general_dark.png') ,
      CategoryModel(title: 'Business', id: 'business',
          imagePath:  !isDark? 'assets/images/business_light.png' :  'assets/images/business_dark.png') ,
      CategoryModel(title: 'Sports', id: 'sports',
          imagePath: !isDark? 'assets/images/sports_light.png' :  'assets/images/sports_dark.png') ,
      CategoryModel(title: 'Technology', id: 'technology',
          imagePath: !isDark? 'assets/images/technology_light.png' :  'assets/images/technology_dark.png') ,
      CategoryModel(title: 'Entertainment', id: 'entertainment',
          imagePath:  !isDark? 'assets/images/enterainment_light.png' : 'assets/images/enterainment_dark.png') ,
      CategoryModel(title: 'Health', id: 'health',
          imagePath:  !isDark? 'assets/images/health_light.png' : 'assets/images/health_dark.png') ,
      CategoryModel(title: 'Science', id: 'science',
          imagePath: !isDark? 'assets/images/science_light.png' :  'assets/images/science_dark.png') ,


    ] ;
  }
}
