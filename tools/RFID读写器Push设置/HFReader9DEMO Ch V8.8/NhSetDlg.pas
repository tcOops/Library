unit NhSetDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfNhSetDlg = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    ComboBox2: TComboBox;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fNhSetDlg: TfNhSetDlg;

implementation

uses Setdlg,fHFReaderdemomain;

{$R *.dfm}

procedure TfNhSetDlg.FormCreate(Sender: TObject);
var
  i:Integer;
begin
  for i:=0 to 99 do
  ComboBox2.Items.Add(IntToStr(i));
end;

procedure TfNhSetDlg.Button2Click(Sender: TObject);
begin
  fSetdlg.Enabled:=True;
  fNhSetDlg.Close;
end;

procedure TfNhSetDlg.Button1Click(Sender: TObject);
begin
  frmHFReaderdemomain.cm:=IntToStr(ComboBox1.ItemIndex);
  frmHFReaderdemomain.ct:=IntToStr(ComboBox2.ItemIndex);
  fSetdlg.Enabled:=True;
  fNhSetDlg.Close;
end;

end.
