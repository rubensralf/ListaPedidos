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
  FireDAC.VCLUI.Wait, objPedido, objItemPedido, objItem, objSituacao, Vcl.Menus;

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
    quPedidossituacao_fmt: TStringField;
    quItensPedidonumeroPedido: TIntegerField;
    quItensPedidocodigoItem: TIntegerField;
    quItensPedidodescricao: TStringField;
    quItensPedidovaloritem: TFloatField;
    edtValorDesconto: TEdit;
    pmOpcoes: TPopupMenu;
    mniAprovarPedido: TMenuItem;
    mniCancelarPedido: TMenuItem;
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
    procedure edtValorDescontoKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorDescontoExit(Sender: TObject);
    procedure dbgItensPedidoCellClick(Column: TColumn);
    procedure edtValorDescontoEnter(Sender: TObject);
    procedure mniAprovarPedidoClick(Sender: TObject);
    procedure pmOpcoesPopup(Sender: TObject);
    procedure FormActivate(Sender: TObject);

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
    procedure LimpaCamposPedido;
    procedure LimpaCamposItensPedido;
    procedure CarregarTotalizadores;

  public
    { Public declarations }

    procedure AtribuiConexao(objConexao : TFDConnection);
    procedure CarregarPedidos;
    procedure CarregarSituacoes;
    procedure CarregarItensComboBox;

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

procedure TfPedidos.CarregarItensComboBox;
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
        cbbItem.Items.AddObject(Trim(FormatFloat('00000000', quCarregaItens.FieldByName('CODIGO').AsInteger)) + ' - R$' +
                                Trim(FormatFloat('##,###,##0.00', quCarregaItens.FieldByName('VALOR').AsFloat)) + ' - ' +
                                Trim(quCarregaItens.FieldByName('DESCRICAO').AsString),
                                TObject(Integer(quCarregaItens.FieldByName('CODIGO').AsInteger)));

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

procedure TfPedidos.CarregarTotalizadores;
var
  valorBruto : Double;
  valorDesconto : Double;
  valorLiquido : Double;
