unit uItens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, PngSpeedButton, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.VCLUI.Wait, FireDAC.Comp.DataSet, FireDAC.Comp.Client, objItem;

type
  TfItens = class(TForm)
    pnlFundoItens: TPanel;
    pnlItens: TPanel;
    pnl6: TPanel;
    sbtNovoItem: TPngSpeedButton;
    sbtEditarItem: TPngSpeedButton;
    sbtCancelarEdicaoItem: TPngSpeedButton;
    sbtExcluirItem: TPngSpeedButton;
    sbtConfirmarItem: TPngSpeedButton;
    pnlDadosItens: TPanel;
    dbgItens: TDBGrid;
    lblValor: TLabel;
    edtValor: TEdit;
    chkAtivo: TCheckBox;
    lblDescricao: TLabel;
    mmoDescricao: TMemo;
    quItens: TFDQuery;
    dsItens: TDataSource;
    quItenscodigo: TFDAutoIncField;
    quItensdescricao: TStringField;
    quItensvalor: TFloatField;
    quItensativo: TWideStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtExcluirItemClick(Sender: TObject);
    procedure sbtCancelarEdicaoItemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtEditarItemClick(Sender: TObject);
    procedure sbtNovoItemClick(Sender: TObject);
    procedure sbtConfirmarItemClick(Sender: TObject);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorExit(Sender: TObject);
    procedure dbgItensCellClick(Column: TColumn);
    procedure edtValorEnter(Sender: TObject);

  private
    { Private declarations }
    Fconexao : TFDConnection;
    Fitem : TItem;
    novoItem : Boolean;
    alterarItem : Boolean;

    procedure LimpaCampos;

  public
    { Public declarations }
    procedure AtribuiConexao(objConexao : TFDConnection);
    procedure CarregaItens;

  end;

var
  fItens: TfItens;

implementation

{$R *.dfm}

