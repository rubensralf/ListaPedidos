unit uPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.Buttons, PngSpeedButton, Vcl.ComCtrls, Vcl.Mask,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.VCLUI.Wait, objPedido, objItemPedido, objItem, objSituacao;

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
    dbgItensPedido: TDBGrid;
    pnlPedidos: TPanel;
    dbgPedidos: TDBGrid;
    pnlCampos: TPanel;
    grpFiltro: TGroupBox;
    sbtTAtualizarPedidos: TPngSpeedButton;
    lblNumero: TLabel;
    lblFiltroSituacao: TLabel;
    edtFiltroNumero: TEdit;
    cbbFiltroSituacao: TComboBox;
    pnlPedidosCampos: TPanel;
    lblValorBruto: TLabel;
    lblValorDesconto: TLabel;
    lblValorLiquido: TLabel;
    pnlValorBruto: TPanel;
    pnlValorDesconto: TPanel;
    pnlValorLiquido: TPanel;
    pnl4: TPanel;
    pnlSair: TPanel;
    pnlSair2: TPanel;
    sbtSair: TPngSpeedButton;
    pnlTituloPedidos: TPanel;
    quItensPedido: TFDQuery;
    quItensPedidoquantidade: TSmallintField;
    quItensPedidodesconto: TFloatField;
    quItensPedidovalorTotal: TFloatField;
    dsItensPedido: TDataSource;
    lblDe: TLabel;
    dtpFiltroDataDe: TDateTimePicker;
    lblAté: TLabel;
    dtpFiltroDataAte: TDateTimePicker;
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
    pnlCamposPedidos: TPanel;
    lblData: TLabel;
    dtpData: TDateTimePicker;
    lblDescricao: TLabel;
    mmoDescricaoPedido: TMemo;
    sbtConfirmarPedido: TPngSpeedButton;
    sbtConfirmarItemPedido: TPngSpeedButton;
    con1: TFDConnection;
    quPedidossituacao_fmt: TStringField;
    quItensPedidonumeroPedido: TIntegerField;
    quItensPedidocodigoItem: TIntegerField;
    quItensPedidodescricao: TStringField;
    quItensPedidovaloritem: TFloatField;
    edtValorDesconto: TEdit;
    procedure sbtExcluirPedidoClick(Sender: TObject);
    procedure sbtSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtNovoPedidoClick(Sender: TObject);
    procedure sbtEditarPedidoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtTAtualizarPedidosClick(Sender: TObject);
    procedure sbtCancelarEdicaoPedidoClick(Sender: TObject);
    procedure sbtConfirmarPedidoClick(Sender: TObject);
    procedure dbgPedidosCellClick(Column: TColumn);
    procedure sbtEditarItemClick(Sender: TObject);
    procedure sbtCancelarEdicaoItemClick(Sender: TObject);
    procedure sbtExcluirItemClick(Sender: TObject);
    procedure sbtNovoItemClick(Sender: TObject);
    procedure sbtConfirmarItemPedidoClick(Sender: TObject);
    procedure cbbItemDropDown(Sender: TObject);
    procedure edtValorDescontoKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorDescontoExit(Sender: TObject);

  private
    { Private declarations }
    Fconexao : TFDConnection;
    Fpedido : TPedido;
    FitemPedido : TItemPedido;
    Fitem : TItem;
    Fsituacao : TSituacao;
    novoPedido : Boolean;
    alterarPedido : Boolean;
    novoItem : Boolean;
    alterarItem : Boolean;

    procedure CarregarItensPedido;
    procedure CarregarItens;

  public
    { Public declarations }

    procedure AtribuiConexao(objConexao : TFDConnection);
    procedure CarregarPedidos;
    procedure CarregarSituacoes;

  end;

var
  fPedidos: TfPedidos;

