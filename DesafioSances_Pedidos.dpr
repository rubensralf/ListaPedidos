program DesafioSances_Pedidos;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {fPrincipal},
  objPedido in 'objPedido.pas',
  objItem in 'objItem.pas',
  objConexaoBanco in 'objConexaoBanco.pas',
  objItemPedido in 'objItemPedido.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfPrincipal, fPrincipal);
  Application.Run;
end.
