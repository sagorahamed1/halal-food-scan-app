// To parse this JSON data, do
//
//     final foodModel = foodModelFromJson(jsonString);

import 'dart:convert';

FoodModel foodModelFromJson(String str) => FoodModel.fromJson(json.decode(str));

String foodModelToJson(FoodModel data) => json.encode(data.toJson());

class FoodModel {
  final String? code;
  final Product? product;
  final int? status;
  final String? statusVerbose;

  FoodModel({
    this.code,
    this.product,
    this.status,
    this.statusVerbose,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
    code: json["code"],
    product: json["product"] == null ? null : Product.fromJson(json["product"]),
    status: json["status"],
    statusVerbose: json["status_verbose"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "product": product?.toJson(),
    "status": status,
    "status_verbose": statusVerbose,
  };
}

class Product {
  final String? id;
  final List<String>? keywords;
  final List<dynamic>? addedCountriesTags;
  final String? allergens;
  final String? allergensFromIngredients;
  final String? allergensFromUser;
  final List<dynamic>? allergensHierarchy;
  final List<dynamic>? allergensTags;
  final String? brands;
  final List<String>? brandsTags;
  final CategoriesProperties? categoriesProperties;
  final List<String>? categoriesPropertiesTags;
  final List<dynamic>? checkersTags;
  final String? code;
  final List<String>? codesTags;
  final int? complete;
  final double? completeness;
  final List<String>? correctorsTags;
  final String? countries;
  final List<String>? countriesHierarchy;
  final List<String>? countriesTags;
  final int? createdT;
  final String? creator;
  final List<dynamic>? dataQualityBugsTags;
  final List<dynamic>? dataQualityErrorsTags;
  final List<String>? dataQualityInfoTags;
  final List<String>? dataQualityTags;
  final List<String>? dataQualityWarningsTags;
  final String? dataSources;
  final List<String>? dataSourcesTags;
  final EcoscoreData? ecoscoreData;
  final String? ecoscoreGrade;
  final List<String>? ecoscoreTags;
  final List<String>? editorsTags;
  final List<String>? entryDatesTags;
  final List<dynamic>? foodGroupsTags;
  final String? productId;
  final String? imageFrontSmallUrl;
  final String? imageFrontThumbUrl;
  final String? imageFrontUrl;
  final String? imageIngredientsSmallUrl;
  final String? imageIngredientsThumbUrl;
  final String? imageIngredientsUrl;
  final String? imageSmallUrl;
  final String? imageThumbUrl;
  final String? imageUrl;
  final Images? images;
  final List<String>? informersTags;
  final String? ingredientsLc;
  final String? interfaceVersionCreated;
  final String? interfaceVersionModified;
  final String? labels;
  final List<String>? labelsHierarchy;
  final String? labelsLc;
  final String? labelsOld;
  final List<String>? labelsTags;
  final String? lang;
  final Languages? languages;
  final LanguagesCodes? languagesCodes;
  final List<String>? languagesHierarchy;
  final List<String>? languagesTags;
  final List<String>? lastEditDatesTags;
  final String? lastEditor;
  final List<String>? lastImageDatesTags;
  final int? lastImageT;
  final String? lastModifiedBy;
  final int? lastModifiedT;
  final int? lastUpdatedT;
  final String? lc;
  final List<dynamic>? mainCountriesTags;
  final String? maxImgid;
  final List<String>? miscTags;
  final String? noNutritionData;
  final String? novaGroupDebug;
  final String? novaGroupError;
  final List<String>? novaGroupsTags;
  final CategoriesProperties? nutrientLevels;
  final List<dynamic>? nutrientLevelsTags;
  final CategoriesProperties? nutriments;
  final Map<String, Nutriscore>? nutriscore;
  final List<String>? nutriscore2021Tags;
  final List<String>? nutriscore2023Tags;
  final String? nutriscoreGrade;
  final List<String>? nutriscoreTags;
  final String? nutriscoreVersion;
  final String? nutritionData;
  final String? nutritionDataPer;
  final String? nutritionDataPreparedPer;
  final String? nutritionGradeFr;
  final String? nutritionGrades;
  final List<String>? nutritionGradesTags;
  final int? nutritionScoreBeverage;
  final String? nutritionScoreDebug;
  final int? nutritionScoreWarningNoFiber;
  final int? nutritionScoreWarningNoFruitsVegetablesNuts;
  final List<dynamic>? packagingMaterialsTags;
  final List<dynamic>? packagingRecyclingTags;
  final List<dynamic>? packagingShapesTags;
  final List<dynamic>? packagings;
  final CategoriesProperties? packagingsMaterials;
  final List<String>? photographersTags;
  final String? pnnsGroups1;
  final List<String>? pnnsGroups1Tags;
  final String? pnnsGroups2;
  final List<String>? pnnsGroups2Tags;
  final int? popularityKey;
  final List<String>? popularityTags;
  final String? productName;
  final String? productNameEn;
  final String? productQuantity;
  final String? productType;
  final String? quantity;
  final List<dynamic>? removedCountriesTags;
  final int? rev;
  final int? scansN;
  final SelectedImages? selectedImages;
  final String? states;
  final List<String>? statesHierarchy;
  final List<String>? statesTags;
  final String? traces;
  final String? tracesFromIngredients;
  final String? tracesFromUser;
  final List<dynamic>? tracesHierarchy;
  final List<dynamic>? tracesTags;
  final int? uniqueScansN;
  final List<dynamic>? unknownNutrientsTags;
  final String? updateKey;
  final List<dynamic>? weighersTags;

  Product({
    this.id,
    this.keywords,
    this.addedCountriesTags,
    this.allergens,
    this.allergensFromIngredients,
    this.allergensFromUser,
    this.allergensHierarchy,
    this.allergensTags,
    this.brands,
    this.brandsTags,
    this.categoriesProperties,
    this.categoriesPropertiesTags,
    this.checkersTags,
    this.code,
    this.codesTags,
    this.complete,
    this.completeness,
    this.correctorsTags,
    this.countries,
    this.countriesHierarchy,
    this.countriesTags,
    this.createdT,
    this.creator,
    this.dataQualityBugsTags,
    this.dataQualityErrorsTags,
    this.dataQualityInfoTags,
    this.dataQualityTags,
    this.dataQualityWarningsTags,
    this.dataSources,
    this.dataSourcesTags,
    this.ecoscoreData,
    this.ecoscoreGrade,
    this.ecoscoreTags,
    this.editorsTags,
    this.entryDatesTags,
    this.foodGroupsTags,
    this.productId,
    this.imageFrontSmallUrl,
    this.imageFrontThumbUrl,
    this.imageFrontUrl,
    this.imageIngredientsSmallUrl,
    this.imageIngredientsThumbUrl,
    this.imageIngredientsUrl,
    this.imageSmallUrl,
    this.imageThumbUrl,
    this.imageUrl,
    this.images,
    this.informersTags,
    this.ingredientsLc,
    this.interfaceVersionCreated,
    this.interfaceVersionModified,
    this.labels,
    this.labelsHierarchy,
    this.labelsLc,
    this.labelsOld,
    this.labelsTags,
    this.lang,
    this.languages,
    this.languagesCodes,
    this.languagesHierarchy,
    this.languagesTags,
    this.lastEditDatesTags,
    this.lastEditor,
    this.lastImageDatesTags,
    this.lastImageT,
    this.lastModifiedBy,
    this.lastModifiedT,
    this.lastUpdatedT,
    this.lc,
    this.mainCountriesTags,
    this.maxImgid,
    this.miscTags,
    this.noNutritionData,
    this.novaGroupDebug,
    this.novaGroupError,
    this.novaGroupsTags,
    this.nutrientLevels,
    this.nutrientLevelsTags,
    this.nutriments,
    this.nutriscore,
    this.nutriscore2021Tags,
    this.nutriscore2023Tags,
    this.nutriscoreGrade,
    this.nutriscoreTags,
    this.nutriscoreVersion,
    this.nutritionData,
    this.nutritionDataPer,
    this.nutritionDataPreparedPer,
    this.nutritionGradeFr,
    this.nutritionGrades,
    this.nutritionGradesTags,
    this.nutritionScoreBeverage,
    this.nutritionScoreDebug,
    this.nutritionScoreWarningNoFiber,
    this.nutritionScoreWarningNoFruitsVegetablesNuts,
    this.packagingMaterialsTags,
    this.packagingRecyclingTags,
    this.packagingShapesTags,
    this.packagings,
    this.packagingsMaterials,
    this.photographersTags,
    this.pnnsGroups1,
    this.pnnsGroups1Tags,
    this.pnnsGroups2,
    this.pnnsGroups2Tags,
    this.popularityKey,
    this.popularityTags,
    this.productName,
    this.productNameEn,
    this.productQuantity,
    this.productType,
    this.quantity,
    this.removedCountriesTags,
    this.rev,
    this.scansN,
    this.selectedImages,
    this.states,
    this.statesHierarchy,
    this.statesTags,
    this.traces,
    this.tracesFromIngredients,
    this.tracesFromUser,
    this.tracesHierarchy,
    this.tracesTags,
    this.uniqueScansN,
    this.unknownNutrientsTags,
    this.updateKey,
    this.weighersTags,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["_id"],
    keywords: json["_keywords"] == null ? [] : List<String>.from(json["_keywords"]!.map((x) => x)),
    addedCountriesTags: json["added_countries_tags"] == null ? [] : List<dynamic>.from(json["added_countries_tags"]!.map((x) => x)),
    allergens: json["allergens"],
    allergensFromIngredients: json["allergens_from_ingredients"],
    allergensFromUser: json["allergens_from_user"],
    allergensHierarchy: json["allergens_hierarchy"] == null ? [] : List<dynamic>.from(json["allergens_hierarchy"]!.map((x) => x)),
    allergensTags: json["allergens_tags"] == null ? [] : List<dynamic>.from(json["allergens_tags"]!.map((x) => x)),
    brands: json["brands"],
    brandsTags: json["brands_tags"] == null ? [] : List<String>.from(json["brands_tags"]!.map((x) => x)),
    categoriesProperties: json["categories_properties"] == null ? null : CategoriesProperties.fromJson(json["categories_properties"]),
    categoriesPropertiesTags: json["categories_properties_tags"] == null ? [] : List<String>.from(json["categories_properties_tags"]!.map((x) => x)),
    checkersTags: json["checkers_tags"] == null ? [] : List<dynamic>.from(json["checkers_tags"]!.map((x) => x)),
    code: json["code"],
    codesTags: json["codes_tags"] == null ? [] : List<String>.from(json["codes_tags"]!.map((x) => x)),
    complete: json["complete"],
    completeness: json["completeness"]?.toDouble(),
    correctorsTags: json["correctors_tags"] == null ? [] : List<String>.from(json["correctors_tags"]!.map((x) => x)),
    countries: json["countries"],
    countriesHierarchy: json["countries_hierarchy"] == null ? [] : List<String>.from(json["countries_hierarchy"]!.map((x) => x)),
    countriesTags: json["countries_tags"] == null ? [] : List<String>.from(json["countries_tags"]!.map((x) => x)),
    createdT: json["created_t"],
    creator: json["creator"],
    dataQualityBugsTags: json["data_quality_bugs_tags"] == null ? [] : List<dynamic>.from(json["data_quality_bugs_tags"]!.map((x) => x)),
    dataQualityErrorsTags: json["data_quality_errors_tags"] == null ? [] : List<dynamic>.from(json["data_quality_errors_tags"]!.map((x) => x)),
    dataQualityInfoTags: json["data_quality_info_tags"] == null ? [] : List<String>.from(json["data_quality_info_tags"]!.map((x) => x)),
    dataQualityTags: json["data_quality_tags"] == null ? [] : List<String>.from(json["data_quality_tags"]!.map((x) => x)),
    dataQualityWarningsTags: json["data_quality_warnings_tags"] == null ? [] : List<String>.from(json["data_quality_warnings_tags"]!.map((x) => x)),
    dataSources: json["data_sources"],
    dataSourcesTags: json["data_sources_tags"] == null ? [] : List<String>.from(json["data_sources_tags"]!.map((x) => x)),
    ecoscoreData: json["ecoscore_data"] == null ? null : EcoscoreData.fromJson(json["ecoscore_data"]),
    ecoscoreGrade: json["ecoscore_grade"],
    ecoscoreTags: json["ecoscore_tags"] == null ? [] : List<String>.from(json["ecoscore_tags"]!.map((x) => x)),
    editorsTags: json["editors_tags"] == null ? [] : List<String>.from(json["editors_tags"]!.map((x) => x)),
    entryDatesTags: json["entry_dates_tags"] == null ? [] : List<String>.from(json["entry_dates_tags"]!.map((x) => x)),
    foodGroupsTags: json["food_groups_tags"] == null ? [] : List<dynamic>.from(json["food_groups_tags"]!.map((x) => x)),
    productId: json["id"],
    imageFrontSmallUrl: json["image_front_small_url"],
    imageFrontThumbUrl: json["image_front_thumb_url"],
    imageFrontUrl: json["image_front_url"],
    imageIngredientsSmallUrl: json["image_ingredients_small_url"],
    imageIngredientsThumbUrl: json["image_ingredients_thumb_url"],
    imageIngredientsUrl: json["image_ingredients_url"],
    imageSmallUrl: json["image_small_url"],
    imageThumbUrl: json["image_thumb_url"],
    imageUrl: json["image_url"],
    images: json["images"] == null ? null : Images.fromJson(json["images"]),
    informersTags: json["informers_tags"] == null ? [] : List<String>.from(json["informers_tags"]!.map((x) => x)),
    ingredientsLc: json["ingredients_lc"],
    interfaceVersionCreated: json["interface_version_created"],
    interfaceVersionModified: json["interface_version_modified"],
    labels: json["labels"],
    labelsHierarchy: json["labels_hierarchy"] == null ? [] : List<String>.from(json["labels_hierarchy"]!.map((x) => x)),
    labelsLc: json["labels_lc"],
    labelsOld: json["labels_old"],
    labelsTags: json["labels_tags"] == null ? [] : List<String>.from(json["labels_tags"]!.map((x) => x)),
    lang: json["lang"],
    languages: json["languages"] == null ? null : Languages.fromJson(json["languages"]),
    languagesCodes: json["languages_codes"] == null ? null : LanguagesCodes.fromJson(json["languages_codes"]),
    languagesHierarchy: json["languages_hierarchy"] == null ? [] : List<String>.from(json["languages_hierarchy"]!.map((x) => x)),
    languagesTags: json["languages_tags"] == null ? [] : List<String>.from(json["languages_tags"]!.map((x) => x)),
    lastEditDatesTags: json["last_edit_dates_tags"] == null ? [] : List<String>.from(json["last_edit_dates_tags"]!.map((x) => x)),
    lastEditor: json["last_editor"],
    lastImageDatesTags: json["last_image_dates_tags"] == null ? [] : List<String>.from(json["last_image_dates_tags"]!.map((x) => x)),
    lastImageT: json["last_image_t"],
    lastModifiedBy: json["last_modified_by"],
    lastModifiedT: json["last_modified_t"],
    lastUpdatedT: json["last_updated_t"],
    lc: json["lc"],
    mainCountriesTags: json["main_countries_tags"] == null ? [] : List<dynamic>.from(json["main_countries_tags"]!.map((x) => x)),
    maxImgid: json["max_imgid"],
    miscTags: json["misc_tags"] == null ? [] : List<String>.from(json["misc_tags"]!.map((x) => x)),
    noNutritionData: json["no_nutrition_data"],
    novaGroupDebug: json["nova_group_debug"],
    novaGroupError: json["nova_group_error"],
    novaGroupsTags: json["nova_groups_tags"] == null ? [] : List<String>.from(json["nova_groups_tags"]!.map((x) => x)),
    nutrientLevels: json["nutrient_levels"] == null ? null : CategoriesProperties.fromJson(json["nutrient_levels"]),
    nutrientLevelsTags: json["nutrient_levels_tags"] == null ? [] : List<dynamic>.from(json["nutrient_levels_tags"]!.map((x) => x)),
    nutriments: json["nutriments"] == null ? null : CategoriesProperties.fromJson(json["nutriments"]),
    nutriscore: Map.from(json["nutriscore"]!).map((k, v) => MapEntry<String, Nutriscore>(k, Nutriscore.fromJson(v))),
    nutriscore2021Tags: json["nutriscore_2021_tags"] == null ? [] : List<String>.from(json["nutriscore_2021_tags"]!.map((x) => x)),
    nutriscore2023Tags: json["nutriscore_2023_tags"] == null ? [] : List<String>.from(json["nutriscore_2023_tags"]!.map((x) => x)),
    nutriscoreGrade: json["nutriscore_grade"],
    nutriscoreTags: json["nutriscore_tags"] == null ? [] : List<String>.from(json["nutriscore_tags"]!.map((x) => x)),
    nutriscoreVersion: json["nutriscore_version"],
    nutritionData: json["nutrition_data"],
    nutritionDataPer: json["nutrition_data_per"],
    nutritionDataPreparedPer: json["nutrition_data_prepared_per"],
    nutritionGradeFr: json["nutrition_grade_fr"],
    nutritionGrades: json["nutrition_grades"],
    nutritionGradesTags: json["nutrition_grades_tags"] == null ? [] : List<String>.from(json["nutrition_grades_tags"]!.map((x) => x)),
    nutritionScoreBeverage: json["nutrition_score_beverage"],
    nutritionScoreDebug: json["nutrition_score_debug"],
    nutritionScoreWarningNoFiber: json["nutrition_score_warning_no_fiber"],
    nutritionScoreWarningNoFruitsVegetablesNuts: json["nutrition_score_warning_no_fruits_vegetables_nuts"],
    packagingMaterialsTags: json["packaging_materials_tags"] == null ? [] : List<dynamic>.from(json["packaging_materials_tags"]!.map((x) => x)),
    packagingRecyclingTags: json["packaging_recycling_tags"] == null ? [] : List<dynamic>.from(json["packaging_recycling_tags"]!.map((x) => x)),
    packagingShapesTags: json["packaging_shapes_tags"] == null ? [] : List<dynamic>.from(json["packaging_shapes_tags"]!.map((x) => x)),
    packagings: json["packagings"] == null ? [] : List<dynamic>.from(json["packagings"]!.map((x) => x)),
    packagingsMaterials: json["packagings_materials"] == null ? null : CategoriesProperties.fromJson(json["packagings_materials"]),
    photographersTags: json["photographers_tags"] == null ? [] : List<String>.from(json["photographers_tags"]!.map((x) => x)),
    pnnsGroups1: json["pnns_groups_1"],
    pnnsGroups1Tags: json["pnns_groups_1_tags"] == null ? [] : List<String>.from(json["pnns_groups_1_tags"]!.map((x) => x)),
    pnnsGroups2: json["pnns_groups_2"],
    pnnsGroups2Tags: json["pnns_groups_2_tags"] == null ? [] : List<String>.from(json["pnns_groups_2_tags"]!.map((x) => x)),
    popularityKey: json["popularity_key"],
    popularityTags: json["popularity_tags"] == null ? [] : List<String>.from(json["popularity_tags"]!.map((x) => x)),
    productName: json["product_name"],
    productNameEn: json["product_name_en"],
    productQuantity: json["product_quantity"],
    productType: json["product_type"],
    quantity: json["quantity"],
    removedCountriesTags: json["removed_countries_tags"] == null ? [] : List<dynamic>.from(json["removed_countries_tags"]!.map((x) => x)),
    rev: json["rev"],
    scansN: json["scans_n"],
    selectedImages: json["selected_images"] == null ? null : SelectedImages.fromJson(json["selected_images"]),
    states: json["states"],
    statesHierarchy: json["states_hierarchy"] == null ? [] : List<String>.from(json["states_hierarchy"]!.map((x) => x)),
    statesTags: json["states_tags"] == null ? [] : List<String>.from(json["states_tags"]!.map((x) => x)),
    traces: json["traces"],
    tracesFromIngredients: json["traces_from_ingredients"],
    tracesFromUser: json["traces_from_user"],
    tracesHierarchy: json["traces_hierarchy"] == null ? [] : List<dynamic>.from(json["traces_hierarchy"]!.map((x) => x)),
    tracesTags: json["traces_tags"] == null ? [] : List<dynamic>.from(json["traces_tags"]!.map((x) => x)),
    uniqueScansN: json["unique_scans_n"],
    unknownNutrientsTags: json["unknown_nutrients_tags"] == null ? [] : List<dynamic>.from(json["unknown_nutrients_tags"]!.map((x) => x)),
    updateKey: json["update_key"],
    weighersTags: json["weighers_tags"] == null ? [] : List<dynamic>.from(json["weighers_tags"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "_keywords": keywords == null ? [] : List<dynamic>.from(keywords!.map((x) => x)),
    "added_countries_tags": addedCountriesTags == null ? [] : List<dynamic>.from(addedCountriesTags!.map((x) => x)),
    "allergens": allergens,
    "allergens_from_ingredients": allergensFromIngredients,
    "allergens_from_user": allergensFromUser,
    "allergens_hierarchy": allergensHierarchy == null ? [] : List<dynamic>.from(allergensHierarchy!.map((x) => x)),
    "allergens_tags": allergensTags == null ? [] : List<dynamic>.from(allergensTags!.map((x) => x)),
    "brands": brands,
    "brands_tags": brandsTags == null ? [] : List<dynamic>.from(brandsTags!.map((x) => x)),
    "categories_properties": categoriesProperties?.toJson(),
    "categories_properties_tags": categoriesPropertiesTags == null ? [] : List<dynamic>.from(categoriesPropertiesTags!.map((x) => x)),
    "checkers_tags": checkersTags == null ? [] : List<dynamic>.from(checkersTags!.map((x) => x)),
    "code": code,
    "codes_tags": codesTags == null ? [] : List<dynamic>.from(codesTags!.map((x) => x)),
    "complete": complete,
    "completeness": completeness,
    "correctors_tags": correctorsTags == null ? [] : List<dynamic>.from(correctorsTags!.map((x) => x)),
    "countries": countries,
    "countries_hierarchy": countriesHierarchy == null ? [] : List<dynamic>.from(countriesHierarchy!.map((x) => x)),
    "countries_tags": countriesTags == null ? [] : List<dynamic>.from(countriesTags!.map((x) => x)),
    "created_t": createdT,
    "creator": creator,
    "data_quality_bugs_tags": dataQualityBugsTags == null ? [] : List<dynamic>.from(dataQualityBugsTags!.map((x) => x)),
    "data_quality_errors_tags": dataQualityErrorsTags == null ? [] : List<dynamic>.from(dataQualityErrorsTags!.map((x) => x)),
    "data_quality_info_tags": dataQualityInfoTags == null ? [] : List<dynamic>.from(dataQualityInfoTags!.map((x) => x)),
    "data_quality_tags": dataQualityTags == null ? [] : List<dynamic>.from(dataQualityTags!.map((x) => x)),
    "data_quality_warnings_tags": dataQualityWarningsTags == null ? [] : List<dynamic>.from(dataQualityWarningsTags!.map((x) => x)),
    "data_sources": dataSources,
    "data_sources_tags": dataSourcesTags == null ? [] : List<dynamic>.from(dataSourcesTags!.map((x) => x)),
    "ecoscore_data": ecoscoreData?.toJson(),
    "ecoscore_grade": ecoscoreGrade,
    "ecoscore_tags": ecoscoreTags == null ? [] : List<dynamic>.from(ecoscoreTags!.map((x) => x)),
    "editors_tags": editorsTags == null ? [] : List<dynamic>.from(editorsTags!.map((x) => x)),
    "entry_dates_tags": entryDatesTags == null ? [] : List<dynamic>.from(entryDatesTags!.map((x) => x)),
    "food_groups_tags": foodGroupsTags == null ? [] : List<dynamic>.from(foodGroupsTags!.map((x) => x)),
    "id": productId,
    "image_front_small_url": imageFrontSmallUrl,
    "image_front_thumb_url": imageFrontThumbUrl,
    "image_front_url": imageFrontUrl,
    "image_ingredients_small_url": imageIngredientsSmallUrl,
    "image_ingredients_thumb_url": imageIngredientsThumbUrl,
    "image_ingredients_url": imageIngredientsUrl,
    "image_small_url": imageSmallUrl,
    "image_thumb_url": imageThumbUrl,
    "image_url": imageUrl,
    "images": images?.toJson(),
    "informers_tags": informersTags == null ? [] : List<dynamic>.from(informersTags!.map((x) => x)),
    "ingredients_lc": ingredientsLc,
    "interface_version_created": interfaceVersionCreated,
    "interface_version_modified": interfaceVersionModified,
    "labels": labels,
    "labels_hierarchy": labelsHierarchy == null ? [] : List<dynamic>.from(labelsHierarchy!.map((x) => x)),
    "labels_lc": labelsLc,
    "labels_old": labelsOld,
    "labels_tags": labelsTags == null ? [] : List<dynamic>.from(labelsTags!.map((x) => x)),
    "lang": lang,
    "languages": languages?.toJson(),
    "languages_codes": languagesCodes?.toJson(),
    "languages_hierarchy": languagesHierarchy == null ? [] : List<dynamic>.from(languagesHierarchy!.map((x) => x)),
    "languages_tags": languagesTags == null ? [] : List<dynamic>.from(languagesTags!.map((x) => x)),
    "last_edit_dates_tags": lastEditDatesTags == null ? [] : List<dynamic>.from(lastEditDatesTags!.map((x) => x)),
    "last_editor": lastEditor,
    "last_image_dates_tags": lastImageDatesTags == null ? [] : List<dynamic>.from(lastImageDatesTags!.map((x) => x)),
    "last_image_t": lastImageT,
    "last_modified_by": lastModifiedBy,
    "last_modified_t": lastModifiedT,
    "last_updated_t": lastUpdatedT,
    "lc": lc,
    "main_countries_tags": mainCountriesTags == null ? [] : List<dynamic>.from(mainCountriesTags!.map((x) => x)),
    "max_imgid": maxImgid,
    "misc_tags": miscTags == null ? [] : List<dynamic>.from(miscTags!.map((x) => x)),
    "no_nutrition_data": noNutritionData,
    "nova_group_debug": novaGroupDebug,
    "nova_group_error": novaGroupError,
    "nova_groups_tags": novaGroupsTags == null ? [] : List<dynamic>.from(novaGroupsTags!.map((x) => x)),
    "nutrient_levels": nutrientLevels?.toJson(),
    "nutrient_levels_tags": nutrientLevelsTags == null ? [] : List<dynamic>.from(nutrientLevelsTags!.map((x) => x)),
    "nutriments": nutriments?.toJson(),
    "nutriscore": Map.from(nutriscore!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "nutriscore_2021_tags": nutriscore2021Tags == null ? [] : List<dynamic>.from(nutriscore2021Tags!.map((x) => x)),
    "nutriscore_2023_tags": nutriscore2023Tags == null ? [] : List<dynamic>.from(nutriscore2023Tags!.map((x) => x)),
    "nutriscore_grade": nutriscoreGrade,
    "nutriscore_tags": nutriscoreTags == null ? [] : List<dynamic>.from(nutriscoreTags!.map((x) => x)),
    "nutriscore_version": nutriscoreVersion,
    "nutrition_data": nutritionData,
    "nutrition_data_per": nutritionDataPer,
    "nutrition_data_prepared_per": nutritionDataPreparedPer,
    "nutrition_grade_fr": nutritionGradeFr,
    "nutrition_grades": nutritionGrades,
    "nutrition_grades_tags": nutritionGradesTags == null ? [] : List<dynamic>.from(nutritionGradesTags!.map((x) => x)),
    "nutrition_score_beverage": nutritionScoreBeverage,
    "nutrition_score_debug": nutritionScoreDebug,
    "nutrition_score_warning_no_fiber": nutritionScoreWarningNoFiber,
    "nutrition_score_warning_no_fruits_vegetables_nuts": nutritionScoreWarningNoFruitsVegetablesNuts,
    "packaging_materials_tags": packagingMaterialsTags == null ? [] : List<dynamic>.from(packagingMaterialsTags!.map((x) => x)),
    "packaging_recycling_tags": packagingRecyclingTags == null ? [] : List<dynamic>.from(packagingRecyclingTags!.map((x) => x)),
    "packaging_shapes_tags": packagingShapesTags == null ? [] : List<dynamic>.from(packagingShapesTags!.map((x) => x)),
    "packagings": packagings == null ? [] : List<dynamic>.from(packagings!.map((x) => x)),
    "packagings_materials": packagingsMaterials?.toJson(),
    "photographers_tags": photographersTags == null ? [] : List<dynamic>.from(photographersTags!.map((x) => x)),
    "pnns_groups_1": pnnsGroups1,
    "pnns_groups_1_tags": pnnsGroups1Tags == null ? [] : List<dynamic>.from(pnnsGroups1Tags!.map((x) => x)),
    "pnns_groups_2": pnnsGroups2,
    "pnns_groups_2_tags": pnnsGroups2Tags == null ? [] : List<dynamic>.from(pnnsGroups2Tags!.map((x) => x)),
    "popularity_key": popularityKey,
    "popularity_tags": popularityTags == null ? [] : List<dynamic>.from(popularityTags!.map((x) => x)),
    "product_name": productName,
    "product_name_en": productNameEn,
    "product_quantity": productQuantity,
    "product_type": productType,
    "quantity": quantity,
    "removed_countries_tags": removedCountriesTags == null ? [] : List<dynamic>.from(removedCountriesTags!.map((x) => x)),
    "rev": rev,
    "scans_n": scansN,
    "selected_images": selectedImages?.toJson(),
    "states": states,
    "states_hierarchy": statesHierarchy == null ? [] : List<dynamic>.from(statesHierarchy!.map((x) => x)),
    "states_tags": statesTags == null ? [] : List<dynamic>.from(statesTags!.map((x) => x)),
    "traces": traces,
    "traces_from_ingredients": tracesFromIngredients,
    "traces_from_user": tracesFromUser,
    "traces_hierarchy": tracesHierarchy == null ? [] : List<dynamic>.from(tracesHierarchy!.map((x) => x)),
    "traces_tags": tracesTags == null ? [] : List<dynamic>.from(tracesTags!.map((x) => x)),
    "unique_scans_n": uniqueScansN,
    "unknown_nutrients_tags": unknownNutrientsTags == null ? [] : List<dynamic>.from(unknownNutrientsTags!.map((x) => x)),
    "update_key": updateKey,
    "weighers_tags": weighersTags == null ? [] : List<dynamic>.from(weighersTags!.map((x) => x)),
  };
}

class CategoriesProperties {
  CategoriesProperties();

  factory CategoriesProperties.fromJson(Map<String, dynamic> json) => CategoriesProperties(
  );

  Map<String, dynamic> toJson() => {
  };
}

class EcoscoreData {
  final Adjustments? adjustments;
  final Agribalyse? agribalyse;
  final Missing? missing;
  final int? missingAgribalyseMatchWarning;
  final int? missingKeyData;
  final CategoriesProperties? scores;
  final String? status;

  EcoscoreData({
    this.adjustments,
    this.agribalyse,
    this.missing,
    this.missingAgribalyseMatchWarning,
    this.missingKeyData,
    this.scores,
    this.status,
  });

  factory EcoscoreData.fromJson(Map<String, dynamic> json) => EcoscoreData(
    adjustments: json["adjustments"] == null ? null : Adjustments.fromJson(json["adjustments"]),
    agribalyse: json["agribalyse"] == null ? null : Agribalyse.fromJson(json["agribalyse"]),
    missing: json["missing"] == null ? null : Missing.fromJson(json["missing"]),
    missingAgribalyseMatchWarning: json["missing_agribalyse_match_warning"],
    missingKeyData: json["missing_key_data"],
    scores: json["scores"] == null ? null : CategoriesProperties.fromJson(json["scores"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "adjustments": adjustments?.toJson(),
    "agribalyse": agribalyse?.toJson(),
    "missing": missing?.toJson(),
    "missing_agribalyse_match_warning": missingAgribalyseMatchWarning,
    "missing_key_data": missingKeyData,
    "scores": scores?.toJson(),
    "status": status,
  };
}

class Adjustments {
  final OriginsOfIngredients? originsOfIngredients;
  final Packaging? packaging;
  final ProductionSystem? productionSystem;
  final Agribalyse? threatenedSpecies;

  Adjustments({
    this.originsOfIngredients,
    this.packaging,
    this.productionSystem,
    this.threatenedSpecies,
  });

  factory Adjustments.fromJson(Map<String, dynamic> json) => Adjustments(
    originsOfIngredients: json["origins_of_ingredients"] == null ? null : OriginsOfIngredients.fromJson(json["origins_of_ingredients"]),
    packaging: json["packaging"] == null ? null : Packaging.fromJson(json["packaging"]),
    productionSystem: json["production_system"] == null ? null : ProductionSystem.fromJson(json["production_system"]),
    threatenedSpecies: json["threatened_species"] == null ? null : Agribalyse.fromJson(json["threatened_species"]),
  );

  Map<String, dynamic> toJson() => {
    "origins_of_ingredients": originsOfIngredients?.toJson(),
    "packaging": packaging?.toJson(),
    "production_system": productionSystem?.toJson(),
    "threatened_species": threatenedSpecies?.toJson(),
  };
}

class OriginsOfIngredients {
  final List<AggregatedOrigin>? aggregatedOrigins;
  final int? epiScore;
  final int? epiValue;
  final List<String>? originsFromCategories;
  final List<String>? originsFromOriginsField;
  final int? transportationScore;
  final Map<String, int>? transportationScores;
  final int? transportationValue;
  final Map<String, int>? transportationValues;
  final int? value;
  final Map<String, int>? values;
  final String? warning;

  OriginsOfIngredients({
    this.aggregatedOrigins,
    this.epiScore,
    this.epiValue,
    this.originsFromCategories,
    this.originsFromOriginsField,
    this.transportationScore,
    this.transportationScores,
    this.transportationValue,
    this.transportationValues,
    this.value,
    this.values,
    this.warning,
  });

  factory OriginsOfIngredients.fromJson(Map<String, dynamic> json) => OriginsOfIngredients(
    aggregatedOrigins: json["aggregated_origins"] == null ? [] : List<AggregatedOrigin>.from(json["aggregated_origins"]!.map((x) => AggregatedOrigin.fromJson(x))),
    epiScore: json["epi_score"],
    epiValue: json["epi_value"],
    originsFromCategories: json["origins_from_categories"] == null ? [] : List<String>.from(json["origins_from_categories"]!.map((x) => x)),
    originsFromOriginsField: json["origins_from_origins_field"] == null ? [] : List<String>.from(json["origins_from_origins_field"]!.map((x) => x)),
    transportationScore: json["transportation_score"],
    transportationScores: Map.from(json["transportation_scores"]!).map((k, v) => MapEntry<String, int>(k, v)),
    transportationValue: json["transportation_value"],
    transportationValues: Map.from(json["transportation_values"]!).map((k, v) => MapEntry<String, int>(k, v)),
    value: json["value"],
    values: Map.from(json["values"]!).map((k, v) => MapEntry<String, int>(k, v)),
    warning: json["warning"],
  );

  Map<String, dynamic> toJson() => {
    "aggregated_origins": aggregatedOrigins == null ? [] : List<dynamic>.from(aggregatedOrigins!.map((x) => x.toJson())),
    "epi_score": epiScore,
    "epi_value": epiValue,
    "origins_from_categories": originsFromCategories == null ? [] : List<dynamic>.from(originsFromCategories!.map((x) => x)),
    "origins_from_origins_field": originsFromOriginsField == null ? [] : List<dynamic>.from(originsFromOriginsField!.map((x) => x)),
    "transportation_score": transportationScore,
    "transportation_scores": Map.from(transportationScores!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "transportation_value": transportationValue,
    "transportation_values": Map.from(transportationValues!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "value": value,
    "values": Map.from(values!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "warning": warning,
  };
}

class AggregatedOrigin {
  final int? epiScore;
  final String? origin;
  final int? percent;
  final int? transportationScore;

  AggregatedOrigin({
    this.epiScore,
    this.origin,
    this.percent,
    this.transportationScore,
  });

  factory AggregatedOrigin.fromJson(Map<String, dynamic> json) => AggregatedOrigin(
    epiScore: json["epi_score"],
    origin: json["origin"],
    percent: json["percent"],
    transportationScore: json["transportation_score"],
  );

  Map<String, dynamic> toJson() => {
    "epi_score": epiScore,
    "origin": origin,
    "percent": percent,
    "transportation_score": transportationScore,
  };
}

class Packaging {
  final int? nonRecyclableAndNonBiodegradableMaterials;
  final int? value;
  final String? warning;

  Packaging({
    this.nonRecyclableAndNonBiodegradableMaterials,
    this.value,
    this.warning,
  });

  factory Packaging.fromJson(Map<String, dynamic> json) => Packaging(
    nonRecyclableAndNonBiodegradableMaterials: json["non_recyclable_and_non_biodegradable_materials"],
    value: json["value"],
    warning: json["warning"],
  );

  Map<String, dynamic> toJson() => {
    "non_recyclable_and_non_biodegradable_materials": nonRecyclableAndNonBiodegradableMaterials,
    "value": value,
    "warning": warning,
  };
}

class ProductionSystem {
  final List<dynamic>? labels;
  final int? value;
  final String? warning;

  ProductionSystem({
    this.labels,
    this.value,
    this.warning,
  });

  factory ProductionSystem.fromJson(Map<String, dynamic> json) => ProductionSystem(
    labels: json["labels"] == null ? [] : List<dynamic>.from(json["labels"]!.map((x) => x)),
    value: json["value"],
    warning: json["warning"],
  );

  Map<String, dynamic> toJson() => {
    "labels": labels == null ? [] : List<dynamic>.from(labels!.map((x) => x)),
    "value": value,
    "warning": warning,
  };
}

class Agribalyse {
  final String? warning;

  Agribalyse({
    this.warning,
  });

  factory Agribalyse.fromJson(Map<String, dynamic> json) => Agribalyse(
    warning: json["warning"],
  );

  Map<String, dynamic> toJson() => {
    "warning": warning,
  };
}

class Missing {
  final int? categories;
  final int? ingredients;
  final int? labels;
  final int? origins;
  final int? packagings;

  Missing({
    this.categories,
    this.ingredients,
    this.labels,
    this.origins,
    this.packagings,
  });

  factory Missing.fromJson(Map<String, dynamic> json) => Missing(
    categories: json["categories"],
    ingredients: json["ingredients"],
    labels: json["labels"],
    origins: json["origins"],
    packagings: json["packagings"],
  );

  Map<String, dynamic> toJson() => {
    "categories": categories,
    "ingredients": ingredients,
    "labels": labels,
    "origins": origins,
    "packagings": packagings,
  };
}

class Images {
  final The1? the1;
  final The1? the2;
  final En? frontEn;
  final En? ingredientsEn;

  Images({
    this.the1,
    this.the2,
    this.frontEn,
    this.ingredientsEn,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    the1: json["1"] == null ? null : The1.fromJson(json["1"]),
    the2: json["2"] == null ? null : The1.fromJson(json["2"]),
    frontEn: json["front_en"] == null ? null : En.fromJson(json["front_en"]),
    ingredientsEn: json["ingredients_en"] == null ? null : En.fromJson(json["ingredients_en"]),
  );

  Map<String, dynamic> toJson() => {
    "1": the1?.toJson(),
    "2": the2?.toJson(),
    "front_en": frontEn?.toJson(),
    "ingredients_en": ingredientsEn?.toJson(),
  };
}

class En {
  final int? angle;
  final String? coordinatesImageSize;
  final String? geometry;
  final String? imgid;
  final dynamic normalize;
  final String? rev;
  final Sizes? sizes;
  final dynamic whiteMagic;
  final String? x1;
  final String? x2;
  final String? y1;
  final String? y2;

  En({
    this.angle,
    this.coordinatesImageSize,
    this.geometry,
    this.imgid,
    this.normalize,
    this.rev,
    this.sizes,
    this.whiteMagic,
    this.x1,
    this.x2,
    this.y1,
    this.y2,
  });

  factory En.fromJson(Map<String, dynamic> json) => En(
    angle: json["angle"],
    coordinatesImageSize: json["coordinates_image_size"],
    geometry: json["geometry"],
    imgid: json["imgid"],
    normalize: json["normalize"],
    rev: json["rev"],
    sizes: json["sizes"] == null ? null : Sizes.fromJson(json["sizes"]),
    whiteMagic: json["white_magic"],
    x1: json["x1"],
    x2: json["x2"],
    y1: json["y1"],
    y2: json["y2"],
  );

  Map<String, dynamic> toJson() => {
    "angle": angle,
    "coordinates_image_size": coordinatesImageSize,
    "geometry": geometry,
    "imgid": imgid,
    "normalize": normalize,
    "rev": rev,
    "sizes": sizes?.toJson(),
    "white_magic": whiteMagic,
    "x1": x1,
    "x2": x2,
    "y1": y1,
    "y2": y2,
  };
}

class Sizes {
  final The100? the100;
  final The100? the400;
  final The100? full;
  final The100? the200;

  Sizes({
    this.the100,
    this.the400,
    this.full,
    this.the200,
  });

  factory Sizes.fromJson(Map<String, dynamic> json) => Sizes(
    the100: json["100"] == null ? null : The100.fromJson(json["100"]),
    the400: json["400"] == null ? null : The100.fromJson(json["400"]),
    full: json["full"] == null ? null : The100.fromJson(json["full"]),
    the200: json["200"] == null ? null : The100.fromJson(json["200"]),
  );

  Map<String, dynamic> toJson() => {
    "100": the100?.toJson(),
    "400": the400?.toJson(),
    "full": full?.toJson(),
    "200": the200?.toJson(),
  };
}

class The100 {
  final int? h;
  final int? w;

  The100({
    this.h,
    this.w,
  });

  factory The100.fromJson(Map<String, dynamic> json) => The100(
    h: json["h"],
    w: json["w"],
  );

  Map<String, dynamic> toJson() => {
    "h": h,
    "w": w,
  };
}

class The1 {
  final Sizes? sizes;
  final int? uploadedT;
  final String? uploader;

  The1({
    this.sizes,
    this.uploadedT,
    this.uploader,
  });

  factory The1.fromJson(Map<String, dynamic> json) => The1(
    sizes: json["sizes"] == null ? null : Sizes.fromJson(json["sizes"]),
    uploadedT: json["uploaded_t"],
    uploader: json["uploader"],
  );

  Map<String, dynamic> toJson() => {
    "sizes": sizes?.toJson(),
    "uploaded_t": uploadedT,
    "uploader": uploader,
  };
}

class Languages {
  final int? enEnglish;

  Languages({
    this.enEnglish,
  });

  factory Languages.fromJson(Map<String, dynamic> json) => Languages(
    enEnglish: json["en:english"],
  );

  Map<String, dynamic> toJson() => {
    "en:english": enEnglish,
  };
}

class LanguagesCodes {
  final int? en;

  LanguagesCodes({
    this.en,
  });

  factory LanguagesCodes.fromJson(Map<String, dynamic> json) => LanguagesCodes(
    en: json["en"],
  );

  Map<String, dynamic> toJson() => {
    "en": en,
  };
}

class Nutriscore {
  final int? categoryAvailable;
  final Map<String, int?>? data;
  final String? grade;
  final int? nutrientsAvailable;
  final int? nutriscoreApplicable;
  final int? nutriscoreComputed;

  Nutriscore({
    this.categoryAvailable,
    this.data,
    this.grade,
    this.nutrientsAvailable,
    this.nutriscoreApplicable,
    this.nutriscoreComputed,
  });

  factory Nutriscore.fromJson(Map<String, dynamic> json) => Nutriscore(
    categoryAvailable: json["category_available"],
    data: Map.from(json["data"]!).map((k, v) => MapEntry<String, int?>(k, v)),
    grade: json["grade"],
    nutrientsAvailable: json["nutrients_available"],
    nutriscoreApplicable: json["nutriscore_applicable"],
    nutriscoreComputed: json["nutriscore_computed"],
  );

  Map<String, dynamic> toJson() => {
    "category_available": categoryAvailable,
    "data": Map.from(data!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "grade": grade,
    "nutrients_available": nutrientsAvailable,
    "nutriscore_applicable": nutriscoreApplicable,
    "nutriscore_computed": nutriscoreComputed,
  };
}

class SelectedImages {
  final Front? front;
  final Front? ingredients;

  SelectedImages({
    this.front,
    this.ingredients,
  });

  factory SelectedImages.fromJson(Map<String, dynamic> json) => SelectedImages(
    front: json["front"] == null ? null : Front.fromJson(json["front"]),
    ingredients: json["ingredients"] == null ? null : Front.fromJson(json["ingredients"]),
  );

  Map<String, dynamic> toJson() => {
    "front": front?.toJson(),
    "ingredients": ingredients?.toJson(),
  };
}

class Front {
  final Display? display;
  final Display? small;
  final Display? thumb;

  Front({
    this.display,
    this.small,
    this.thumb,
  });

  factory Front.fromJson(Map<String, dynamic> json) => Front(
    display: json["display"] == null ? null : Display.fromJson(json["display"]),
    small: json["small"] == null ? null : Display.fromJson(json["small"]),
    thumb: json["thumb"] == null ? null : Display.fromJson(json["thumb"]),
  );

  Map<String, dynamic> toJson() => {
    "display": display?.toJson(),
    "small": small?.toJson(),
    "thumb": thumb?.toJson(),
  };
}

class Display {
  final String? en;

  Display({
    this.en,
  });

  factory Display.fromJson(Map<String, dynamic> json) => Display(
    en: json["en"],
  );

  Map<String, dynamic> toJson() => {
    "en": en,
  };
}
