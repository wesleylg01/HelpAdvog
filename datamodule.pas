unit datamodule;

interface

uses
  System.SysUtils, System.Classes, ZAbstractConnection, ZConnection;

type
  Tdm = class(TDataModule)
    ZConnection1: TZConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

end.
