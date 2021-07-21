// ignore: import_of_legacy_library_into_null_safe
import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';

@Openapi(
    additionalProperties: AdditionalProperties(
      pubName: 'insta_pic_api',
      pubAuthor: 'desmond',
    ),
    inputSpecFile: 'lib/api.yaml',
    // uncomment below to regenerate
    //alwaysRun: true,
    generatorName: Generator.dart,
    outputDirectory: 'generated_api/insta_pic')
class API extends OpenapiGeneratorConfig {}