implementation

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

    Fpedido := TPedido.Create(Fconexao);
    FitemPedido := TItemPedido.Create(Fconexao);
    Fitem := TItem.Create(Fconexao);
    Fsituacao := TSituacao.Create(Fconexao);
  except
    on e:Exception do
      ShowMessage('Erro ao iniciar conexão.' + #13 + 'Erro: ' + e.Message);
  end;
end;

procedure TfPedidos.sbtSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfPedidos.sbtTAtualizarPedidosClick(Sender: TObject);
begin
  CarregarPedidos;
end;

procedure TfPedidos.CarregarItens;
var
  quCarregaItens : TFDQuery;
begin
  try
    quCarregaItens := TFDQuery.Create(Self);
    quCarregaItens.Connection := Fconexao;

    try
      quCarregaItens.Close;
      quCarregaItens.SQL.Clear;

      Fitem.CarregarItens(quCarregaItens);

      cbbItem.Items.Clear;

      while not quCarregaItens.Eof do
      begin
        cbbItem.Items.Add(quCarregaItens.FieldByName('CODIGO').AsString + ' - R$' +
                          quCarregaItens.FieldByName('VALOR').AsString + ' - ' +
                          quCarregaItens.FieldByName('DESCRICAO').AsString);

        quCarregaItens.Next;
      end;
    except
      on e:Exception do
        ShowMessage('Erro ao carregar itens!' + #13 + 'Erro: ' + e.Message);
    end;
  finally
    quCarregaItens.Close;
    FreeAndNil(quCarregaItens);
  end;
end;

procedure TfPedidos.CarregarItensPedido;
begin
  try    
    quItensPedido.Close;
    quItensPedido.SQL.Clear;

    FitemPedido.numeroPedido := Fpedido.numero;
    FitemPedido.CarregarItensPedido(quItensPedido);

    quItensPedido.Open;
  except
    on e:Exception do
      ShowMessage('Erro ao carregar pedidos!' + #13 + 'Erro: ' + e.Message);
  end;
end;

procedure TfPedidos.CarregarPedidos;
begin
  try
    quPedidos.Close;
    quPedidos.SQL.Clear;

    if Trim(edtFiltroNumero.Text) <> '' then
      Fpedido.numero := StrToInt(edtFiltroNumero.Text)
    else
      Fpedido.numero := 0;

    if cbbFiltroSituacao.ItemIndex >= 0 then
      Fpedido.situacao := StrToInt(Copy(cbbFiltroSituacao.Text, 1, 2))
    else
      Fpedido.situacao := 0;

    Fpedido.CarregarPedidos(quPedidos, dtpFiltroDataDe.Date, dtpFiltroDataAte.Date);

    quPedidos.Open;
  except
    on e:Exception do
      ShowMessage('Erro ao carregar pedidos!' + #13 + 'Erro: ' + e.Message);
  end;
end;

procedure TfPedidos.CarregarSituacoes;
var
  quSituacoes : TFDQuery;
begin
  try
    quSituacoes := TFDQuery.Create(Self);
    quSituacoes.Connection := Fconexao;

    try
      quSituacoes.Close;
      quSituacoes.SQL.Clear;

      Fsituacao.BuscaSituacoes(quSituacoes);

      cbbFiltroSituacao.Items.Clear;
      cbbFiltroSituacao.Items.Add('00 - Todos');

      while not quSituacoes.Eof do
      begin
        cbbFiltroSituacao.Items.Add(quSituacoes.FieldByName('CODIGO').AsString + ' - ' +
                                    quSituacoes.FieldByName('DESCRICAO').AsString);

        quSituacoes.Next;
      end;

      cbbFiltroSituacao.ItemIndex := 0;
    except
      on e:Exception do
        ShowMessage('Erro ao carregar situações!' + #13 + 'Erro: ' + e.Message);
    end;
  finally
    quSituacoes.Close;
    FreeAndNil(quSituacoes);
  end;
end;

procedure TfPedidos.cbbItemDropDown(Sender: TObject);
begin
  CarregarItens;
end;

procedure TfPedidos.dbgPedidosCellClick(Column: TColumn);
begin
  try
    if not quPedidos.Eof then
    begin
      Fpedido.numero := quPedidos.FieldByName('NUMERO').AsInteger;
      Fpedido.data := quPedidos.FieldByName('DATA').AsDateTime;
      Fpedido.descricao := quPedidos.FieldByName('DESCRICAO').AsString;
      Fpedido.situacao := quPedidos.FieldByName('SITUACAO').AsInteger;
      Fpedido.valorTotal := quPedidos.FieldByName('VALORTOTAL').AsFloat;

      dtpData.Date := Fpedido.data;
      mmoDescricaoPedido.Lines.Text := Fpedido.descricao;
      pnlValorLiquido.Caption := 'R$' + FormatFloat('##,###,##0.00', Fpedido.valorTotal);

      pnlFundoItens.Enabled := True;
      CarregarItensPedido;
    end;
  except
    on e:Exception do
      ShowMessage('Erro ao carregar informações do pedido!' + #13 + 'Erro: ' + e.Message);
  end;
end;

procedure TfPedidos.edtValorDescontoExit(Sender: TObject);
begin
  try
    if Trim(edtValorDesconto.Text) <> '' then
    begin
      if StrToFloat(edtValorDesconto.Text) > 0 then
      begin
        edtValorDesconto.Text := FormatFloat('##,###,###.##', StrToFloat(edtValorDesconto.Text));
      end;
    end;
  except
    on e:Exception do
      ShowMessage('Erro ao formatar valor!' + #13 + 'Erro: ' + e.Message);
  end;
end;

procedure TfPedidos.edtValorDescontoKeyPress(Sender: TObject; var Key: Char);
begin
  try
    if not (Key in ['0'..'9', Chr(44), Chr(127), Chr(8)]) then
      Key := #0;
  except
    on e:Exception do
      ShowMessage('Erro ao aplicar regra!' + #13 + 'Erro: ' + e.Message);
  end;
end;

procedure TfPedidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Fconexao.Connected := False;

  Fpedido.Destroy;
  FitemPedido.Destroy;
  Fitem.Destroy;
  Fsituacao.Destroy;

  Action := caFree;
  fPedidos := nil;
end;

procedure TfPedidos.FormCreate(Sender: TObject);
begin
  try
    novoPedido := False;
    alterarPedido := False;
    novoItem := False;
    alterarItem := False;

    dtpData.Date := Now;
    dtpFiltroDataDe.Date := StrToDate('01/' + FormatDateTime('mm/yyyy', Date));
    dtpFiltroDataAte.Date := Now;
  except
    on e:Exception do
      ShowMessage('Erro ao iniciar sistema!' + #13 + 'Erro: ' + e.Message);
  end;
end;

procedure TfPedidos.sbtCancelarEdicaoItemClick(Sender: TObject);
begin
  try
    pnlPedidos.Enabled := True;
    dbgItensPedido.Enabled := True;
    sbtNovoItem.Enabled := True;
    sbtExcluirItem.Enabled := True;
    sbtEditarItem.Enabled := True;
    sbtCancelarEdicaoItem.Enabled := False;
    pnlDadosItens.Enabled := False;
    sbtConfirmarItemPedido.Enabled := False;
    novoItem := False;
    alterarItem := False;
  except
    on e:Exception do
      ShowMessage('Erro ao cancelar edição de itens!' + #13 + 'Erro: ' + e.Message);
  end;
end;

procedure TfPedidos.sbtCancelarEdicaoPedidoClick(Sender: TObject);
begin
  try
    pnlCamposPedidos.Enabled := False;
    grpFiltro.Enabled := True;
    sbtConfirmarPedido.Enabled := False;
    novoPedido := False;
    alterarPedido := False;
    sbtCancelarEdicaoPedido.Enabled := False;
    sbtNovoPedido.Enabled := True;
    sbtEditarPedido.Enabled := True;
    sbtExcluirPedido.Enabled := True;
    pnlFundoItens.Enabled := True;
    dbgPedidos.Enabled := True;
  except
    on e:Exception do
      ShowMessage('Erro ao cancelar inserção/edição de pedido!' + #13 + 'Erro: ' + e.Message);
  end;
end;

procedure TfPedidos.sbtConfirmarItemPedidoClick(Sender: TObject);
begin
  try
    Fconexao.StartTransaction;

    try
      if cbbItem.ItemIndex < 0 then
      begin
        ShowMessage('Um item deve ser selecionado!');
        cbbItem.SetFocus;
        Exit;
      end;

      if Trim(edtQuantidade.Text) = '' then
      begin
        ShowMessage('Uma quantidade deve ser informada!');
        Exit;
      end;

      if StrToInt(edtQuantidade.Text) <= 0  then
      begin
        ShowMessage('A quantidade deve ser maior que zero!');
        Exit;
      end;

      FitemPedido.numeroPedido := Fpedido.numero;
      FitemPedido.codigoItem := StrToInt(Copy(cbbItem.Text, 1, 4));
      FitemPedido.quantidade := StrToInt(edtQuantidade.Text);
      FitemPedido.desconto := StrToFloat(edtValorDesconto.Text);

      Fitem.codigo := FitemPedido.codigoItem;
      Fitem.BuscarInformacoesItem;

      FitemPedido.valorTotal := (Fitem.valor * FitemPedido.quantidade) - FitemPedido.desconto;

      if novoItem then
        FitemPedido.Salvar
      else
        if alterarItem then
          FitemPedido.Editar
        else
          raise Exception.Create('Nenhuma operação de item selecionada!');

      Fconexao.Commit;

      quItensPedido.Close;
      quItensPedido.Open;

      sbtCancelarEdicaoItemClick(Self);

      Fpedido.valorTotal := FitemPedido.RetornaValorTotalSomado;
      Fpedido.AtualizarValorTotal;

      dbgPedidosCellClick(nil);
    except
      on e:Exception do
      begin
        Fconexao.Rollback;
        ShowMessage('Erro ao salvar item do pedido.' + #13 + 'Erro: ' + e.Message);
      end;
    end;
  finally
    if Fconexao.InTransaction then
      Fconexao.Rollback;
  end;
end;

procedure TfPedidos.sbtConfirmarPedidoClick(Sender: TObject);
begin
  try
    Fconexao.StartTransaction;

    try
      if Trim(mmoDescricaoPedido.Lines.Text) = '' then
      begin
        ShowMessage('Uma descrição deve ser informada!');
        mmoDescricaoPedido.SetFocus;
        Exit;
      end;

      Fpedido.data := dtpData.Date;
      Fpedido.descricao := mmoDescricaoPedido.Lines.Text;

      if novoPedido then
      begin
        Fpedido.situacao := 1; // 1 = Em análise
        Fpedido.Salvar;
      end
      else
        if alterarPedido then
        begin
          Fpedido.numero := quPedidos.FieldByName('NUMERO').AsInteger;
          Fpedido.Editar;
        end
        else
          raise Exception.Create('Nenhuma operação de pedido selecionada!');

      quPedidos.Refresh;

      sbtCancelarEdicaoPedidoClick(Self);

      Fconexao.Commit;
    except
      on e:Exception do
      begin
        Fconexao.Rollback;
        ShowMessage('Erro ao salvar pedido.' + #13 + 'Erro: ' + e.Message);
      end;
    end;
  finally
    if Fconexao.InTransaction then
      Fconexao.Rollback;
  end;
end;

procedure TfPedidos.sbtEditarItemClick(Sender: TObject);
begin
  try
    pnlPedidos.Enabled := False;
    dbgItensPedido.Enabled := False;
    sbtNovoItem.Enabled := False;
    sbtExcluirItem.Enabled := False;
    sbtEditarItem.Enabled := False;
    sbtCancelarEdicaoItem.Enabled := True;
    pnlDadosItens.Enabled := True;
    sbtConfirmarItemPedido.Enabled := True;
    alterarItem := True;
    cbbItem.SetFocus;
  except
    on e:Exception do
      ShowMessage('Erro ao habilitar edição de itens!' + #13 + 'Erro: ' + e.Message);
  end;
end;

procedure TfPedidos.sbtEditarPedidoClick(Sender: TObject);
begin
  try
    pnlCamposPedidos.Enabled := True;
    grpFiltro.Enabled := False;
    sbtConfirmarPedido.Enabled := True;
    alterarPedido := True;
    sbtCancelarEdicaoPedido.Enabled := True;
    sbtEditarPedido.Enabled := False;
    sbtNovoPedido.Enabled := False;
    sbtExcluirPedido.Enabled := False;
    pnlFundoItens.Enabled := False;
    dbgPedidos.Enabled := False;
    mmoDescricaoPedido.SetFocus;
  except
    on e:Exception do
      ShowMessage('Erro ao habilitar edição de pedido!' + #13 + 'Erro: ' + e.Message);
  end;
end;

procedure TfPedidos.sbtExcluirItemClick(Sender: TObject);
begin
   if quItensPedido.FieldByName('NUMEROPEDIDO').AsInteger <= 0 then
  begin
    ShowMessage('Um item deve ser selecionado para exclusão.');
    Exit;
  end;

  if MessageDlg('Deseja excluir o item ' + IntToStr(quItensPedido.FieldByName('CODIGOITEM').AsInteger) + ' do pedido ' + IntToStr(quItensPedido.FieldByName('NUMEROPEDIDO').AsInteger) + '?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;

  try
    Fconexao.StartTransaction;

    try
      FitemPedido.numeroPedido := quPedidos.FieldByName('NUMERO').AsInteger;

      if FitemPedido.PossuiItens then
        FitemPedido.Excluir;

      Fconexao.Commit;

      CarregarItensPedido;
    except
      on e:Exception do
      begin
        Fconexao.Rollback;
        ShowMessage('Erro ao excluir item.' + #13 + 'Erro: ' + e.Message);
      end;
    end;
  finally
    if Fconexao.InTransaction then
      Fconexao.Rollback;
  end;
end;

procedure TfPedidos.sbtExcluirPedidoClick(Sender: TObject);
begin
  if quPedidos.FieldByName('NUMERO').AsInteger <= 0 then
  begin
    ShowMessage('Um pedido deve ser selecionado para exclusão.');
    Exit;
  end;

  if quPedidos.FieldByName('SITUACAO').AsInteger <> 1 then
  begin
    ShowMessage('O pedido deve estar em análise para poder ser excluído.');
    Exit;
  end;

  if MessageDlg('Deseja excluir o pedido ' + IntToStr(quPedidos.FieldByName('NUMERO').AsInteger) + ' e seus itens?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;

  try
    Fconexao.StartTransaction;

    try
      FitemPedido.numeroPedido := quPedidos.FieldByName('NUMERO').AsInteger;

      if FitemPedido.PossuiItens then
        FitemPedido.ExcluirItensPorPedido;

      Fpedido.numero := quPedidos.FieldByName('NUMERO').AsInteger;
      Fpedido.Excluir;

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
  end;
end;

procedure TfPedidos.sbtNovoItemClick(Sender: TObject);
begin
  try
    pnlPedidos.Enabled := False;
    dbgItensPedido.Enabled := False;
    sbtNovoItem.Enabled := False;
    sbtExcluirItem.Enabled := False;
    sbtEditarItem.Enabled := False;
    sbtCancelarEdicaoItem.Enabled := True;
    pnlDadosItens.Enabled := True;
    sbtConfirmarItemPedido.Enabled := True;
    novoItem := True;
    cbbItem.SetFocus;
  except
    on e:Exception do
      ShowMessage('Erro ao habilitar inclusão de itens!' + #13 + 'Erro: ' + e.Message);
  end;
end;

procedure TfPedidos.sbtNovoPedidoClick(Sender: TObject);
begin
  try
    pnlCamposPedidos.Enabled := True;
    grpFiltro.Enabled := False;
    sbtConfirmarPedido.Enabled := True;
    novoPedido := True;
    sbtCancelarEdicaoPedido.Enabled := True;
    sbtNovoPedido.Enabled := False;
    sbtEditarPedido.Enabled := False;
    sbtExcluirPedido.Enabled := False;
    pnlFundoItens.Enabled := False;
    dbgPedidos.Enabled := False;

    dtpData.Date := Now;
    mmoDescricaoPedido.Lines.Clear;
    mmoDescricaoPedido.SetFocus;
  except
    on e:Exception do
      ShowMessage('Erro ao habilitar inclusão de pedido!' + #13 + 'Erro: ' + e.Message);
  end;
end;

end.
