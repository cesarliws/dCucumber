unit TestScenario;

interface

uses
  TestFramework, Classes, Scenario, ScenarioIntf, TestBaseClasses;

type
  TestTScenario = class(TParseContext)
  strict private
    FScenario: IScenario;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure DeveriaSerInvalidoSeNaoPossuirAoMenosUmStepValido;
    procedure DeveriaSerValidoSomenteSeStepsSaoValidos;
    procedure DeveriaSerInvalidoSeNaoPossuiTitulo;
    procedure DeveriaSerValidoSePossuirUmaClasseDeTesteAssociadaAoTitulo;
    procedure DeveriaRetornarONomeDaClasseDeTesteCorretamente;
    procedure DeveriaSerInvalidoSeNaoPossuiTestesAssociadosAosSteps;
  end;

implementation

uses
  Step, StepIntf, ValidationRuleIntf, DummyTests;

procedure TestTScenario.DeveriaSerValidoSomenteSeStepsSaoValidos;
begin
  FScenario.Steps.Add(TStep.Create);
  Specify.That((FScenario as IValidationRule).Valid).Should.Be.False;
end;

procedure TestTScenario.SetUp;
begin
  FScenario := TScenario.Create;
end;

procedure TestTScenario.TearDown;
begin
  FScenario := nil;
end;

procedure TestTScenario.DeveriaSerValidoSePossuirUmaClasseDeTesteAssociadaAoTitulo;
begin
  RegisterTest(TUmCenarioValido.Suite);
  FScenario.Titulo := 'Um Cen�rio Valido';
  FScenario.Steps.Add(TStep.Create);
  (FScenario.Steps.First as IStep).Descricao := 'Dado que tenho um step valido';
  Specify.That(FScenario.TestSuite).Should.Not_.Be.Nil_;
  Specify.That((FScenario as IValidationRule).Valid).Should.Be.True;
  RegisteredTests.Tests.Remove(TUmCenarioValido.Suite);
end;

procedure TestTScenario.DeveriaSerInvalidoSeNaoPossuiTitulo;
begin
  FScenario.Steps.Add(TStep.Create);
  (FScenario.Steps.First as IStep).Descricao := 'Dado que tenho um step valido';
  Specify.That((FScenario as IValidationRule).Valid).Should.Be.False;
end;

procedure TestTScenario.DeveriaSerInvalidoSeNaoPossuiTestesAssociadosAosSteps;
var
  LStep: IStep;
begin
  RegisterTest(TUmCenarioInvalido.Suite);
  FScenario.Titulo := 'Um Cen�rio Invalido';
  FScenario.Steps.Add(TStep.Create);
  LStep := (FScenario.Steps.First as IStep);
  LStep.Descricao := 'Dado que tenho um step valido.';
  Specify.That(FScenario.TestSuite).Should.Not_.Be.Nil_;
  Specify.That((FScenario as IValidationRule).Valid).Should.Be.False;
  Specify.That(FScenario.TestSuite.Tests).Should.Not_.Be.Empty;

  RegisteredTests.Tests.Remove(TUmCenarioInvalido.Suite);
end;

procedure TestTScenario.DeveriaRetornarONomeDaClasseDeTesteCorretamente;
begin
  FScenario.Titulo := 'Um Cen�rio Valido';
  Specify.That(FScenario.TestName).Should.Equal('TUmCenarioValido');
end;

procedure TestTScenario.DeveriaSerInvalidoSeNaoPossuirAoMenosUmStepValido;
begin
  RegisterTest(TUmCenarioValido.Suite);
  FScenario.TestSuite;
  FScenario.Titulo := 'Um Cen�rio Valido';
  FScenario.Steps.Add(TStep.Create);
  (FScenario.Steps.First as IStep).Descricao := 'Dado que tenho um step valido';
  Specify.That((FScenario as IValidationRule).Valid).Should.Be.True;
  RegisteredTests.Tests.Remove(TUmCenarioValido.Suite);
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTScenario.Suite);
end.

