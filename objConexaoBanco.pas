unit objConexaoBanco;

interface

uses
  Forms, System.SysUtils, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.SQLiteDef, FireDAC.Phys.SQLite,
  FireDAC.DApt;

type
  TConexaoBanco = class(TObject)

    private
      FconexaoBanco : TFDConnection;

    protected
      function getConexaoBanco: TFDConnection;

    public
      property conexaoBanco : TFDConnection read getConexaoBanco;

      constructor Create;
      destructor Destroy;

  end;

implementation

{ TConexaoBanco }

constructor TConexaoBanco.Create;
begin
  FconexaoBanco := TFDConnection.Create(Application);
  FconexaoBanco.Connected := False;
  FconexaoBanco.LoginPrompt := False;
  FconexaoBanco.Params.DriverID := 'SQLite';
  FconexaoBanco.Params.Database := ExtractFileDir(Application.ExeName) + '\pedidos.db';
  FconexaoBanco.Connected := True;
end;

destructor TConexaoBanco.Destroy;
begin
  FconexaoBanco.Connected := False;
  FconexaoBanco.Free;
  inherited;
end;

function TConexaoBanco.getConexaoBanco: TFDConnection;
begin
  result := FconexaoBanco;
end;

end.
