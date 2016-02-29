unit MBLOCKDATA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFrmMBlocKData = class(TForm)
    Memo_MBlockData: TMemo;
    Panel1: TPanel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMBlocKData: TFrmMBlocKData;

implementation

{$R *.dfm}

procedure TFrmMBlocKData.Button1Click(Sender: TObject);
begin
close;
end;

end.
