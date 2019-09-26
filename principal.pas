unit principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ButtonGroup,
  Vcl.ImgList, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TForm_principal = class(TForm)
    ImageList1: TImageList;
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Image1: TImage;
    GroupBox2: TGroupBox;
    Image2: TImage;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure Button2Click(Sender: TObject);
    procedure NovoProcesso1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure PesquisarProcesso1Click(Sender: TObject);
    procedure SuporteSobre1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_principal: TForm_principal;

implementation

{$R *.dfm}

uses cad_processo, pesquisa_processo, cad_user, sobre;

procedure TForm_principal.Button1Click(Sender: TObject);
begin
Form_pesquisaProcesso.ShowModal;
end;

procedure TForm_principal.Button2Click(Sender: TObject);
begin
Form_cadProcesso.ShowModal;
end;

procedure TForm_principal.Button3Click(Sender: TObject);
begin
Form_cadUser.ShowModal;
end;

procedure TForm_principal.Button4Click(Sender: TObject);
begin
//form_user;
end;

procedure TForm_principal.Button5Click(Sender: TObject);
begin
  if application.MessageBox('Deseja Fechar o Aplicativo ? ' , 'Atenção' , mb_iconquestion + mb_yesno )= id_yes
     then Application.Terminate;
end;

procedure TForm_principal.NovoProcesso1Click(Sender: TObject);
begin
Form_cadProcesso.ShowModal;
end;

procedure TForm_principal.PesquisarProcesso1Click(Sender: TObject);
begin
Form_pesquisaProcesso.ShowModal;
end;

procedure TForm_principal.SuporteSobre1Click(Sender: TObject);
begin
form_sobre.showmodal;
end;


end.
