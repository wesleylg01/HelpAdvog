unit login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ImgList, Vcl.Imaging.pngimage, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TForm_entrar = class(TForm)
    Edit_user: TEdit;
    Label1: TLabel;
    Edit_senha: TEdit;
    Label2: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Image1: TImage;
    Button1: TButton;
    Button2: TButton;
    ImageList1: TImageList;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_entrar: TForm_entrar;

implementation

{$R *.dfm}

uses principal;

procedure TForm_entrar.Button1Click(Sender: TObject);
var
login, senha: String;
begin
login:= Edit_user.Text;
senha:= Edit_senha.Text;

if ((login = 'Atoa') and (senha = 'tncvo')) then
    begin
       Form_entrar.Hide;
       form_principal.showmodal;

    end
    else
      begin
        begin
          ShowMessage('Nome de usuário ou senha incorretos, tente novamente');
          Edit_user.Clear;
          Edit_senha.Clear;
          Edit_user.SetFocus;
      end;
    end;

end;

procedure TForm_entrar.Button2Click(Sender: TObject);
begin
Edit_user.Clear;
Edit_senha.Clear;
Edit_user.SetFocus;
end;

end.