begin
  try
    valorBruto := FitemPedido.RetornaValorBruto;
    valorDesconto := FitemPedido.RetornaValorDesconto;
    valorLiquido := FitemPedido.RetornaValorLiquido;

    pnlValorBruto.Caption := 'R$' + FormatFloat('##,###,##0.00', valorBruto);
    pnlValorDesconto.Caption := 'R$' + FormatFloat('##,###,##0.00', valorDesconto);
    pnlValorLiquido.Caption := 'R$' + FormatFloat('##,###,##0.00', valorLiquido);
  except
    on e:Exception do
      ShowMessage('Erro ao carregar valores totais!' + #13 + 'Erro: ' + e.Message);
  end;
end;

procedure TfPedidos.dbgItensPedidoCellClick(Column: TColumn);
begin
  try
    if not quItensPedido.Eof then
    begin
      FitemPedido.numeroPedido := quItensPedido.FieldByName('NUMEROPEDIDO').AsInteger;
      FitemPedido.codigoItem := quItensPedido.FieldByName('CODIGOITEM').AsInteger;
      FitemPedido.quantidade := quItensPedido.FieldByName('QUANTIDADE').AsInteger;
      FitemPedido.desconto := quItensPedido.FieldByName('DESCONTO').AsFloat;
      FitemPedido.valorTotal := quItensPedido.FieldByName('VALORTOTAL').AsFloat;

      Fitem.codigo := FitemPedido.codigoItem;
      Fitem.BuscarInformacoesItem;

      cbbItem.ItemIndex := cbbItem.Items.IndexOfObject(TObject(Integer(FitemPedido.codigoItem)));
      edtQuantidade.Text := IntToStr(FitemPedido.quantidade);
      edtValorDesconto.Text := FloatToStr(FitemPedido.desconto);
      edtValorDescontoExit(Self);
    end;
  except
    on e:Exception do
      ShowMessage('Erro ao carregar informações do item!' + #13 + 'Erro: ' + e.Message);
  end;
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

      FitemPedido.numeroPedido := Fpedido.numero;
      CarregarTotalizadores;
    end;
  except
    on e:Exception do
      ShowMessage('Erro ao carregar informações do pedido!' + #13 + 'Erro: ' + e.Message);
  end;
end;

procedure TfPedidos.edtValorDescontoEnter(Sender: TObject);
begin
  edtValorDesconto.Text := StringReplace(edtValorDesconto.Text, '.', '', [rfReplaceAll]);
end;

procedure TfPedidos.edtValorDescontoExit(Sender: TObject);
begin
  try
    if Trim(edtValorDesconto.Text) <> '' then
    begin
      if StrToFloat(StringReplace(edtValorDesconto.Text, '.', '', [rfReplaceAll])) > 0 then
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

procedure TfPedidos.FormActivate(Sender: TObject);
begin
  if Fconexao <> nil then
  begin
    CarregarPedidos;
    CarregarItensComboBox;
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

procedure TfPedidos.LimpaCamposItensPedido;
begin
  try
    cbbItem.ItemIndex := -1;
    edtQuantidade.Text := '0';
    edtValorDesconto.Text := '0,00';
  except
    on e:Exception do
      ShowMessage('Erro ao limpar campos dos itens do pedido!' + #13 + 'Erro: ' + e.Message);
  end;
end;

procedure TfPedidos.LimpaCamposPedido;
begin
  try
    dtpData.Date := Now;
    mmoDescricaoPedido.Lines.Clear;
  except
    on e:Exception do
      ShowMessage('Erro ao limpar campos do pedido!' + #13 + 'Erro: ' + e.Message);
  end;
end;

procedure TfPedidos.mniAprovarPedidoClick(Sender: TObject);
begin
  try
    Fpedido.situacao := TMenuItem(Sender).Tag;
    Fpedido.AlterarSituacao;
    quPedidos.Refresh;
  except
    on e:Exception do
      ShowMessage('Erro ao alterar situação do pedido para ' + TMenuItem(Sender).Caption + #13 + 'Erro: ' + e.Message);
  end;
end;

procedure TfPedidos.pmOpcoesPopup(Sender: TObject);
begin
  try
    mniAprovarPedido.Enabled := Fpedido.situacao = 1;
    mniCancelarPedido.Enabled := Fpedido.situacao = 1;
  except
    on e:Exception do
      ShowMessage('Erro ao validar situação!' + #13 + 'Erro: ' + e.Message);
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
        edtQuantidade.SetFocus;
        Exit;
      end;

      if StrToFloat(StringReplace(edtValorDesconto.Text, '.', '', [rfReplaceAll])) > 99999999.99  then
      begin
        ShowMessage('O valor deve ser menor que R$99.999.999,99!');
        edtValorDesconto.SetFocus;
        Exit;
      end;

      FitemPedido.numeroPedido := Fpedido.numero;
      FitemPedido.codigoItem := Integer(cbbItem.Items.Objects[cbbItem.ItemIndex]);

      if ((novoItem) and (FitemPedido.ItemExistenteNoPedido)) then
      begin
        ShowMessage('Item já existe no pedido, não é possível adicionar itens duplicados!');
        Exit;
      end;

      FitemPedido.quantidade := StrToInt(edtQuantidade.Text);
      FitemPedido.desconto := StrToFloat(StringReplace(edtValorDesconto.Text, '.', '', [rfReplaceAll]));

      Fitem.codigo := FitemPedido.codigoItem;
      Fitem.BuscarInformacoesItem;

      FitemPedido.valorTotal := (Fitem.valor * FitemPedido.quantidade) - FitemPedido.desconto;

      if FitemPedido.valorTotal <= 0 then
        raise Exception.Create('O valor total do item deve ser maior que 0!');

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

      Fpedido.valorTotal := FitemPedido.RetornaValorLiquido;
      Fpedido.AtualizarValorTotal;

      dbgPedidosCellClick(nil);

      CarregarTotalizadores;
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

        CarregarPedidos;
        dbgPedidosCellClick(nil);
      end
      else
        if alterarPedido then
        begin
          Fpedido.numero := quPedidos.FieldByName('NUMERO').AsInteger;
          Fpedido.Editar;
          quPedidos.Refresh;
        end
        else
          raise Exception.Create('Nenhuma operação de pedido selecionada!');

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
    if quItensPedido.Eof then
      Exit;

    if quItensPedido.FieldByName('NUMEROPEDIDO').AsInteger <= 0 then
    begin
      ShowMessage('Um item deve ser selecionado para exclusão.');
      Exit;
    end;

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
    LimpaCamposItensPedido;

    if quPedidos.Eof then
      Exit;

    if quPedidos.FieldByName('NUMERO').AsInteger <= 0 then
    begin
      ShowMessage('Um pedido deve ser selecionado para exclusão.');
      Exit;
    end;

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
  if quItensPedido.Eof then
    Exit;

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

    LimpaCamposItensPedido;
  finally
    if Fconexao.InTransaction then
      Fconexao.Rollback;
  end;
end;

procedure TfPedidos.sbtExcluirPedidoClick(Sender: TObject);
begin
  if quPedidos.Eof then
    Exit;

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

    LimpaCamposPedido;
  finally
    if Fconexao.InTransaction then
      Fconexao.Rollback;
  end;
end;

procedure TfPedidos.sbtNovoItemClick(Sender: TObject);
begin
  try
    LimpaCamposItensPedido;

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
    LimpaCamposPedido;
    LimpaCamposItensPedido;

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