procedure TfItens.AtribuiConexao(objConexao: TFDConnection);
begin
  try
    Fconexao := objConexao;
    Fconexao.Connected := True;

    if quItens.Connection = nil then
    begin
      quItens.Connection := Fconexao;
      quItens.Active := True;
    end;

    Fitem := TItem.Create(Fconexao);
  except
    on e:Exception do
      ShowMessage('Erro ao atribuir conexão!' + #13 + 'Erro: ' + e.Message);
  end;
end;

procedure TfItens.CarregaItens;
begin
  try
    quItens.Close;
    quItens.SQL.Clear;

    Fitem.CarregarItens(quItens);

    quItens.Open;
  except
    on e:Exception do
      ShowMessage('Erro ao carregar itens!' + #13 + 'Erro: ' + e.Message);
  end;
end;

procedure TfItens.dbgItensCellClick(Column: TColumn);
begin
  try
    if not quItens.Eof then
    begin
      Fitem.codigo := quItens.FieldByName('CODIGO').AsInteger;
      Fitem.descricao := quItens.FieldByName('DESCRICAO').AsString;
      Fitem.valor := quItens.FieldByName('VALOR').AsFloat;
      Fitem.ativo := quItens.FieldByName('ATIVO').AsString = 'Sim';

      edtValor.Text := FloatToStr(Fitem.valor);
      edtValorExit(Self);
      chkAtivo.Checked := Fitem.ativo;
      mmoDescricao.Lines.Text := Fitem.descricao;
    end;
  except
    on e:Exception do
      ShowMessage('Erro ao carregar informações do item!' + #13 + 'Erro: ' + e.Message);
  end;
end;

procedure TfItens.edtValorEnter(Sender: TObject);
begin
  edtValor.Text := StringReplace(edtValor.Text, '.', '', [rfReplaceAll]);
end;

procedure TfItens.edtValorExit(Sender: TObject);
begin
  try
    if Trim(edtValor.Text) <> '' then
    begin
      if StrToFloat(StringReplace(edtValor.Text, '.', '', [rfReplaceAll])) > 0 then
      begin
        edtValor.Text := FormatFloat('##,###,###.##', StrToFloat(edtValor.Text));
      end;
    end;
  except
    on e:Exception do
      ShowMessage('Erro ao formatar valor!' + #13 + 'Erro: ' + e.Message);
  end;
end;

procedure TfItens.edtValorKeyPress(Sender: TObject; var Key: Char);
begin
  try
    if not (Key in ['0'..'9', Chr(44), Chr(127), Chr(8)]) then
      Key := #0;
  except
    on e:Exception do
      ShowMessage('Erro ao aplicar regra!' + #13 + 'Erro: ' + e.Message);
  end;
end;

procedure TfItens.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Fconexao.Connected := False;
  Fitem.Destroy;
  Action := caFree;
  fItens := nil;
end;

procedure TfItens.FormCreate(Sender: TObject);
begin
  novoItem := False;
  alterarItem := False;
end;

procedure TfItens.LimpaCampos;
begin
  try
    edtValor.Text := '0,00';
    chkAtivo.Checked := False;
    mmoDescricao.Lines.Clear;
  except
    on e:Exception do
      ShowMessage('Erro ao limpar campos!' + #13 + 'Erro: ' + e.Message);
  end;
end;

procedure TfItens.sbtCancelarEdicaoItemClick(Sender: TObject);
begin
  try
    pnlDadosItens.Enabled := False;
    sbtCancelarEdicaoItem.Enabled := False;
    sbtConfirmarItem.Enabled := False;
    dbgItens.Enabled := True;
    sbtNovoItem.Enabled := True;
    sbtExcluirItem.Enabled := True;
    sbtEditarItem.Enabled := True;
    novoItem := False;
    alterarItem := False;
  except
    on e:Exception do
      ShowMessage('Erro ao cancelar inserção/edição de item.' + #13 + 'Erro: ' + e.Message);
  end;
end;

procedure TfItens.sbtConfirmarItemClick(Sender: TObject);
begin
  try
    Fconexao.StartTransaction;

    try
      if Trim(mmoDescricao.Lines.Text) = '' then
      begin
        ShowMessage('Uma descrição deve ser informada!');
        mmoDescricao.SetFocus;
        Exit;
      end;

      if Trim(edtValor.Text) = '' then
      begin
        ShowMessage('Um valor deve ser informado!');
        edtValor.SetFocus;
        Exit;
      end;

      if StrToFloat(StringReplace(edtValor.Text, '.', '', [rfReplaceAll])) <= 0 then
      begin
        ShowMessage('O valor deve ser maior que zero!');
        edtValor.SetFocus;
        Exit;
      end;

      if StrToFloat(StringReplace(edtValor.Text, '.', '', [rfReplaceAll])) > 99999999.99  then
      begin
        ShowMessage('O valor deve ser menor que R$99.999.999,99!');
        edtValor.SetFocus;
        Exit;
      end;

      Fitem.valor := StrToFloat(StringReplace(edtValor.Text, '.', '', [rfReplaceAll]));
      Fitem.descricao := mmoDescricao.Lines.Text;
      Fitem.ativo := chkAtivo.Checked;

      if novoItem then
        Fitem.Salvar
      else
        if alterarItem then
        begin
          Fitem.codigo := quItens.FieldByName('CODIGO').AsInteger;
          Fitem.Editar;
        end
        else
          raise Exception.Create('Nenhuma operação de item selecionada!');

      quItens.Refresh;

      sbtCancelarEdicaoItemClick(Self);

      Fconexao.Commit;
    except
      on e:Exception do
      begin
        Fconexao.Rollback;
        ShowMessage('Erro ao salvar/alterar item.' + #13 + 'Erro: ' + e.Message);
      end;
    end;
  finally
    if Fconexao.InTransaction then
      Fconexao.Rollback;
  end;
end;

procedure TfItens.sbtEditarItemClick(Sender: TObject);
begin
  try
    if quItens.Eof then
      Exit;

    if quItens.FieldByName('CODIGO').AsInteger <= 0 then
    begin
      ShowMessage('Um item deve ser selecionado para exclusão.');
      Exit;
    end;

    dbgItens.Enabled := False;
    sbtNovoItem.Enabled := False;
    sbtExcluirItem.Enabled := False;
    sbtEditarItem.Enabled := False;
    sbtCancelarEdicaoItem.Enabled := True;
    pnlDadosItens.Enabled := True;
    sbtConfirmarItem.Enabled := True;
    alterarItem := True;
    edtValor.SetFocus;
  except
    on e:Exception do
      ShowMessage('Erro ao habilitar edição de item!' + #13 + 'Erro: ' + e.Message);
  end;
end;

procedure TfItens.sbtExcluirItemClick(Sender: TObject);
begin
  if quItens.Eof then
    Exit;

  if quItens.FieldByName('CODIGO').AsInteger <= 0 then
  begin
    ShowMessage('Um item deve ser selecionado para exclusão.');
    Exit;
  end;

  if MessageDlg('Deseja excluir o item ' + IntToStr(quItens.FieldByName('CODIGO').AsInteger) + '?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;

  try
    Fconexao.StartTransaction;

    try
      Fitem.codigo := quItens.FieldByName('CODIGO').AsInteger;
      Fitem.Excluir;

      Fconexao.Commit;

      LimpaCampos;

      quItens.Refresh;
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

procedure TfItens.sbtNovoItemClick(Sender: TObject);
begin
  try
    LimpaCampos;

    dbgItens.Enabled := False;
    sbtNovoItem.Enabled := False;
    sbtExcluirItem.Enabled := False;
    sbtEditarItem.Enabled := False;
    sbtCancelarEdicaoItem.Enabled := True;
    pnlDadosItens.Enabled := True;
    sbtConfirmarItem.Enabled := True;
    novoItem := True;
    chkAtivo.Checked := True;
    edtValor.SetFocus;
  except
    on e:Exception do
      ShowMessage('Erro ao habilitar inserção de item!' + #13 + 'Erro: ' + e.Message);
  end;
end;

end.
