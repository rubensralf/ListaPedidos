unit objItemPedido;

interface

uses System.SysUtils, FireDAC.Comp.Client, Vcl.Dialogs;

type
  TItemPedido = class(TObject)

    private
      FnumeroPedido : Integer;
      FcodigoItem : Integer;
      Fquantidade : Integer;
      Fdesconto : Double;
      Fconexao : TFDConnection;
      FvalorTotal : Double;

      const tabelaItensPedido : String = 'ITENSPEDIDO';

    protected
      function getNumeroPedido: Integer;
      function getCodigoItem: Integer;
      function getQuantidade: Integer;
      function getDesconto: Double;
      function getValorTotal: Double;
      procedure setNumeroPedido(const Value: Integer);
      procedure setCodigoItem(const Value: Integer);
      procedure setQuantidade(const Value: Integer);
      procedure setDesconto(const Value: Double);
      procedure setValorTotal(const Value: Double);

    public
      property numeroPedido : Integer read getNumeroPedido write setNumeroPedido;
      property codigoItem : Integer read getCodigoItem write setCodigoItem;
      property quantidade : Integer read getQuantidade write setQuantidade;
      property desconto : Double read getDesconto write setDesconto;
      property valorTotal : Double read getValorTotal write setValorTotal;

      function Salvar : Boolean;
      function Editar : Boolean;
      function Excluir : Boolean;
      function ExcluirItensPorPedido : Boolean;
      function PossuiItens : Boolean;
      function RetornaValorTotalSomado : Double;

      procedure CarregarItensPedido(var quItensPedido : TFDQuery);

      constructor Create(objConexao : TFDConnection);
      destructor Destroy;

  end;

implementation

{ TItemPedido }

function TItemPedido.getCodigoItem: Integer;
begin
  result := FcodigoItem;
end;

function TItemPedido.getDesconto: Double;
begin
  result := Fdesconto;
end;

function TItemPedido.getNumeroPedido: Integer;
begin
  result := FnumeroPedido;
end;

function TItemPedido.getQuantidade: Integer;
begin
  result := Fquantidade;
end;

function TItemPedido.getValorTotal: Double;
begin
  result := FvalorTotal;
end;

procedure TItemPedido.setCodigoItem(const Value: Integer);
begin
  FcodigoItem := Value;
end;

procedure TItemPedido.setDesconto(const Value: Double);
begin
  Fdesconto := Value;
end;

procedure TItemPedido.setNumeroPedido(const Value: Integer);
begin
  FnumeroPedido := Value;
end;

procedure TItemPedido.setQuantidade(const Value: Integer);
begin
  Fquantidade := Value;
end;

procedure TItemPedido.setValorTotal(const Value: Double);
begin
  FvalorTotal := Value;
end;

