unit objItem;

interface

uses System.SysUtils, FireDAC.Comp.Client, Vcl.Dialogs;

type
  TItem = class(TObject)

    private
      Fcodigo: Integer;
      Fdescricao: String;
      Fvalor : Double;
      Fconexao : TFDConnection;

      const tabelaItem : String = 'ITENS';

    protected
      function getCodigo : Integer;
      function getDescricao : String;
      function getValor : Double;
      procedure setCodigo(const Value: Integer);
      procedure setDescricao(const Value: String);
      procedure setValor(const Value: Double);

    public
      property codigo : Integer read getCodigo write setCodigo;
      property descricao : String read getDescricao write setDescricao;
      property valor : Double read getValor write setValor;

      function Salvar : Boolean;
      function Editar : Boolean;
      function Excluir : Boolean;
      procedure BuscarInformacoesItem;
      procedure CarregarItens(var quCarregaItens : TFDQuery);

      constructor Create(objConexao : TFDConnection);
      destructor Destroy;

  end;

implementation

{ TItem }

constructor TItem.Create(objConexao : TFDConnection);
begin
  inherited Create;
  Fconexao := objConexao;
end;

destructor TItem.Destroy;
begin
  inherited;
end;

function TItem.getCodigo: Integer;
begin
  result := Fcodigo;
end;

function TItem.getDescricao: String;
begin
  result := Fdescricao;
end;

function TItem.getValor: Double;
begin
  result := Fvalor;
end;

procedure TItem.setCodigo(const Value: Integer);
begin
  Fcodigo := Value;
end;

procedure TItem.setDescricao(const Value: String);
begin
  Fdescricao := Value;
end;

procedure TItem.setValor(const Value: Double);
begin
  Fvalor := Value;
end;

function TItem.Salvar: Boolean;
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
      quInserir.SQL.Add('INSERT INTO ' + tabelaItem + '( DESCRICAO,  VALOR)');
      quInserir.SQL.Add('VALUES                        (:DESCRICAO, :VALOR)');
      quInserir.Params.ParamByName('DESCRICAO').AsString := descricao;
      quInserir.Params.ParamByName('VALOR').AsFloat := valor;
      quInserir.ExecSQL;

      if quInserir.RowsAffected < 1 then
        raise Exception.Create('Item n�o inserido.');

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

function TItem.Editar: Boolean;
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
      quEditar.SQL.Add('UPDATE ' + tabelaItem);
      quEditar.SQL.Add('SET    DESCRICAO = :DESCRICAO,');
      quEditar.SQL.Add('       VALOR = :VALOR');
      quEditar.SQL.Add('WHERE  CODIGO = :CODIGO');
      quEditar.Params.ParamByName('DESCRICAO').AsString := descricao;
      quEditar.Params.ParamByName('VALOR').AsFloat := valor;
      quEditar.Params.ParamByName('CODIGO').AsInteger := codigo;
      quEditar.ExecSQL;

      if quEditar.RowsAffected < 1 then
        raise Exception.Create('Item n�o alterado.');

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

function TItem.Excluir: Boolean;
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
      quExcluir.SQL.Add('DELETE FROM ' + tabelaItem);
      quExcluir.SQL.Add('WHERE  CODIGO = :CODIGO');
      quExcluir.Params.ParamByName('CODIGO').AsInteger := codigo;
      quExcluir.ExecSQL;

      if quExcluir.RowsAffected < 1 then
        raise Exception.Create('Item n�o exclu�do.');

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

procedure TItem.BuscarInformacoesItem;
var
  quInformacoesItem : TFDQuery;
begin
  try
    quInformacoesItem := TFDQuery.Create(nil);
    quInformacoesItem.Connection := Fconexao;

    try
      quInformacoesItem.Close;
      quInformacoesItem.SQL.Clear;
      quInformacoesItem.SQL.Add('SELECT DESCRICAO, VALOR');
      quInformacoesItem.SQL.Add('FROM   ITENS');
      quInformacoesItem.SQL.Add('WHERE  CODIGO = :CODIGO');
      quInformacoesItem.Params.ParamByName('CODIGO').AsInteger := codigo;
      quInformacoesItem.Open;

      if quInformacoesItem.Eof then
        raise Exception.Create('Informa��es n�o encontradas para o item ' + IntToStr(codigo));

      descricao := quInformacoesItem.FieldByName('DESCRICAO').AsString;
      valor := quInformacoesItem.FieldByName('VALOR').AsFloat;
    except
      on e:Exception do
        raise Exception.Create(e.Message);
    end;
  finally
    quInformacoesItem.Close;
    FreeAndNil(quInformacoesItem);
  end;
end;

procedure TItem.CarregarItens(var quCarregaItens : TFDQuery);
begin
  try
    quCarregaItens.Close;
    quCarregaItens.SQL.Clear;
    quCarregaItens.SQL.Add('SELECT SUBSTR(''0000''||CODIGO, -4) AS CODIGO, DESCRICAO, VALOR');
    quCarregaItens.SQL.Add('FROM   ITENS');
    //quCarregaItens.SQL.Add('WHERE  ATIVO = TRUE');
    quCarregaItens.SQL.Add('ORDER  BY CODIGO DESC');
    quCarregaItens.Open;
  except
    on e:Exception do
      raise Exception.Create(e.Message);
  end;
end;

end.
