unit cad_user;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Menus, Vcl.ImgList, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TForm_cadUser = class(TForm)
    ImageList1: TImageList;
    MainMenu1: TMainMenu;
    Arquivo2: TMenuItem;
    NovoUsurio1: TMenuItem;
    Contatos1: TMenuItem;
    Arquivo1: TMenuItem;
    NovoProcesso1: TMenuItem;
    PesquisarProcesso1: TMenuItem;
    Sair1: TMenuItem;
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit_nome: TEdit;
    Label6: TLabel;
    Sobre1: TMenuItem;
    ZQuery1: TZQuery;
    Edit_email: TEdit;
    Edit_tel: TEdit;
    Edit_cel: TEdit;
    Edit_cpf: TEdit;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit_login: TEdit;
    Edit_senha: TEdit;
    Edit_confirmasenha: TEdit;
    procedure Sair1Click(Sender: TObject);
    procedure NovoProcesso1Click(Sender: TObject);
    procedure PesquisarProcesso1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit_nomeExit(Sender: TObject);
    procedure Edit_emailExit(Sender: TObject);
    procedure Edit_celExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure testa_duplicidade;
    procedure salvar;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_cadUser: TForm_cadUser;

implementation

{$R *.dfm}

uses cad_processo, pesquisa_processo;

//------- TESTANDO SE JA TEM ALGUM USUUARIO COM ESTE CPF CADASTRADO ----------//

procedure TForm_cadUser.testa_duplicidade;
begin
ZQuery1.Close;
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add('SELECT * FROM usuario Where cpf like "'+ Edit_cpf.Text +'"');
ZQuery1.Open;

if zquery1.fieldByName ('cpf').value = Edit_cpf.text then
begin
application.MessageBox ('ERRO 002 - J� exite um usu�rio com o CPF informado, revise os dados e tente novamente', 'ERRO - 002' , MB_ICONWARNING);
Edit_nome.SetFocus;
 end
 else
 salvar;
end;

//--------------------- SALVA OS DADOS DO USUARIO NO BANCO DE DADOS -----------//

procedure TForm_cadUser.salvar;
begin
  ZQuery1.Close;
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('insert into usuario (nome, telefone, celular, email, cpf, login, senha, ativo)values(:nome, :telefone, :celular, :email, :cpf, :login, :senha, :ativo) ');
  ZQuery1.ParamByName('nome').AsString:= Edit_nome.Text;
  ZQuery1.ParamByName('telefone').AsString:= Edit_tel.Text;
  ZQuery1.ParamByName('celular').AsString:= Edit_cel.Text;
  ZQuery1.ParamByName('email').AsString:= Edit_email.Text;
  ZQuery1.ParamByName('cpf').AsString:= Edit_cpf.Text;
  ZQuery1.ParamByName('login').AsString:= Edit_login.Text;
  ZQuery1.ParamByName('senha').AsString:= Edit_senha.Text;
  ZQuery1.ParamByName('ativo').AsString:= 'true';
  ZQuery1.ExecSQL;

    ShowMessage('Usu�rio cadastrado com sucesso !!');
    //------------------ LIMPANDOS OS CAMPOS ---------------------------------//
    Edit_nome.Clear;
    Edit_email.Clear;
    Edit_tel.Clear;
    Edit_cel.Clear;
    Edit_cpf.Clear;
    Edit_login.Clear;
    Edit_senha.Clear;
    Edit_confirmasenha.Clear;
    Edit_nome.SetFocus;
end;

procedure TForm_cadUser.Button1Click(Sender: TObject);
begin
    //----------- TESTANDO SE N�O TEM NENHUM CAMPO EM BRANCO -----------------//
    if ((Edit_nome.Text = '')or (Edit_tel.text = '')or (Edit_cel.Text = '')
          or (Edit_email.Text = '')or (Edit_cpf.Text = '')or (Edit_login.Text = '')
          or (Edit_senha.Text = '') or (Edit_confirmasenha.Text = ''))
       then
    begin
        ShowMessage('ERRO 001 - Aten��o Preencha todos os campos para completar o opera��o');
    end;
    //------------------------------------------------------------------------//

    //---- CONFERINDO SE O CAMPO SENHA E O CAMPA CONFIRMA SENHA S�O IGUAIS ---//

    if (Edit_senha.Text <> Edit_confirmasenha.Text) then
      begin
            ShowMessage('ERRO 001 - As senhas digitadas n�o conferem, tente novamente');
            Edit_senha.Clear;
            Edit_confirmasenha.Clear;
            Edit_senha.SetFocus;
      end;
      testa_duplicidade;
end;

procedure TForm_cadUser.Button2Click(Sender: TObject);
begin
Edit_nome.Clear;
Edit_email.Clear;
Edit_tel.Clear;
Edit_cel.Clear;
Edit_cpf.Clear;
Edit_login.Clear;
Edit_senha.Clear;
Edit_confirmasenha.Clear;
Edit_nome.SetFocus;
end;

procedure TForm_cadUser.Edit_celExit(Sender: TObject);
begin
//Edit_cpf.SetFocus;
end;

procedure TForm_cadUser.Edit_emailExit(Sender: TObject);
begin
//Edit_tel.SetFocus;
end;

procedure TForm_cadUser.Edit_nomeExit(Sender: TObject);
begin
//Edit_email.SetFocus;
end;

procedure TForm_cadUser.FormActivate(Sender: TObject);
begin
//preparando o zquery para conectar ao banco de dados
ZQuery1.Close;
ZQuery1.SQL.Clear;

//Limpando os campos e dando foc no campo nome
Edit_nome.Clear;
Edit_email.Clear;
Edit_tel.Clear;
Edit_cel.Clear;
Edit_cpf.Clear;
Edit_login.Clear;
Edit_senha.Clear;
Edit_confirmasenha.Clear;
Edit_nome.SetFocus;

end;

procedure TForm_cadUser.NovoProcesso1Click(Sender: TObject);
begin
form_cadProcesso.showmodal;
end;

procedure TForm_cadUser.PesquisarProcesso1Click(Sender: TObject);
begin
form_pesquisaProcesso.ShowModal;
end;

procedure TForm_cadUser.Sair1Click(Sender: TObject);
begin
Form_cadUser.Close;
end;

end.