procedure TItemPedido.CarregarItensPedido(var quItensPedido: TFDQuery);
begin
  try
    quItensPedido.Close;
    quItensPedido.SQL.Clear;
    quItensPedido.SQL.Add('SELECT ITPED.NUMEROPEDIDO, ITPED.CODIGOITEM, ITPED.QUANTIDADE, ITPED.DESCONTO,');
    quItensPedido.SQL.Add('       ITEM.VALOR AS VALORITEM, ITPED.VALORTOTAL, ITEM.DESCRICAO');
    quItensPedido.SQL.Add('FROM   ITENSPEDIDO ITPED');
    quItensPedido.SQL.Add('       INNER JOIN ITENS ITEM ON ITEM.CODIGO = ITPED.CODIGOITEM');
    quItensPedido.SQL.Add('WHERE  NUMEROPEDIDO = :NUMEROPEDIDO');
    quItensPedido.SQL.Add('ORDER  BY CODIGOITEM');
    quItensPedido.Params.ParamByName('NUMEROPEDIDO').AsInteger := numeroPedido;
    quItensPedido.Open;
  except
    on e:Exception do
      ShowMessage('Erro ao carregar itens do pedido!' + #13 + 'Erro: ' + e.Message);
  end;
end;

constructor TItemPedido.Create(objConexao: TFDConnection);
begin
  inherited Create;
  Fconexao := objConexao;
end;

destructor TItemPedido.Destroy;
begin
  inherited;
end;

function TItemPedido.Salvar: Boolean;
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
      quInserir.SQL.Add('INSERT INTO ' + tabelaItensPedido + '( NUMEROPEDIDO,  CODIGOITEM,  QUANTIDADE,  DESCONTO,  VALORTOTAL)');
      quInserir.SQL.Add('VALUES                               (:NUMEROPEDIDO, :CODIGOITEM, :QUANTIDADE, :DESCONTO, :VALORTOTAL)');
      quInserir.Params.ParamByName('NUMEROPEDIDO').AsInteger := numeroPedido;
      quInserir.Params.ParamByName('CODIGOITEM').AsInteger := codigoItem;
      quInserir.Params.ParamByName('QUANTIDADE').AsInteger := quantidade;
      quInserir.Params.ParamByName('DESCONTO').AsFloat := desconto;
      quInserir.Params.ParamByName('VALORTOTAL').AsFloat := valorTotal;
      quInserir.ExecSQL;

      if quInserir.RowsAffected < 1 then
        raise Exception.Create('Item do pedido n�o inserido.');

      result := True;
    except
      on e:Exception do
        raise Exception.Create(e.Message);
    end;
  finally
    quInserir.Close;
    FreeAndNil(quInserir);
  end;
end;

function TItemPedido.Editar: Boolean;
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
      quEditar.SQL.Add('UPDATE ' + tabelaItensPedido);
      quEditar.SQL.Add('SET    QUANTIDADE = :QUANTIDADE,');
      quEditar.SQL.Add('       DESCONTO = :DESCONTO,');
      quEditar.SQL.Add('       VALORTOTAL =  :VALORTOTAL');
      quEditar.SQL.Add('WHERE  NUMEROPEDIDO = :NUMEROPEDIDO');
      quEditar.SQL.Add('AND    CODIGOITEM = :CODIGOITEM');
      quEditar.Params.ParamByName('QUANTIDADE').AsInteger := quantidade;
      quEditar.Params.ParamByName('DESCONTO').AsFloat := desconto;
      quEditar.Params.ParamByName('VALORTOTAL').AsFloat := valorTotal;
      quEditar.Params.ParamByName('NUMEROPEDIDO').AsDate := numeroPedido;
      quEditar.Params.ParamByName('CODIGOITEM').AsInteger := codigoItem;
      quEditar.ExecSQL;

      if quEditar.RowsAffected < 1 then
        raise Exception.Create('Item do pedido n�o alterado.');

      result := True;
    except
      on e:Exception do
        raise Exception.Create(e.Message);
    end;
  finally
    quEditar.Close;
    FreeAndNil(quEditar);
  end;
end;

function TItemPedido.Excluir: Boolean;
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
      quExcluir.SQL.Add('DELETE FROM ' + tabelaItensPedido);
      quExcluir.SQL.Add('WHERE  NUMEROPEDIDO = :NUMEROPEDIDO');
      quExcluir.SQL.Add('AND    CODIGOITEM = :CODIGOITEM');
      quExcluir.Params.ParamByName('NUMEROPEDIDO').AsDate := numeroPedido;
      quExcluir.Params.ParamByName('CODIGOITEM').AsInteger := codigoItem;
      quExcluir.ExecSQL;

      if quExcluir.RowsAffected < 1 then
        raise Exception.Create('Item do pedido n�o exclu�do.');

      result := True;
    except
      on e:Exception do
        raise Exception.Create(e.Message);
    end;
  finally
    quExcluir.Close;
    FreeAndNil(quExcluir);
  end;
end;

function TItemPedido.ExcluirItensPorPedido: Boolean;
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
      quExcluir.SQL.Add('DELETE FROM ' + tabelaItensPedido);
      quExcluir.SQL.Add('WHERE  NUMEROPEDIDO = :NUMEROPEDIDO');
      quExcluir.Params.ParamByName('NUMEROPEDIDO').AsDate := numeroPedido;
      quExcluir.ExecSQL;

      if quExcluir.RowsAffected < 1 then
        raise Exception.Create('Itens do pedido n�o exclu�dos.');

      result := True;
    except
      on e:Exception do
        raise Exception.Create(e.Message);
    end;
  finally
    quExcluir.Close;
    FreeAndNil(quExcluir);
  end;
end;

function TItemPedido.PossuiItens: Boolean;
var
  quItensPedido : TFDQuery;
begin
  try
    quItensPedido := TFDQuery.Create(nil);
    quItensPedido.Connection := Fconexao;

    try
      result := false;

      quItensPedido.Close;
      quItensPedido.SQL.Clear;
      quItensPedido.SQL.Add('SELECT CODIGOITEM');
      quItensPedido.SQL.Add('FROM   ITENSPEDIDO');
      quItensPedido.SQL.Add('WHERE  NUMEROPEDIDO = :NUMEROPEDIDO');
      quItensPedido.Params.ParamByName('NUMEROPEDIDO').AsInteger := numeroPedido;
      quItensPedido.Open;

      if not quItensPedido.Eof then
        result := true;
    except
      on e:Exception do
        raise Exception.Create(e.Message);
    end;
  finally
    quItensPedido.Close;
    FreeAndNil(quItensPedido);
  end;
end;

function TItemPedido.RetornaValorTotalSomado: Double;
var
  quSomarValorTotal : TFDQuery;
begin
  try
    result := 0;

    quSomarValorTotal := TFDQuery.Create(nil);
    quSomarValorTotal.Connection := Fconexao;

    try
      quSomarValorTotal.Close;
      quSomarValorTotal.SQL.Clear;
      quSomarValorTotal.SQL.Add('SELECT SUM(VALORTOTAL) VALORTOTAL');
      quSomarValorTotal.SQL.Add('FROM   ITENSPEDIDO');
      quSomarValorTotal.SQL.Add('WHERE  NUMEROPEDIDO = :NUMEROPEDIDO');
      quSomarValorTotal.Params.ParamByName('NUMEROPEDIDO').AsInteger := numeroPedido;
      quSomarValorTotal.Open;

      if not quSomarValorTotal.Eof then
        result := quSomarValorTotal.FieldByName('VALORTOTAL').AsFloat;
    except
      on e:Exception do
        raise Exception.Create(e.Message);
    end;
  finally
    quSomarValorTotal.Close;
    FreeAndNil(quSomarValorTotal);
  end;
end;

end.
