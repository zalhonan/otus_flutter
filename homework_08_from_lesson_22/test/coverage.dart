@TestOn('vm')
import 'ui/pages/details/cocktail_description/00_cocktail_title_test.dart'
    as t0;
import 'ui/pages/details/cocktail_description/01_cocktail_title_test_by_semantics.dart'
    as t1;
import './core/src/repository/async_cocktail_repository_test.dart' as t3;
import 'package:flutter_test/flutter_test.dart';

void main() {
  t0.main();
  t1.main();
  t3.main();
}
