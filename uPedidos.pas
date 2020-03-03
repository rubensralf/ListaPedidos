unit uPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.Buttons, PngSpeedButton, Vcl.ComCtrls;

type
  TfPedidos = class(TForm)
    quPedidos: TFDQuery;
    quPedidosnumero: TFDAutoIncField;
    quPedidosdata: TDateField;
    quPedidosdescricao: TStringField;
    quPedidossituacao: TSmallintField;
    quPedidosvalorTotal: TFloatField;
    dsPedidos: TDataSource;
    pnlCampos: TPanel;
    dbgPedidos: TDBGrid;
    grpFiltro: TGroupBox;
    sbTAtualizar: TPngSpeedButton;
    Código: TLabel;
    edtFiltroCodigo: TEdit;
    grpFiltroData: TGroupBox;
    De: TLabel;
    Até: TLabel;
    dtpFiltroDataDe: TDateTimePicker;
    dtpFiltroDataAte: TDateTimePicker;
    lblFiltroSituacao: TLabel;
    cbbFiltroSituacao: TComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPedidos: TfPedidos;

implementation

{$R *.dfm}

end.
