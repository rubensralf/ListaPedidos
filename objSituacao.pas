unit objSituacao;

interface

uses System.SysUtils, System.Classes, FireDAC.Comp.Client;

type
  TSituacao = class(TObject)

    private
      Fcodigo: Integer;
      Fdescricao : String;
      Fconexao : TFDConnection;

    protected
      function getCodigo: Integer;
      function getDescricao: String;
      procedure Setcodigo(const Value: Integer);
      procedure setDescricao(const Value: String);

    public
       property codigo : Integer read getCodigo write setCodigo;
       property descricao : String read getDescricao write setDescricao;

       procedure BuscaSituacoes(var quSituacoes : TFDQuery);

       constructor Create(conexao : TFDConnection);
       destructor Destroy;
  end;

implementation

{ TSituacao }

constructor TSituacao.Create(conexao: TFDConnection);
begin
  inherited Create;
  Fconexao := conexao;
end;

destructor TSituacao.Destroy;
begin
  inherited;
end;

function TSituacao.getCodigo: Integer;
begin
  result := Fcodigo;
end;

function TSituacao.getDescricao: String;
begin
  result := Fdescricao;
end;

procedure TSituacao.Setcodigo(const Value: Integer);
begin
  Fcodigo := Value;
end;

procedure TSituacao.setDescricao(const Value: String);
begin
  Fdescricao := Value;
end;

procedure TSituacao.BuscaSituacoes(var quSituacoes : TFDQuery);
begin
  try
    quSituacoes.Close;
    quSituacoes.SQL.Clear;
    quSituacoes.SQL.Add('SELECT SUBSTR(''00''||CODIGO, -2) AS CODIGO, DESCRICAO');
    quSituacoes.SQL.Add('FROM   SITUACOES');
    quSituacoes.SQL.Add('ORDER  BY CODIGO');
    quSituacoes.Open;
  except
    on e:Exception do
      raise Exception.Create(e.Message);
  end;
end;

end.
