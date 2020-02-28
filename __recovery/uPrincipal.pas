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
  FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.Mask;

type
  TfPrincipal = class(TForm)
    pnlPedidos: TPanel;
    pnlPedidosCampos: TPanel;
    dbgPedidos: TDBGrid;
    pnlTituloPedidos: TPanel;
    quPedidos: TFDQuery;
    dsPedidos: TDataSource;
    quPedidosnumero: TFDAutoIncField;
    quPedidosdata: TDateField;
    quPedidosdescricao: TStringField;
    quPedidossituacao: TSmallintField;
    quPedidosvalorTotal: TFloatField;
    lblData: TLabel;
    lblDescricao: TLabel;
    lblSituacao: TLabel;
    lblValorTotalPedido: TLabel;
    medData: TMaskEdit;
    cbbSituacao: TComboBox;
    medValorTotalPedido: TMaskEdit;
    mmoDescricaoPedido: TMemo;
    lblCodigo: TLabel;
    edtCodigoPedido: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
    Fconexao : TFDConnection;

  public
    { Public declarations }

  end;

var
  fPrincipal: TfPrincipal;

implementation

uses objConexaoBanco;

{$R *.dfm}

procedure TfPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Fconexao.Connected := False;
  Fconexao.Destroy;
  Action := caFree;
end;

procedure TfPrincipal.FormCreate(Sender: TObject);
var
  objConexao : TConexaoBanco;
begin
  objConexao := TConexaoBanco.Create;
  Fconexao := objConexao.conexaoBanco;
  Fconexao.Connected := True;
  quPedidos.Connection := Fconexao;
end;

end.
