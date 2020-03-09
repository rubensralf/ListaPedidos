unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteDef, FireDAC.Phys.SQLite, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.Mask, Vcl.Buttons, PngSpeedButton,
  Vcl.ComCtrls, Vcl.Menus;

type
  TfPrincipal = class(TForm)
    mmMenu: TMainMenu;
    mniConsultas: TMenuItem;
    mniPedidos: TMenuItem;
    mniItens: TMenuItem;
    mniSair: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mniSairClick(Sender: TObject);
    procedure mniPedidosClick(Sender: TObject);
    procedure mniItensClick(Sender: TObject);

  private
    { Private declarations }
    Fconexao : TFDConnection;

  public
    { Public declarations }

  end;

var
  fPrincipal: TfPrincipal;

implementation

uses objConexaoBanco, uPedidos, uItens;

{$R *.dfm}

procedure TfPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Fconexao.Destroy;
  Action := caFree;
end;

procedure TfPrincipal.FormCreate(Sender: TObject);
var
  objConexao : TConexaoBanco;
begin
  objConexao := TConexaoBanco.Create;
  Fconexao := objConexao.conexaoBanco;
end;

procedure TfPrincipal.mniItensClick(Sender: TObject);
begin
  try
    fItens := TfItens.Create(Self);
    fItens.Show;
  except
    on e:Exception do
      ShowMessage('Erro ao criar formulário de itens.' + #13 + 'Erro: ' + e.Message);
  end;
end;

procedure TfPrincipal.mniPedidosClick(Sender: TObject);
begin
  try
    fPedidos := TfPedidos.Create(Self);
    fPedidos.AtribuiConexao(Fconexao);
    fPedidos.CarregarPedidos;
    fPedidos.CarregarSituacoes;
    fPedidos.Show;
  except
    on e:Exception do
      ShowMessage('Erro ao criar formulário de pedidos.' + #13 + 'Erro: ' + e.Message);
  end;
end;

procedure TfPrincipal.mniSairClick(Sender: TObject);
begin
  if MessageDlg('Deseja encerrar o sistema?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    Close;
end;

end.
