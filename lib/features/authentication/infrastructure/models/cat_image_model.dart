import 'package:cat_app_flutter/shared/infrastructure/models/base_model.dart';

final class CatImageModel implements BaseModel{
  CatImageModel({
    required this.id,
    required this.url,
    required this.breeds,
    required this.width,
    required this.height,
  });

  final String id;
  final String url;
  final List<BreedCatModel> breeds;
  final int width;
  final int height;

  factory CatImageModel.fromMap(Map<String, dynamic> json) => CatImageModel(
      id: json[_idCodingKey], 
      url: json[_urlCodingKey], 
      breeds: List<BreedCatModel>.from(
        json[_breedsCodingKey].map(
            (breed) => BreedCatModel.fromMap(breed)
        )
      ), 
      width: json[_widthCodingKey], 
      height: json[_heightCodingKey]
  );
  
  @override
  Map<String, dynamic> toMap() => {
    _idCodingKey: id,
    _urlCodingKey: url,
    _breedsCodingKey: breeds.map((breed)=> breed.toMap()).toList(),
    _widthCodingKey: width,
    _heightCodingKey:height
  };

  // Coding keys
  static const String _idCodingKey = 'id';
  static const String _urlCodingKey = 'url';
  static const String _breedsCodingKey = 'breeds';
  static const String _widthCodingKey = 'width';
  static const String _heightCodingKey = 'height';
}

final class BreedCatModel implements BaseModel {
  BreedCatModel(
      {required this.weight,
      required this.id,
      required this.name,
      required this.cfaUrl,
      required this.vetStreetUrl,
      required this.vcaHospitalUrl,
      required this.temperament,
      required this.origin,
      required this.countryCodes,
      required this.countryCode,
      required this.description,
      required this.lifeSpan,
      required this.indoor,
      required this.lap,
      required this.altNames,
      required this.adaptability,
      required this.affectionLevel,
      required this.childFriendly,
      required this.dogFriendly,
      required this.energyLevel,
      required this.grooming,
      required this.healthIssues,
      required this.intelligence,
      required this.sheddingLevel,
      required this.socialNeeds,
      required this.strangerFriendly,
      required this.vocalisation,
      required this.experimental,
      required this.hairless,
      required this.natural,
      required this.rare,
      required this.rex,
      required this.suppressedTail,
      required this.shortLegs,
      required this.wikipediaUrl,
      required this.hypoallergenic,
      required this.referenceImageId,});

  final WeightCatModel weight;
  final String id;
  final String name;
  final String cfaUrl;
  final String vetStreetUrl;
  final String vcaHospitalUrl;
  final String temperament;
  final String origin;
  final String countryCodes;
  final String countryCode;
  final String description;
  final String lifeSpan;
  final int indoor;
  final int lap;
  final String altNames;
  final int adaptability;
  final int affectionLevel;
  final int childFriendly;
  final int dogFriendly;
  final int energyLevel;
  final int grooming;
  final int healthIssues;
  final int intelligence;
  final int sheddingLevel;
  final int socialNeeds;
  final int strangerFriendly;
  final int vocalisation;
  final int experimental;
  final int hairless;
  final int natural;
  final int rare;
  final int rex;
  final int suppressedTail;
  final int shortLegs;
  final String wikipediaUrl;
  final int hypoallergenic;
  final String referenceImageId;

  factory BreedCatModel.fromMap(Map<String, dynamic> json) => BreedCatModel(
      weight: json[_weightCodingKey],
      id: json[_idCodingKey],
      name: json[_nameCodingKey],
      cfaUrl: json[_cfaUrlCodingKey],
      vetStreetUrl: json[_vetStreetUrlCodingKey],
      vcaHospitalUrl: json[_vcaHospitalUrlCodingKey],
      temperament: json[_temperamentCodingKey],
      origin: json[_originCodingKey],
      countryCodes: json[_countryCodesCodingKey],
      countryCode: json[_countryCodeCodingKey],
      description: json[_descriptionCodingKey],
      lifeSpan: json[_lifeSpanCodingKey],
      indoor: json[_indoorCodingKey],
      lap: json[_lapCodingKey],
      altNames: json[_altNamesCodingKey],
      adaptability: json[_adaptabilityCodingKey],
      affectionLevel: json[_affectionLevelCodingKey],
      childFriendly: json[_childFriendlyCodingKey],
      dogFriendly: json[_dogFriendlyCodingKey],
      energyLevel: json[_energyLevelCodingKey],
      grooming: json[_groomingCodingKey],
      healthIssues: json[_healthIssuesCodingKey],
      intelligence: json[_intelligenceCodingKey],
      sheddingLevel: json[_sheddingLevelCodingKey],
      socialNeeds: json[_socialNeedsCodingKey],
      strangerFriendly: json[_strangerFriendlyCodingKey],
      vocalisation: json[_vocalisationCodingKey],
      experimental: json[_experimentalCodingKey],
      hairless: json[_hairlessCodingKey],
      natural: json[_naturalCodingKey],
      rare: json[_rareCodingKey],
      rex: json[_rexCodingKey],
      suppressedTail: json[_suppressedTailCodingKey],
      shortLegs: json[_shortLegsCodingKey],
      wikipediaUrl: json[_wikipediaUrlCodingKey],
      hypoallergenic: json[_hypoallergenicCodingKey],
      referenceImageId: json[_referenceImageIdCodingKey],);

