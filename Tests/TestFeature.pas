unit TestFeature;

interface

uses
  TestFramework, Classes, FeatureIntf, Feature, TestBaseClasses, StepIntf;

type
  TestTFeature = class(TParseContext)
  strict private
    FFeature: IFeature;
  private
    function NovoStep(ADescricao: string): IStep;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure FeatureDeveriaSerInvalidaSeNaoPossuirAoMenosUmCenarioValido;
    procedure FeatureDeveriaSerInvalidaSeCenariosNaoForemValidos;
    procedure FeatureDeveriaSerInvalidaSeNaoPossuirUmaClasseDeTestesParaCadaScenario;
  end;

implementation

uses
  Scenario, ScenarioIntf, Step, DummyTests;

procedure TestTFeature.FeatureDeveriaSerInvalidaSeCenariosNaoForemValidos;
begin
  FFeature.Scenarios.Add(TScenario.Create);
  Specify.That(FFeature.Valid).Should.Be.False;
end;

procedure TestTFeature.FeatureDeveriaSerInvalidaSeNaoPossuirAoMenosUmCenarioValido;
begin
  RegisterTest(TUmCenarioValido.Suite);
  Specify.That(FFeature.Valid).Should.Be.False;
  FFeature.Scenarios.Add(TScenario.Create);
  (FFeature.Scenarios.First as IScenario).Titulo := 'Um Cen�rio V�lido';
  (FFeature.Scenarios.First as IScenario).Steps.Add(TStep.Create);
  ((FFeature.Scenarios.First as IScenario).Steps.First as IStep).Descricao := 'Dado que tenho um step valido';
  Specify.That(FFeature.Valid).Should.Be.True;
  RegisteredTests.Tests.Remove(TUmCenarioValido.Suite);
end;

procedure TestTFeature.FeatureDeveriaSerInvalidaSeNaoPossuirUmaClasseDeTestesParaCadaScenario;
var
  LScenario: IScenario;
begin
  RegisterTest(TUmCenarioValido.Suite);
  RegisterTest(TUmCenarioCom3Passos.Suite);
  LScenario := TScenario.Create;
  LScenario.Titulo := 'Um cen�rio com 3 passos';
  LScenario.Steps.Add(NovoStep('Dado que tenho 3 passos nesse cen�rio'));
  LScenario.Steps.Add(NovoStep('Quando eu validar a Featuare'));
  LScenario.Steps.Add(NovoStep('Ent�o ela deve ser v�lida.'));

  FFeature.Scenarios.Add(LScenario);

  LScenario := TScenario.Create;
  LScenario.Titulo := 'Um cen�rio V�lido';
  LScenario.Steps.Add(NovoStep('Dado Que Tenho Um Step Valido'));

  FFeature.Scenarios.Add(LScenario);

  Specify.That(FFeature.Valid).Should.Be.True;
  RegisteredTests.Tests.Remove(TUmCenarioValido.Suite);
  RegisteredTests.Tests.Remove(TUmCenarioCom3Passos.Suite);
end;

function TestTFeature.NovoStep(ADescricao: string): IStep;
begin
  Result := TStep.Create;
  Result.Descricao := ADescricao;
end;

procedure TestTFeature.SetUp;
begin
  FFeature := TFeature.Create;
end;

procedure TestTFeature.TearDown;
begin
  FFeature := nil;
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTFeature.Suite);
end.

