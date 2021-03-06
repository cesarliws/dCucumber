program dCucumberTests;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{.$APPTYPE CONSOLE}
{$ENDIF}

uses
  Forms,
  TestFramework,
  GUITestRunner,
  TextTestRunner,
  FeatureParserIntf in '..\source\FeatureParserIntf.pas',
  FeatureParser in '..\source\FeatureParser.pas',
  TestFeatureParser in 'TestFeatureParser.pas',
  TestConsts in 'TestConsts.pas',
  TypeUtils in '..\source\TypeUtils.pas',
  AutoDocObjects in 'dspec\AutoDocObjects.pas',
  BaseObjects in 'dspec\BaseObjects.pas',
  dSpec in 'dspec\dSpec.pas',
  dSpecIntf in 'dspec\dSpecIntf.pas',
  dSpecUtils in 'dspec\dSpecUtils.pas',
  FailureMessages in 'dspec\FailureMessages.pas',
  Modifiers in 'dspec\Modifiers.pas',
  Specifiers in 'dspec\Specifiers.pas',
  FeatureIntf in '..\source\FeatureIntf.pas',
  Feature in '..\source\Feature.pas',
  ScenarioIntf in '..\source\ScenarioIntf.pas',
  Scenario in '..\source\Scenario.pas',
  StepIntf in '..\source\StepIntf.pas',
  Step in '..\source\Step.pas',
  TestFeature in 'TestFeature.pas',
  TestBaseClasses in 'TestBaseClasses.pas',
  TestScenario in 'TestScenario.pas',
  dCucuberListIntf in '..\source\dCucuberListIntf.pas',
  dCucuberList in '..\source\dCucuberList.pas',
  TestdCucuberList in 'TestdCucuberList.pas',
  ErrorIntf in '..\source\ErrorIntf.pas',
  ValidationRuleIntf in '..\source\ValidationRuleIntf.pas',
  ValidationRule in '..\source\ValidationRule.pas',
  Constants in '..\source\Constants.pas',
  FeatureErrorIntf in '..\source\FeatureErrorIntf.pas',
  FeatureError in '..\source\FeatureError.pas',
  Error in '..\source\Error.pas',
  TestStep in 'TestStep.pas',
  DummyTests in 'DummyTests.pas',
  dCucumberRunnerForm in '..\source\dCucumberRunnerForm.pas' {frCucumberRunner},
  StepParamIntf in '..\source\StepParamIntf.pas',
  StepParamsIntf in '..\source\StepParamsIntf.pas',
  StepParam in '..\source\StepParam.pas',
  TestStepParam in 'TestStepParam.pas',
  StepParams in '..\source\StepParams.pas',
  TestStepParams in 'TestStepParams.pas';

{$R *.RES}

begin
  Application.Initialize;
  if IsConsole then
    with TextTestRunner.RunRegisteredTests do
      Free
  else
    GUITestRunner.RunRegisteredTests;
end.

