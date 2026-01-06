import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'lints/avoid_package_import.dart';

PluginBase createPlugin() => _CustomLinter();

class _CustomLinter extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) {
    return [
      AvoidPackageImport(),
    ];
  }
}