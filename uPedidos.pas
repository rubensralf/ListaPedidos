unit uPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.Buttons, PngSpeedButton, Vcl.ComCtrls, Vcl.Mask;

type
  TfPedidos = class(TForm)
    quPedidos: TFDQuery;
    quPedidosnumero: TFDAutoIncField;
    quPedidosdata: TDateField;
    quPedidosdescricao: TStringField;
    quPedidossituacao: TSmallintField;
    quPedidosvalorTotal: TFloatField;
    dsPedidos: TDataSource;
    pnl3: TPanel;
    pnlFundoItens: TPanel;
    pnlItens: TPanel;
    pnlDadosItens: TPanel;
    lblItem: TLabel;
    lblQuantidade: TLabel;
    lblVlrDesconto: TLabel;
    cbbItem: TComboBox;
    edtQuantidade: TEdit;
    medValor: TMaskEdit;
    dbgItensPedido: TDBGrid;
    pnlPedidos: TPanel;
    dbgPedidos: TDBGrid;
    pnlCampos: TPanel;
    lblData: TLabel;
    lblDescricao: TLabel;
    lblSituacao: TLabel;
    mmoDescricaoPedido: TMemo;
    cbbSituacao: TComboBox;
    grpFiltro: TGroupBox;
    sbtTAtualizar: TPngSpeedButton;
    lblNumero: TLabel;
    lblFiltroSituacao: TLabel;
    edtFiltroNumero: TEdit;
    cbbFiltroSituacao: TComboBox;
    pnlPedidosCampos: TPanel;
    lblValorBruto: TLabel;
    lblValorDesconto: TLabel;
    lblValorLiquido: TLabel;
    pnlValorLiquido: TPanel;
    pnl1: TPanel;
    pnl2: TPanel;
    pnl4: TPanel;
    pnlSair: TPanel;
    pnlSair2: TPanel;
    sbtSair: TPngSpeedButton;
    pnlTituloPedidos: TPanel;
    quItensPedido: TFDQuery;
    quItensPedidoquantidade: TSmallintField;
    quItensPedidodesconto: TFloatField;
    quItensPedidovalorTotal: TFloatField;
    quItensPedidocodigo: TIntegerField;
    quItensPedidodescricao: TStringField;
    dsItensPedido: TDataSource;
    lblDe: TLabel;
    dtpFiltroDataDe: TDateTimePicker;
    lblAté: TLabel;
    dtpFiltroDataAte: TDateTimePicker;
    dtpData: TDateTimePicker;
    pnl5: TPanel;
    sbtNovoPedido: TPngSpeedButton;
    sbtEditarPedido: TPngSpeedButton;
    sbtCancelarEdicaoPedido: TPngSpeedButton;
    sbtExcluirPedido: TPngSpeedButton;
    pnl6: TPanel;
    sbtNovoItem: TPngSpeedButton;
    sbtEditarItem: TPngSpeedButton;
    sbtCancelarEdicaoItem: TPngSpeedButton;
    sbtExcluirItem: TPngSpeedButton;
    procedure sbtExcluirPedidoClick(Sender: TObject);
    procedure sbtSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtNovoPedidoClick(Sender: TObject);

  private
    { Private declarations }
    Fconexao : TFDConnection;

  public
    { Public declarations }

    procedure AtribuiConexao(objConexao : TFDConnection);
    procedure CarregarPedidos;

  end;

var
  fPedidos: TfPedidos;

implementation

uses objPedido, objItemPedido;

{$R *.dfm}

procedure TfPedidos.AtribuiConexao(objConexao: TFDConnection);
begin
  try
    Fconexao := objConexao;
    Fconexao.Connected := True;

    if quPedidos.Connection = nil then
    begin
      quPedidos.Connection := Fconexao;
      quPedidos.Active := True;
    end;

    if quItensPedido.Connection = nil then
      quItensPedido.Connection := Fconexao;
  except
    on e:Exception do
      ShowMessage('Erro ao iniciar conexão.' + #13 + 'Erro: ' + e.Message);
  end;
end;

procedure TfPedidos.sbtSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfPedidos.CarregarPedidos;
var
  objPedido : TPedido;
begin
  try
    objPedido := TPedido.Create(Fconexao);

    quPedidos.Close;
    quPedidos.SQL.Clear;

    if Trim(edtFiltroNumero.Text) <> '' then
      objPedido.numero := StrToInt(edtFiltroNumero.Text);

    if cbbFiltroSituacao.ItemIndex > 0 then
      objPedido.situacao := cbbFiltroSituacao.ItemIndex;

    objPedido.CarregarPedidos(quPedidos, dtpFiltroDataDe.Date, dtpFiltroDataAte.Date);
    quPedidos.Open;
  finally
    objPedido.Destroy;
  end;
end;

procedure TfPedidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Fconexao.Connected := False;
  Action := caFree;
  fPedidos := nil;
end;

procedure TfPedidos.sbtExcluirPedidoClick(Sender: TObject);
var
  objPedido : TPedido;
  objItensPedido : TItemPedido;
begin
  if MessageDlg('Deseja excluir o pedido ' + IntToStr(quPedidos.FieldByName('NUMERO').AsInteger) + ' e seus itens?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;

  try
    Fconexao.StartTransaction;

    objPedido := TPedido.Create(Fconexao);
    objItensPedido := TItemPedido.Create(Fconexao);

    try
      objItensPedido.numeroPedido := quPedidos.FieldByName('NUMERO').AsInteger;

      if objItensPedido.PossuiItens then
        objItensPedido.ExcluirItensPorPedido;

      objPedido.numero := quPedidos.FieldByName('NUMERO').AsInteger;
      objPedido.Excluir;

      Fconexao.Commit;

      CarregarPedidos;
    except
      on e:Exception do
      begin
        Fconexao.Rollback;
        ShowMessage('Erro ao excluir pedido.' + #13 + 'Erro: ' + e.Message);
      end;
    end;
  finally
    if Fconexao.InTransaction then
      Fconexao.Rollback;

    objPedido.Destroy;
    objItensPedido.Destroy;
  end;
end;

procedure TfPedidos.sbtNovoPedidoClick(Sender: TObject);
var
  objPedido : TPedido;
begin
  try
    objPedido := TPedido.Create(Fconexao);

    try
      objPedido.data := dtpData.Date;
      objPedido.descricao := mmoDescricaoPedido.Lines.Text;
      objPedido.situacao := 1; // 1 = Em análise
      objPedido.Salvar;
    except
      on e:Exception do
        ShowMessage('Erro ao salvar pedido.' + #13 + 'Erro: ' + e.Message);
    end;
  finally
    objPedido.Destroy;
  end;
end;

end.