  @override
  Map<String, dynamic> toMap() => {
        _weightCodingKey: weight.toMap(),
        _idCodingKey: id,
        _nameCodingKey: name,
        _cfaUrlCodingKey: cfaUrl,
        _vetStreetUrlCodingKey: vetStreetUrl,
        _vcaHospitalUrlCodingKey: vcaHospitalUrl,
        _temperamentCodingKey: temperament,
        _originCodingKey: origin,
        _countryCodesCodingKey: countryCodes,
        _countryCodeCodingKey: countryCode,
        _descriptionCodingKey: description,
        _lifeSpanCodingKey: lifeSpan,
        _indoorCodingKey: indoor,
        _lapCodingKey: lap,
        _altNamesCodingKey: altNames,
        _adaptabilityCodingKey: adaptability,
        _affectionLevelCodingKey: affectionLevel,
        _childFriendlyCodingKey: childFriendly,
        _dogFriendlyCodingKey: dogFriendly,
        _energyLevelCodingKey: energyLevel,
        _groomingCodingKey: grooming,
        _healthIssuesCodingKey: healthIssues,
        _intelligenceCodingKey: intelligence,
        _sheddingLevelCodingKey: sheddingLevel,
        _socialNeedsCodingKey: socialNeeds,
        _strangerFriendlyCodingKey: strangerFriendly,
        _vocalisationCodingKey: vocalisation,
        _experimentalCodingKey: experimental,
        _hairlessCodingKey: hairless,
        _naturalCodingKey: natural,
        _rareCodingKey: rare,
        _rexCodingKey: rex,
        _suppressedTailCodingKey: suppressedTail,
        _shortLegsCodingKey: shortLegs,
        _wikipediaUrlCodingKey: wikipediaUrl,
        _hypoallergenicCodingKey: hypoallergenic,
        _referenceImageIdCodingKey: referenceImageId
      };

  // Coding keys
  static const String _weightCodingKey = 'weight';
  static const String _idCodingKey = 'id';
  static const String _nameCodingKey = 'name';
  static const String _cfaUrlCodingKey = 'cfa_url';
  static const String _vetStreetUrlCodingKey = 'vetstreet_url';
  static const String _vcaHospitalUrlCodingKey = 'vcahospitals_url';
  static const String _temperamentCodingKey = 'temperament';
  static const String _originCodingKey = 'origin';
  static const String _countryCodesCodingKey = 'country_codes';
  static const String _countryCodeCodingKey = 'country_code';
  static const String _descriptionCodingKey = 'description';
  static const String _lifeSpanCodingKey = 'life_span';
  static const String _indoorCodingKey = 'indoor';
  static const String _lapCodingKey = 'lap';
  static const String _altNamesCodingKey = 'alt_names';
  static const String _adaptabilityCodingKey = 'adaptability';
  static const String _affectionLevelCodingKey = 'affection_level';
  static const String _childFriendlyCodingKey = 'child_friendly';
  static const String _dogFriendlyCodingKey = 'dog_friendly';
  static const String _energyLevelCodingKey = 'energy_level';
  static const String _groomingCodingKey = 'grooming';
  static const String _healthIssuesCodingKey = 'health_issues';
  static const String _intelligenceCodingKey = 'intelligence';
  static const String _sheddingLevelCodingKey = 'shedding_level';
  static const String _socialNeedsCodingKey = 'social_needs';
  static const String _strangerFriendlyCodingKey = 'stranger_friendly';
  static const String _vocalisationCodingKey = 'vocalisation';
  static const String _experimentalCodingKey = 'experimental';
  static const String _hairlessCodingKey = 'hairless';
  static const String _naturalCodingKey = 'natural';
  static const String _rareCodingKey = 'rare';
  static const String _rexCodingKey = 'rex';
  static const String _suppressedTailCodingKey = 'suppressed_tail';
  static const String _shortLegsCodingKey = 'short_legs';
  static const String _wikipediaUrlCodingKey = 'wikipedia_url';
  static const String _hypoallergenicCodingKey = 'hypoallergenic';
  static const String _referenceImageIdCodingKey = 'reference_image_id';
}

final class WeightCatModel implements BaseModel {
  const WeightCatModel({required this.imperial, required this.metric});

  factory WeightCatModel.fromMap(Map<String, dynamic> json) {
    return WeightCatModel(
        imperial: json[_imperialCodingKey], metric: json[_metricCodingKey]);
  }

  final String imperial;
  final String metric;

  static const String _imperialCodingKey = 'imperial';
  static const String _metricCodingKey = 'metric';

  @override
  Map<String, dynamic> toMap() =>
      {_imperialCodingKey: imperial, _metricCodingKey: metric};
}
