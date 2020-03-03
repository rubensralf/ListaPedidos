unit uItens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TfItens = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fItens: TfItens;

implementation

{$R *.dfm}

procedure TfItens.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fItens := nil;
end;

end.
