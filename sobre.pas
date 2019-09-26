unit sobre;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Menus, Vcl.ImgList;

type
  TForm_sobre = class(TForm)
    ImageList1: TImageList;
    MainMenu1: TMainMenu;
    Arquivo2: TMenuItem;
    NovoUsurio1: TMenuItem;
    Contatos1: TMenuItem;
    Arquivo1: TMenuItem;
    NovoProcesso1: TMenuItem;
    PesquisarProcesso1: TMenuItem;
    Sair1: TMenuItem;
    Sobre1: TMenuItem;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Image2: TImage;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure Sair1Click(Sender: TObject);
    procedure NovoProcesso1Click(Sender: TObject);
    procedure PesquisarProcesso1Click(Sender: TObject);
    procedure NovoUsurio1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_sobre: TForm_sobre;

implementation

{$R *.dfm}

uses cad_processo, cad_user, pesquisa_processo;

procedure TForm_sobre.NovoProcesso1Click(Sender: TObject);
begin
form_cadProcesso.ShowModal;
end;

procedure TForm_sobre.NovoUsurio1Click(Sender: TObject);
begin
form_cadUser.ShowModal;
end;

procedure TForm_sobre.PesquisarProcesso1Click(Sender: TObject);
begin
form_pesquisaProcesso.ShowModal;
end;

procedure TForm_sobre.Sair1Click(Sender: TObject);
begin
Form_sobre.close;
end;

end.
