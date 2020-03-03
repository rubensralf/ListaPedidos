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
  FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.Mask, Vcl.Buttons, PngSpeedButton;

type
  TfPrincipal = class(TForm)
    pnlPedidos: TPanel;
    dbgPedidos: TDBGrid;
    pnlTituloPedidos: TPanel;
    quPedidos: TFDQuery;
    dsPedidos: TDataSource;
    quPedidosnumero: TFDAutoIncField;
    quPedidosdata: TDateField;
    quPedidosdescricao: TStringField;
    quPedidossituacao: TSmallintField;
    quPedidosvalorTotal: TFloatField;
    pnlCampos: TPanel;
    pnlPedidosCampos: TPanel;
    lblData: TLabel;
    medData: TMaskEdit;
    lblDescricao: TLabel;
    mmoDescricaoPedido: TMemo;
    cbbSituacao: TComboBox;
    lblSituacao: TLabel;
    pnlValorLiquido: TPanel;
    lblValorBruto: TLabel;
    lblValorDesconto: TLabel;
    pnl1: TPanel;
    lblValorLiquido: TLabel;
    pnl2: TPanel;
    pnlItens: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    pnlDadosItens: TPanel;
    dbgItensPedido: TDBGrid;
    quItensPedido: TFDQuery;
    dsItensPedido: TDataSource;
    quItensPedidoquantidade: TSmallintField;
    quItensPedidodesconto: TFloatField;
    quItensPedidovalorTotal: TFloatField;
    quItensPedidocodigo: TIntegerField;
    quItensPedidodescricao: TStringField;
    lblItem: TLabel;
    cbbItem: TComboBox;
    lblQuantidade: TLabel;
    edtQuantidade: TEdit;
    medValor: TMaskEdit;
    lblVlrDesconto: TLabel;
    pnlSair: TPanel;
    pnlSair2: TPanel;
    sbtSair: TPngSpeedButton;
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

end.
