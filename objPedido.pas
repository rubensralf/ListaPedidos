unit objPedido;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, Vcl.Dialogs;

type
  TPedido = class(TObject)

    private
      Fnumero: Integer;
      Fdata : TDate;
      Fdescricao : String;
      Fsituacao : Integer;
      FvalorTotal : Double;
      Fconexao : TFDConnection;

      const tabelaPedidos : String = 'PEDIDOS';

    protected
      function getNumero : Integer;
      function getData : TDate;
      function getDescricao: String;
      function getSituacao: Integer;
      function getValorTotal: Double;
      procedure setNumero(const Value: Integer);
      procedure setData(const Value: TDate);
      procedure setDescricao(const Value: String);
      procedure setSituacao(const Value: Integer);
      procedure setValorTotal(const Value: Double);

      function Salvar : Boolean;
      function Editar : Boolean;
      function Excluir : Boolean;
      function AlterarSituacao(novaSituacao : Integer) : Boolean;
      function AtualizarValorTotal(novoValorTotal : Double) : Boolean;

    public
      property numero : Integer read getNumero write setNumero;
      property data : TDate read getData write setData;
      property descricao : String read getDescricao write setDescricao;
      property situacao : Integer read getSituacao write setSituacao;
      property valorTotal : Double read getValorTotal write setValorTotal;

      constructor Create(objConexao : TFDConnection);
      destructor Destroy;

  end;

implementation

{ TPedido }

constructor TPedido.Create(objConexao : TFDConnection);
begin
  inherited Create;
  Fconexao := objConexao;
end;

destructor TPedido.Destroy;
begin
  inherited;
end;

function TPedido.getData: TDate;
begin
  result := Fdata;
end;

function TPedido.getDescricao: String;
begin
  result := Fdescricao;
end;

function TPedido.getNumero: Integer;
begin
  result := Fnumero;
end;

function TPedido.getSituacao: Integer;
begin
  result := Fsituacao;
end;

function TPedido.getValorTotal: Double;
begin
  result := FvalorTotal;
end;

procedure TPedido.setData(const Value: TDate);
begin
  Fdata := Value;
end;

procedure TPedido.setDescricao(const Value: String);
begin
  Fdescricao := Value;
end;

procedure TPedido.setNumero(const Value: Integer);
begin
  Fnumero := Value;
end;

procedure TPedido.setSituacao(const Value: Integer);
begin
  Fsituacao := Value;
end;

procedure TPedido.setValorTotal(const Value: Double);
begin
  FvalorTotal := Value;
end;

function TPedido.Salvar : Boolean;
var
  quInserir : TFDQuery;
