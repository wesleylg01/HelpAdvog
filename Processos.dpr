program Processos;

uses
  Vcl.Forms,
  login in 'login.pas' {Form_entrar},
  principal in 'principal.pas' {Form_principal},
  cad_processo in 'cad_processo.pas' {Form_cadProcesso},
  pesquisa_processo in 'pesquisa_processo.pas' {Form_pesquisaProcesso},
  cad_user in 'cad_user.pas' {Form_cadUser},
  sobre in 'sobre.pas' {Form_sobre},
  datamodule in 'datamodule.pas' {dm: TDataModule},
  Processo_detalhe in 'Processo_detalhe.pas' {Form_Processo};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm_entrar, Form_entrar);
  Application.CreateForm(TForm_principal, Form_principal);
  Application.CreateForm(TForm_cadProcesso, Form_cadProcesso);
  Application.CreateForm(TForm_pesquisaProcesso, Form_pesquisaProcesso);
  Application.CreateForm(TForm_cadUser, Form_cadUser);
  Application.CreateForm(TForm_sobre, Form_sobre);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TForm_Processo, Form_Processo);
  Application.Run;
end.
