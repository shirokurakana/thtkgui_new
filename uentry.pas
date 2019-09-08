unit uentry;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TEntry = class(TForm)
    ListBox1: TListBox;
    bOK: TButton;
    bCancel: TButton;
    procedure bOKClick(Sender: TObject);
    procedure bCancelClick(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Entry: TEntry;

implementation

{$R *.dfm}

procedure TEntry.bOKClick(Sender: TObject);
begin
  entry.ModalResult := mrOk;
end;

procedure TEntry.bCancelClick(Sender: TObject);
begin
  entry.ModalResult := mrCancel;
end;

procedure TEntry.ListBox1DblClick(Sender: TObject);
begin
  bOK.Click;
end;

end.
