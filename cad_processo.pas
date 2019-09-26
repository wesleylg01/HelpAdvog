unit cad_processo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ImgList, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.ExtDlgs, Vcl.DBCtrls, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TForm_cadProcesso = class(TForm)
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
    Edit_peticao: TEdit;
    Label2: TLabel;
    Edit_numvara: TEdit;
    Label3: TLabel;
    Edit_autor: TEdit;
    Label4: TLabel;
    Edit_reu: TEdit;
    Sobre1: TMenuItem;
    OpenPictureDialog1: TOpenPictureDialog;
    ZQuery1: TZQuery;
    GroupBox2: TGroupBox;
    Image1: TImage;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Label5: TLabel;
    Edit_pag: TEdit;
    Button6: TButton;
    Button7: TButton;
    procedure Sair1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure salvar_imagem;
    procedure salvar_processo;
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_cadProcesso: TForm_cadProcesso;
  id: Integer;

implementation

{$R *.dfm}
procedure TForm_cadProcesso.salvar_imagem;
var
img:String;
begin
//--------------- RECENDO ENDERE�O DA IMAGEM ---------------------------------//
img:= OpenPictureDialog1.FileName;

  ZQuery1.Close;
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('insert into imagens (imagem, id_processo,pagina )values(:imagem, :id_processo, :pagina) ');
  ZQuery1.ParamByName('imagem').AsString:= (img);
  ZQuery1.ParamByName('id_processo').AsInteger:= (id);
  ZQuery1.ParamByName('pagina').AsInteger:= (StrtoInt(Edit_pag.text));
  ZQuery1.ExecSQL;

  Edit_pag.Clear;
  Button3.SetFocus;
  ShowMessage('Imagem Adiconada com sucesso com sucesso !!');
end;


procedure TForm_cadProcesso.salvar_processo;
begin
//------------------------ SALVANDO PROCESSO ---------------------------------//

  ZQuery1.Close;
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('insert into processo (reu, num_vara, autor, peticao_ini)values(:reu, :num_vara, :autor, :peticao_ini) ');
  ZQuery1.ParamByName('reu').AsString:= (Edit_reu.Text);
  ZQuery1.ParamByName('num_vara').AsString:= (Edit_numvara.Text);
  ZQuery1.ParamByName('autor').AsString:= (Edit_autor.Text);
  ZQuery1.ParamByName('peticao_ini').AsString:= (Edit_peticao.Text);
  ZQuery1.ExecSQL;


//-----------  RECEBENDO ID DO ULTIMO PROCESSO CADASTRADO      ---------------//

//AQUI RECEBO ID DO ULTIMO PROCESSO,
//PARA QUANDO EU FOR CADASTRAR A IMAGEM PODER VINVULAR ESTE ID A IMAGEM
// E ASSIM VINCULAR A IMAGEM AO PROCESSO;

  ZQuery1.Close;
  ZQuery1.sql.Clear;
  ZQuery1.SQL.Add('SELECT MAX(id) AS id FROM processo');
  ZQuery1.Open;
  id:= ZQuery1.Fields[0].Value;

//------------------------ FIM RECEBER ID ------------------------------------//
  Edit_peticao.Clear;
  Edit_numvara.Clear;
  Edit_reu.Clear;
  Edit_autor.Clear;


  ShowMessage('Processo cadastrao com sucesso !!');
end;


procedure TForm_cadProcesso.Button1Click(Sender: TObject);
begin
//chamando procedure que salava os dados na tabela Processos
salvar_processo;
//Liberando o bot�o que salva faz o processo de liberar a parte de salvar imagens
Button5.Enabled := true;
end;


procedure TForm_cadProcesso.Button2Click(Sender: TObject);
begin
//Limpenado os campos e dando foco ao edite da peti��o
Edit_peticao.Clear;
Edit_numvara.Clear;
Edit_reu.Clear;
Edit_autor.Clear;
Edit_peticao.SetFocus;
end;

procedure TForm_cadProcesso.Button3Click(Sender: TObject);
var
img: String;
begin
//Abre para o usuario escolher uma imagem
OpenPictureDialog1.Execute;
//Abre a imagem que o usuario escolheu
Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
end;

procedure TForm_cadProcesso.Button5Click(Sender: TObject);
begin
  {
    Preparando o GroupBox2 para a dicionar imagens

    Ativando os bot�es, e o edit das paginas
  }
Button3.Enabled:= true;
Button4.Enabled:= true;
Button6.Enabled:= true;
Edit_pag.Enabled:= true;
Edit_pag.color:= clWhite;
//dando foco ao botao que seleciona as imagens
Button3.SetFocus;
end;

procedure TForm_cadProcesso.Button6Click(Sender: TObject);
begin
//Chamando procedure responsavel por salvar imagens na tabela Imagens
salvar_imagem;
//Ativa o botao que volta ao ponto incial
Button7.Enabled:= true;
end;

procedure TForm_cadProcesso.Button7Click(Sender: TObject);
begin
//botao responsavel por "finalizar" o processo de salva as imagens e voltar ao ponto inivial

//Deixando bot�es bloqueados
Button3.Enabled:= false;
Button4.Enabled:= false;
Button6.Enabled:= false;
Button5.Enabled:= false;

//Limpando o componenta da que carrega as imagens
Image1.Picture := nil;

//bloqueando e mudando a cor doEdit
Edit_pag.Enabled:= false;
Edit_pag.color:= clMenu;
//Dando foco no edit peti��o
Edit_peticao.SetFocus;
end;

procedure TForm_cadProcesso.FormActivate(Sender: TObject);
begin
Edit_peticao.SetFocus;
end;

procedure TForm_cadProcesso.Sair1Click(Sender: TObject);
begin
Form_cadProcesso.Close;
end;

end.
