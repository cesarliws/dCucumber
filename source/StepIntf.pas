unit StepIntf;

interface

type
  IStep = interface(IInterface)
  ['{E1A03301-32F2-4A7B-886D-2B4188982A5B}']
    function GetDescricao: string;
    procedure SetDescricao(const Value: string);

    property Descricao: string read GetDescricao write SetDescricao;
  end;

implementation

end.