unit Constants;

interface

const
  ScenarioRegex = '^(\s*)Cen�rio:\s';
  FeatureRegex: UTF8String = '^(\s|)*Funcionalidade:\s*';
  StepRegex: UTF8String = '^(\s*)(Dado|Quando|Ent�o|E|Mas)\s.*';
  StepValidWord: UTF8String = '^(\s*)(Dado|Quando|Ent�o|E|Mas)\b';
  FirstWordRegex: UTF8String = '\b\w*\b';
  InvalidStepIdentifierError = 'A linha %d come�a com uma palavra chave desconhecida (%s).';
  SugestedActionToStepError = 'Os passos devem come�ar com: Dado, Quando, E, Ent�o, e Mas';
  InvalidStepDefinition = 'O passo da linha %d deve conter mais do que apenas uma palavra.';
  InvalidFeature = 'A feature ''%s'' n�o come�a com a palavra Funcionalidade: seguida de seu t�tulo na primeira linha.';
  SugestionToStepInitialize = '%s... ?!';
  SugestionToFeatureInitialize = 'Exemplo: Funcionalidade: Aqui vai o t�tulo da sua funcionalidade.';
  InvalidFeatureFileName = 'O arquivo que voc� tentou carregar (%s) n�o existe.';
  SugestionToInvalidFeatureName = 'Tente carregar um arquivo que exista :)';

implementation

end.



