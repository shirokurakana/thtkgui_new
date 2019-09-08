unit uthtkpath;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TPathTHTK = class(TForm)
    bOK: TButton;
    eTHTKPath: TLabeledEdit;
    bTHTKPathBrowse: TButton;
    bCancel: TButton;
    eGamesPath: TLabeledEdit;
    bGamesPathBrowse: TButton;
    procedure bTHTKPathBrowseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bGamesPathBrowseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PathTHTK: TPathTHTK;

implementation

uses umain;

{$R *.dfm}

procedure TPathTHTK.bGamesPathBrowseClick(Sender: TObject);
begin
  DirectorySelect(eGamesPath);
end;

procedure TPathTHTK.bTHTKPathBrowseClick(Sender: TObject);
begin
  DirectorySelect(eTHTKPath);
end;

procedure TPathTHTK.FormShow(Sender: TObject);
begin
  eTHTKPath.Text := sTHTKPath;
end;

end.
