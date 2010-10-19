unit FeatureParserIntf;

interface

uses
  Classes, FeatureIntf;

type

  IFeatureParser = interface(IInterface)
  ['{0017D4E2-14B2-4841-A738-7090AFF16D10}']
    function GetErrors: IInterfaceList;
    function GetFeatureFileName: string;
    procedure SetFeatureFileName(const Value: string);

    function Parse: IFeature;
    procedure SetErrors(const Value: IInterfaceList);
    property Errors: IInterfaceList read GetErrors write SetErrors;
    property FeatureFileName: string read GetFeatureFileName write SetFeatureFileName;
  end;

implementation

end.
