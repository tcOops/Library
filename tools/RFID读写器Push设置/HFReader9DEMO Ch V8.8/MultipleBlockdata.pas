unit MultipleBlockdata;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls;

type
  TForm_Mbdata = class(TForm)
    ListView_MBlockData: TListView;
    Panel1: TPanel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Mbdata: TForm_Mbdata;

implementation

{$R *.dfm}

procedure TForm_Mbdata.Button1Click(Sender: TObject);
begin
close;
end;

end.