begin
  try
    result := False;

    quInserir := TFDQuery.Create(nil);
    quInserir.Connection := Fconexao;

    try
      quInserir.Close;
      quInserir.SQL.Clear;
      quInserir.SQL.Add('INSERT INTO ' + tabelaPedidos + '(DATA,  DESCRICAO,  SITUACAO,  VALORTOTAL)');
      quInserir.SQL.Add('VALUES                          (:DATA, :DESCRICAO, :SITUACAO, :VALORTOTAL)');
      quInserir.Params.ParamByName('DATA').AsDate := data;
      quInserir.Params.ParamByName('DESCRICAO').AsString := descricao;
      quInserir.Params.ParamByName('SITUACAO').AsInteger := situacao;
      quInserir.Params.ParamByName('VALORTOTAL').AsFloat := valorTotal;
      quInserir.ExecSQL;

      if quInserir.RowsAffected < 1 then
        raise Exception.Create('Pedido não inserido.');

      result := True;
    except
      on e:Exception do
        ShowMessage('Falha ao salvar pedido!' + #13 + 'Erro: ' + e.Message);
    end;
  finally
    quInserir.Close;
    FreeAndNil(quInserir);
  end;
end;

function TPedido.Editar : Boolean;
var
  quEditar : TFDQuery;
begin
  try
    result := False;

    quEditar := TFDQuery.Create(nil);
    quEditar.Connection := Fconexao;

    try
      quEditar.Close;
      quEditar.SQL.Clear;
      quEditar.SQL.Add('UPDATE ' + tabelaPedidos);
      quEditar.SQL.Add('SET    DATA = :DATA,');
      quEditar.SQL.Add('       DESCRICAO = :DESCRICAO');
      quEditar.SQL.Add('WHERE  NUMERO = :NUMERO');
      quEditar.Params.ParamByName('DATA').AsDate := data;
      quEditar.Params.ParamByName('DESCRICAO').AsString := descricao;
      quEditar.Params.ParamByName('SITUACAO').AsInteger := situacao;
      quEditar.Params.ParamByName('NUMERO').AsInteger := numero;
      quEditar.ExecSQL;

      if quEditar.RowsAffected <> 1 then
        raise Exception.Create('Pedido não alterado.');

      result := True;
    except
      on e:Exception do
        ShowMessage('Falha ao alterar pedido!' + #13 + 'Erro: ' + e.Message);
    end;
  finally
    quEditar.Close;
    FreeAndNil(quEditar);
  end;
end;

function TPedido.Excluir : Boolean;
var
  quExcluir : TFDQuery;
begin
  try
    result := False;

    quExcluir := TFDQuery.Create(nil);
    quExcluir.Connection := Fconexao;

    try
      quExcluir.Close;
      quExcluir.SQL.Clear;
      quExcluir.SQL.Add('DELETE FROM ' + tabelaPedidos);
      quExcluir.SQL.Add('WHERE  NUMERO = :NUMERO');
      quExcluir.Params.ParamByName('NUMERO').AsInteger := numero;
      quExcluir.ExecSQL;

      if quExcluir.RowsAffected <> 1 then
        raise Exception.Create('Pedido não excluído. Linhas afetadas: ' + IntToStr(quExcluir.RowsAffected));

      result := True;
    except
      on e:Exception do
        ShowMessage('Falha ao excluir o pedido e seus itens!' + #13 + 'Erro: ' + e.Message);
    end;
  finally
    quExcluir.Close;
    FreeAndNil(quExcluir);
  end;
end;

function TPedido.AlterarSituacao(novaSituacao: Integer) : Boolean;
var
  quAlterarSituacao : TFDQuery;
begin
  try
    result := False;

    quAlterarSituacao := TFDQuery.Create(nil);
    quAlterarSituacao.Connection := Fconexao;

    try
      quAlterarSituacao.Close;
      quAlterarSituacao.SQL.Clear;
      quAlterarSituacao.SQL.Add('UPDATE ' + tabelaPedidos);
      quAlterarSituacao.SQL.Add('SET    SITUACAO = :SITUACAO');
      quAlterarSituacao.SQL.Add('WHERE  NUMERO = :NUMERO');
      quAlterarSituacao.Params.ParamByName('SITUACAO').AsInteger := situacao;
      quAlterarSituacao.Params.ParamByName('NUMERO').AsInteger := numero;
      quAlterarSituacao.ExecSQL;

      if quAlterarSituacao.RowsAffected <> 1 then
        raise Exception.Create('Situação não alterada.');

      result := True;
    except
      on e:Exception do
        ShowMessage('Falha ao alterar situação pedido!' + #13 + 'Erro: ' + e.Message);
    end;
  finally
    quAlterarSituacao.Close;
    FreeAndNil(quAlterarSituacao);
  end;
end;

function TPedido.AtualizarValorTotal(novoValorTotal: Double): Boolean;
var
  quAtualizarValor : TFDQuery;
begin
  try
    result := False;

    quAtualizarValor := TFDQuery.Create(nil);
    quAtualizarValor.Connection := Fconexao;

    try
      quAtualizarValor.Close;
      quAtualizarValor.SQL.Clear;
      quAtualizarValor.SQL.Add('UPDATE ' + tabelaPedidos);
      quAtualizarValor.SQL.Add('SET    VALORTOTAL = :VALORTOTAL');
      quAtualizarValor.SQL.Add('WHERE  NUMERO = :NUMERO');
      quAtualizarValor.Params.ParamByName('VALORTOTAL').AsFloat := novoValorTotal;
      quAtualizarValor.Params.ParamByName('NUMERO').AsInteger := numero;
      quAtualizarValor.ExecSQL;

      if quAtualizarValor.RowsAffected <> 1 then
        raise Exception.Create('Valor total não atualizado.');

      result := True;
    except
      on e:Exception do
        ShowMessage('Falha ao atualizar valor!' + #13 + 'Erro: ' + e.Message);
    end;
  finally
    quAtualizarValor.Close;
    FreeAndNil(quAtualizarValor);
  end;
end;

end.
