unit umain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.FileCtrl, StrUtils,
  Vcl.ExtCtrls, IniFiles, ShellAPI, Vcl.Menus, uentry, uthtkpath, Masks;

type
  TMain = class(TForm)
    GroupBox2: TGroupBox;
    eTHMSGFile: TLabeledEdit;
    eTHMSGArchive: TLabeledEdit;
    bTHMSGFileBrowse: TButton;
    bTHMSGArchiveBrowse: TButton;
    bTHMSGCreate: TButton;
    bTHMSGDump: TButton;
    GroupBox3: TGroupBox;
    eTHANMFolder: TLabeledEdit;
    eTHANMArchive: TLabeledEdit;
    bTHANMFolderBrowse: TButton;
    bTHANMArchiveBrowse: TButton;
    bTHANMCreate: TButton;
    bTHANMList: TButton;
    bTHANMExtract: TButton;
    GroupBox1: TGroupBox;
    eTHDATFolder: TLabeledEdit;
    eTHDATArchive: TLabeledEdit;
    bTHDATFolderBrowse: TButton;
    bTHDATArchiveBrowse: TButton;
    bTHDATCreate: TButton;
    bTHDATList: TButton;
    bTHDATExtract: TButton;
    eTHANMEntry: TLabeledEdit;
    bTHANMEntryBrowse: TButton;
    eTHANMFile: TLabeledEdit;
    bTHANMFileBrowse: TButton;
    bTHANMReplace: TButton;
    GroupBox4: TGroupBox;
    eTHECLFile: TLabeledEdit;
    eTHECLArchive: TLabeledEdit;
    bTHECLFileBrowse: TButton;
    bTHECLArchiveBrowse: TButton;
    bTHECLCreate: TButton;
    bTHECLDump: TButton;
    cEndingDialogue: TCheckBox;
    cIgnoreErrors: TCheckBox;
    eTHANMSpec: TLabeledEdit;
    bTHANMSpecBrowse: TButton;
    Timer1: TTimer;
    MainMenu1: TMainMenu;
    miGame: TMenuItem;
    miSettings: TMenuItem;
    miHelp: TMenuItem;
    miHelpAbout: TMenuItem;
    miSettingsPath: TMenuItem;
    miSettingsClearFields: TMenuItem;
    N2: TMenuItem;
    miSettingsLocal: TMenuItem;
    N1: TMenuItem;
    miSettingsShowDosOnError: TMenuItem;
    N3: TMenuItem;
    miHelpHelp: TMenuItem;
    miSettingsBackup: TMenuItem;
    pCurrentGame: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure bTHDATFolderBrowseClick(Sender: TObject);
    procedure bTHANMFolderBrowseClick(Sender: TObject);
    procedure bTHDATArchiveBrowseClick(Sender: TObject);
    procedure bTHANMArchiveBrowseClick(Sender: TObject);
    procedure bTHANMFileBrowseClick(Sender: TObject);
    procedure bTHECLArchiveBrowseClick(Sender: TObject);
    procedure bTHECLFileBrowseClick(Sender: TObject);
    procedure bTHMSGFileBrowseClick(Sender: TObject);
    procedure bTHMSGArchiveBrowseClick(Sender: TObject);
    procedure bTHDATCreateClick(Sender: TObject);
    procedure bTHDATListClick(Sender: TObject);
    procedure bTHDATExtractClick(Sender: TObject);
    procedure bTHANMCreateClick(Sender: TObject);
    procedure bTHANMListClick(Sender: TObject);
    procedure bTHANMExtractClick(Sender: TObject);
    procedure bTHANMReplaceClick(Sender: TObject);
    procedure bTHECLCreateClick(Sender: TObject);
    procedure bTHMSGCreateClick(Sender: TObject);
    procedure bTHECLDumpClick(Sender: TObject);
    procedure bTHMSGDumpClick(Sender: TObject);
    procedure bTHANMEntryBrowseClick(Sender: TObject);
    procedure bTHANMSpecBrowseClick(Sender: TObject);
    procedure eTHANMArchiveChange(Sender: TObject);
    procedure eTHDATFolderChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure eTHANMEntryKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure miHelpAboutClick(Sender: TObject);
    procedure miSettingsPathClick(Sender: TObject);
    procedure miGameClick(Sender: TObject);
    procedure miSettingsLocalClick(Sender: TObject);
    procedure miSettingsClearFieldsClick(Sender: TObject);
    procedure eTHECLArchiveChange(Sender: TObject);
    procedure eTHMSGArchiveChange(Sender: TObject);
    procedure miSettingsShowDosOnErrorClick(Sender: TObject);
    procedure miHelpHelpClick(Sender: TObject);
    procedure eTHANMFolderChange(Sender: TObject);
    procedure miSettingsBackupClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;
  sAppDir, sDefDir, sListFilename, sIgnore, sEnding, sTHTKPath, sGamesPath,
    sHelpFile: string;
  slGames, slLocal: TStringList;
  bShowErrorsInDos: boolean = true;

  T_OPEN_DIALOG_FILE, T_OPEN_DIALOG_FOLDER, MA_ALL_FILES, MA_PNG_FILES,
    MA_TXT_FILES, MA_ANM_FILES, MA_ECL_FILES, MA_DAT_FILES, MA_MSG_FILES,
    ERR_DAT_FILE_WRONG, ERR_GAME_NUMBER_UNREADABLE, ERR_THTK_MODULE_NOT_FOUND,
    ERR_FILE_DOES_NOT_EXIST, ERR_FILE_ALREADY_EXISTS, ERR_FOLDER_DOES_NOT_EXIST,
    ERR_UNABLE_TO_CREATE_FOLDER, ERR_UNABLE_TO_CREATE_BACKUP,
    ERR_LISTFILE_NOT_FOUND, ERR_SPECFILE_NOT_FOUND, ABOUT_INFO: string;

const
  INI_FILE_NAME = 'thtkgui.ini';
  LANG_FILE_NAME = 'local.ini';
  ECL_DEFAULT_SUBFOLDER = 'ECL';
  MSG_DEFAULT_SUBFOLDER = 'MSG';
  ANM_DEFAULT_SUBFOLDER = 'ANM';

function GetGameNumber: string;
function CheckTHTK(sFileName: string): boolean;
function CheckGame(sFileName: string): boolean;
function AddQuotes(s: string): string;
function MakeBackup(sFileName: string): boolean;
function ExtractFileNameOnly(sFileName: string; sExt: string = ''): string;
procedure ApplyLocalization(sLang: string);
procedure SaveGameSettings(sSection: string);
procedure LoadGameSettings(sSection: string);
procedure DirectorySelect(var Edit: TLabeledEdit);
procedure FileSelect(var Edit: TLabeledEdit; sFileMask: string = '';
  sDisplayName: string = ''; bIsDat: boolean = false);
procedure CommExec(sUtl, sComm, sGameNum, sArchive, sWorkDir: string;
  sParam1: string = ''; sParam2: string = ''; sParam3: string = '';
  sParam4: string = '');

implementation

{$R *.dfm}

function GetGameNumber: string;
begin
  GetGameNumber := slGames.Values[Main.pCurrentGame.Caption];
end;

function CheckTHTK(sFileName: string): boolean;
begin
  if FileExists(sTHTKPath + '\' + sFileName + '.exe') then
    CheckTHTK := true
  else
  begin
    MessageDlg(Format(ERR_THTK_MODULE_NOT_FOUND, [sFileName]), mtError,
      [mbOK], 0);
    CheckTHTK := false;
  end;
end;

function CheckGame(sFileName: string): boolean;
begin
  CheckGame := MatchesMask(sFileName, '*th' + GetGameNumber + '.dat*') or
    MatchesMask(sFileName, '*th' + GetGameNumber + 'e*.dat*') or
    MatchesMask(sFileName, '*th' + GetGameNumber + 'r*.dat*');
end;

function AddQuotes(s: string): string;
begin
  if s <> '' then
    AddQuotes := '"' + s + '"'
  else
    AddQuotes := '';
end;

function MakeBackup(sFileName: string): boolean;
var
  i: integer;
begin
  for i := 0 to MaxInt do
    if not FileExists(sFileName + '.bkp' + IntToStr(i)) then
    begin
      MakeBackup := RenameFile(sFileName, sFileName + '.bkp' + IntToStr(i));
      Break;
    end;
end;

function ExtractFileNameOnly(sFileName: string; sExt: string = ''): string;
var
  s: string;
begin
  s := ExtractFileName(sFileName);
  ExtractFileNameOnly := Copy(s, 1, Pos('.' + sExt, s) - 1);
end;

procedure ApplyLocalization(sLang: string);
begin
  with TMemIniFile.Create(sAppDir + '\' + LANG_FILE_NAME, TEncoding.UTF8) do
    try
      with Main do
      begin
        miGame.Caption := ReadString(sLang, 'MI_GAME', '');
        miSettings.Caption := ReadString(sLang, 'MI_SETTINGS', '');
        miSettingsPath.Caption := ReadString(sLang, 'MI_PATHS', '');
        miSettingsClearFields.Caption :=
          ReadString(sLang, 'MI_CLEAR_FIELDS', '');
        miSettingsBackup.Caption := ReadString(sLang, 'MI_AUTO_BACKUP', '');
        miSettingsShowDosOnError.Caption :=
          ReadString(sLang, 'MI_SHOW_ERROR', '');
        miHelp.Caption := ReadString(sLang, 'MI_HELP', '');
        miHelpHelp.Caption := ReadString(sLang, 'MI_HELP_HELP', '');
        miHelpAbout.Caption := ReadString(sLang, 'MI_ABOUT', '');
        eTHDATFolder.EditLabel.Caption := ReadString(sLang, 'E_FOLDER', '');
        eTHDATArchive.EditLabel.Caption := ReadString(sLang, 'E_ARCHIVE', '');
        bTHDATCreate.Caption :=
          ReadString(sLang, 'B_CREATE_ARCHIVE_FROM_FOLDER', '');
        bTHDATList.Caption := ReadString(sLang, 'B_GET_FILELIST', '');
        bTHDATExtract.Caption :=
          ReadString(sLang, 'B_EXTRACT_ARCHIVE_TO_FOLDER', '');

        eTHANMFolder.EditLabel.Caption := ReadString(sLang, 'E_FOLDER', '');
        eTHANMArchive.EditLabel.Caption := ReadString(sLang, 'E_ARCHIVE', '');
        eTHANMSpec.EditLabel.Caption := ReadString(sLang, 'E_SPEC', '');
        bTHANMCreate.Caption :=
          ReadString(sLang, 'B_CREATE_ARCHIVE_FROM_FOLDER', '');
        bTHANMList.Caption := ReadString(sLang, 'B_GET_SPEC', '');
        bTHANMExtract.Caption :=
          ReadString(sLang, 'B_EXTRACT_ARCHIVE_TO_FOLDER', '');
        eTHANMEntry.EditLabel.Caption := ReadString(sLang, 'E_NAME', '');
        eTHANMFile.EditLabel.Caption := ReadString(sLang, 'E_FILE', '');
        bTHANMReplace.Caption :=
          ReadString(sLang, 'B_REPLACE_FILE_IN_ARCHIVE', '');
        cIgnoreErrors.Caption := ReadString(sLang, 'CB_IGNORE_ERRORS', '');

        eTHECLFile.EditLabel.Caption := ReadString(sLang, 'E_FILE', '');
        eTHECLArchive.EditLabel.Caption := ReadString(sLang, 'E_ARCHIVE', '');
        bTHECLCreate.Caption :=
          ReadString(sLang, 'B_CREATE_ARCHIVE_FROM_FILE', '');
        bTHECLDump.Caption := ReadString(sLang,
          'B_EXCTRACT_ARCHIVE_TO_FILE', '');

        eTHMSGFile.EditLabel.Caption := ReadString(sLang, 'E_FILE', '');
        eTHMSGArchive.EditLabel.Caption := ReadString(sLang, 'E_ARCHIVE', '');
        bTHMSGCreate.Caption :=
          ReadString(sLang, 'B_CREATE_ARCHIVE_FROM_FILE', '');
        bTHMSGDump.Caption := ReadString(sLang,
          'B_EXCTRACT_ARCHIVE_TO_FILE', '');
        cEndingDialogue.Caption := ReadString(sLang, 'CB_ENDING_DIALOGUE', '');

        Entry.Caption := ReadString(sLang, 'T_CHOOSE_FILE_TO_REPLACE', '');
        Entry.bOK.Caption := ReadString(sLang, 'B_OK', '');
        Entry.bCancel.Caption := ReadString(sLang, 'B_CANCEL', '');
        PathTHTK.Caption := ReadString(sLang, 'T_PATHS', '');
        PathTHTK.eTHTKPath.EditLabel.Caption :=
          ReadString(sLang, 'E_THTK_PATH', '');
        PathTHTK.eGamesPath.EditLabel.Caption :=
          ReadString(sLang, 'E_TOUHOU_PATH', '');
        PathTHTK.bOK.Caption := ReadString(sLang, 'B_OK', '');
        PathTHTK.bCancel.Caption := ReadString(sLang, 'B_CANCEL', '');

        T_OPEN_DIALOG_FILE := ReadString(sLang, 'T_OPEN_DIALOG_FILE', '');
        T_OPEN_DIALOG_FOLDER := ReadString(sLang, 'T_OPEN_DIALOG_FOLDER', '');
        MA_ALL_FILES := ReadString(sLang, 'MA_ALL_FILES', '');
        MA_PNG_FILES := ReadString(sLang, 'MA_PNG_FILES', '');
        MA_TXT_FILES := ReadString(sLang, 'MA_TXT_FILES', '');
        MA_ANM_FILES := ReadString(sLang, 'MA_ANM_FILES', '');
        MA_ECL_FILES := ReadString(sLang, 'MA_ECL_FILES', '');
        MA_DAT_FILES := ReadString(sLang, 'MA_DAT_FILES', '');
        MA_MSG_FILES := ReadString(sLang, 'MA_MSG_FILES', '');
        ERR_DAT_FILE_WRONG := ReadString(sLang, 'ERR_DAT_FILE_WRONG', '');
        ERR_GAME_NUMBER_UNREADABLE :=
          ReadString(sLang, 'ERR_GAME_NUMBER_UNREADABLE', '');
        ERR_THTK_MODULE_NOT_FOUND :=
          ReadString(sLang, 'ERR_THTK_MODULE_NOT_FOUND', '');
        ERR_FILE_DOES_NOT_EXIST :=
          ReadString(sLang, 'ERR_FILE_DOES_NOT_EXIST', '');
        ERR_FILE_ALREADY_EXISTS :=
          ReadString(sLang, 'ERR_FILE_ALREADY_EXISTS', '');
        ERR_FOLDER_DOES_NOT_EXIST :=
          ReadString(sLang, 'ERR_FOLDER_DOES_NOT_EXIST', '');
        ERR_UNABLE_TO_CREATE_FOLDER :=
          ReadString(sLang, 'ERR_UNABLE_TO_CREATE_FOLDER', '');
        ERR_UNABLE_TO_CREATE_BACKUP :=
          ReadString(sLang, 'ERR_UNABLE_TO_CREATE_BACKUP', '');
        ERR_LISTFILE_NOT_FOUND :=
          ReadString(sLang, 'ERR_LISTFILE_NOT_FOUND', '');
        ERR_SPECFILE_NOT_FOUND :=
          ReadString(sLang, 'ERR_SPECFILE_NOT_FOUND', '');
        ABOUT_INFO := ReadString(sLang, 'ABOUT_INFO', '');
        sHelpFile := sAppDir + '\help\Help_' + sLang + '.chm';
      end;
    finally
      Free;
    end;

end;

procedure SaveGameSettings(sSection: string);
var
  i: integer;
begin
  with TMemIniFile.Create(sAppDir + '\' + INI_FILE_NAME, TEncoding.UTF8) do
    try
      WriteString('OPTIONS', 'THTK_MAIN_PATH', sTHTKPath);
      WriteString('OPTIONS', 'TOUHOU_GAMES_PATH', sGamesPath);
      WriteInteger('OPTIONS', 'GAME_INDEX', Main.MainMenu1.Tag);
      WriteInteger('OPTIONS', 'WIN_HEIGHT', Main.Height);
      WriteInteger('OPTIONS', 'WIN_WIDTH', Main.Width);
      WriteBool('OPTIONS', 'SHOW_ERRORS',
        Main.miSettingsShowDosOnError.Checked);
      WriteBool('OPTIONS', 'MI_AUTO_BACKUP', Main.miSettingsBackup.Checked);
      for i := 0 to slLocal.Count - 1 do
        if Main.miSettingsLocal[i].Checked then
          WriteString('OPTIONS', 'LANGUAGE',  WideString(Main.miSettingsLocal[i].Caption));
      WriteString(sSection, 'THDAT_FOLDER', WideString(Main.eTHDATFolder.Text));
      WriteString(sSection, 'THDAT_ARCHIVE', WideString(Main.eTHDATArchive.Text));
      WriteString(sSection, 'THANM_ARCHIVE', WideString(Main.eTHANMArchive.Text));
      WriteString(sSection, 'THANM_FILE', WideString(Main.eTHANMFile.Text));
      WriteString(sSection, 'THANM_ENTRY', WideString(Main.eTHANMEntry.Text));
      WriteString(sSection, 'THECL_ARCHIVE', WideString(Main.eTHECLArchive.Text));
      WriteString(sSection, 'THMSG_ARCHIVE', WideString(Main.eTHMSGArchive.Text));
    finally
      UpdateFile;
      Free;
    end;
end;

procedure LoadGameSettings(sSection: string);
var
  sBuff: string; wsBuff: WideString;
begin
  with TMemIniFile.Create(sAppDir + '\' + INI_FILE_NAME, TEncoding.UTF8) do
    try
      wsBuff := ReadString(sSection, 'THDAT_FOLDER', '');
      Main.eTHDATFolder.Text := wsBuff;
      if Main.eTHDATFolder.Text = '' then
        Main.eTHDATFolder.Text := sDefDir;
      wsBuff := ReadString(sSection, 'THDAT_ARCHIVE', '');
      Main.eTHDATArchive.Text := wsBuff;
      wsBuff := ReadString(sSection, 'THANM_ARCHIVE', '');
      Main.eTHANMArchive.Text := wsBuff;
      wsBuff := ReadString(sSection, 'THANM_FILE', '');
      Main.eTHANMFile.Text := wsBuff;
      wsBuff := ReadString(sSection, 'THANM_ENTRY', '');
      Main.eTHANMFile.Text := wsBuff;
      wsBuff := ReadString(sSection, 'THECL_ARCHIVE', '');
      Main.eTHECLArchive.Text := wsBuff;
      wsBuff := ReadString(sSection, 'THMSG_ARCHIVE', '');
      Main.eTHMSGArchive.Text := wsBuff;
    finally
      Free;
    end;
end;

procedure DirectorySelect(var Edit: TLabeledEdit);
var
  sDir, sRoot: string;
begin
  if Edit.Text <> '' then
    sDir := Edit.Text
  else if Main.eTHDATFolder.Text <> '' then
    sDir := Main.eTHDATFolder.Text
  else
    sDir := ExtractFileDrive(sAppDir);
  if Win32MajorVersion >= 6 then
    with TFileOpenDialog.Create(nil) do
      try
        Title := T_OPEN_DIALOG_FOLDER;
        Options := [fdoPickFolders, fdoPathMustExist, fdoForceFileSystem];
        DefaultFolder := sDir;
        if Execute then
          Edit.Text := FileName;
      finally
        Free;
      end
  else if SelectDirectory('', sRoot, sDir, [sdNewUI, sdNewFolder], nil) then
    Edit.Text := sDir;
end;

procedure FileSelect(var Edit: TLabeledEdit; sFileMask: string = '';
  sDisplayName: string = ''; bIsDat: boolean = false);
  function GetFilePath(s: string): string;
  begin
    if DirectoryExists(s) then
      GetFilePath := s
    else
      GetFilePath := ExtractFilePath(s);
  end;

var
  sDir: string;
begin
  if Edit.Text <> '' then
    sDir := Edit.Text
  else if bIsDat then
    if (sGamesPath <> '') then
      sDir := sGamesPath
    else
      sDir := ExtractFileDrive(sAppDir)
  else if Main.eTHDATFolder.Text <> '' then
    sDir := Main.eTHDATFolder.Text
  else
    sDir := ExtractFileDrive(sAppDir);

  if not DirectoryExists(sDir) then
    sDir := ExtractFileDir(sDir);

  with TFileOpenDialog.Create(nil) do
    try
      Title := T_OPEN_DIALOG_FILE;
      DefaultFolder := sDir;
      if sFileMask <> '' then
        with FileTypes.Add do
        begin
          FileMask := sFileMask;
          DisplayName := sDisplayName;
        end;
      with FileTypes.Add do
      begin
        FileMask := '*.*';
        DisplayName := MA_ALL_FILES;
      end;
      if Execute then
        Edit.Text := FileName;
    finally
      Free;
    end
end;

procedure CommExec(sUtl, sComm, sGameNum, sArchive, sWorkDir: string;
  sParam1: string = ''; sParam2: string = ''; sParam3: string = '';
  sParam4: string = '');
var
  sParam, sDrive: string;
begin
  sDrive := ExtractFileDrive(sWorkDir);
  sParam := sDrive + '&&' + 'cd ' + AddQuotes(sWorkDir) + '&&' +
    AddQuotes(sTHTKPath + '\' + sUtl + '.exe ') + ' ' + sComm + sGameNum + ' ' +
    AddQuotes(sArchive) + ' ' + sParam1 + ' ' + sParam2 + ' ' + sParam3 + ' ' +
    sParam4 + '&&exit';
  if Main.miSettingsShowDosOnError.Checked then
    sParam := '/k ' + AddQuotes(sParam)
  else
    sParam := '/c ' + AddQuotes(sParam);
  ShellExecute(0, PChar('open'), PChar('cmd.exe'), PChar(sParam),
    PChar(AddQuotes(sWorkDir)), sw_show);
end;

procedure TMain.bTHMSGCreateClick(Sender: TObject);
begin
  if not CheckTHTK('thmsg') then
    exit;
  if not FileExists(eTHMSGFile.Text) then
  begin
    MessageDlg(Format(ERR_FILE_DOES_NOT_EXIST, [eTHMSGFile.Text]), mtError,
      [mbOK], 0);
    exit;
  end;
  if FileExists(eTHMSGArchive.Text) then
    if MessageDlg(Format(ERR_FILE_ALREADY_EXISTS, [eTHMSGArchive.Text]),
      mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      exit;
  if cEndingDialogue.Checked then
    sEnding := '-e'
  else
    sEnding := '';
  CommExec('thmsg', '-c', GetGameNumber + sEnding, '', eTHDATFolder.Text,
    AddQuotes(eTHMSGFile.Text), AddQuotes(eTHMSGArchive.Text));
end;

procedure TMain.bTHANMEntryBrowseClick(Sender: TObject);
var
  i: integer;
begin
  if not FileExists(eTHANMSpec.Text) then
  begin
    MessageDlg(Format(ERR_SPECFILE_NOT_FOUND, [eTHANMSpec.Text]), mtError,
      [mbOK], 0);
    exit;
  end;
  with Entry.ListBox1 do
  begin
    Items.Clear;
    Items.LoadFromFile(eTHANMSpec.Text);
    i := 0;
    while i < Count do
    begin
      if LeftStr(Items[i], 4) = 'Name' then
      begin
        Items[i] := Trim(Copy(Items[i], 6, Length(Items[i])));
        i := i + 1;
      end
      else
        Items.Delete(i);
    end;
    Entry.ShowModal;
    if Entry.ModalResult = mrOk then
      eTHANMEntry.Text := Entry.ListBox1.Items[Entry.ListBox1.ItemIndex];
  end;
end;

procedure TMain.bTHMSGDumpClick(Sender: TObject);
var
  sMsgDir: string;
begin
  if not CheckTHTK('thmsg') then
    exit;
  if not FileExists(eTHMSGArchive.Text) then
  begin
    MessageDlg(Format(ERR_FILE_DOES_NOT_EXIST, [eTHMSGArchive.Text]), mtError,
      [mbOK], 0);
    exit;
  end;
  sMsgDir := ExtractFileDir(eTHMSGFile.Text);
  if not DirectoryExists(sMsgDir) then
    if not CreateDir(sMsgDir) then
    begin
      MessageDlg(Format(ERR_UNABLE_TO_CREATE_FOLDER, [sMsgDir]), mtError,
        [mbOK], 0);
      exit;
    end;
  if FileExists(eTHMSGFile.Text) then
    if MessageDlg(Format(ERR_FILE_ALREADY_EXISTS, [eTHMSGFile.Text]),
      mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      exit;
  if cEndingDialogue.Checked then
    sEnding := '-e'
  else
    sEnding := '';
  CommExec('thmsg', '-d', GetGameNumber + sEnding, eTHMSGArchive.Text,
    ExtractFileDir(eTHMSGArchive.Text), AddQuotes(eTHMSGFile.Text));
end;

procedure TMain.bTHANMFileBrowseClick(Sender: TObject);
begin
  FileSelect(eTHANMFile, '*.png', MA_PNG_FILES);
end;

procedure TMain.bTHANMReplaceClick(Sender: TObject);
begin
  if not CheckTHTK('thanm') then
    exit;
  if not FileExists(eTHANMFile.Text) then
  begin
    MessageDlg(Format(ERR_FILE_DOES_NOT_EXIST, [eTHANMFile.Text]), mtError,
      [mbOK], 0);
    exit;
  end;
  if cIgnoreErrors.Checked then
    sIgnore := '-f'
  else
    sIgnore := '';
  CommExec('thanm', '-r', sIgnore, eTHANMArchive.Text, eTHANMFolder.Text,
    eTHANMEntry.Text, AddQuotes(eTHANMFile.Text));
end;

procedure TMain.bTHECLFileBrowseClick(Sender: TObject);
begin
  FileSelect(eTHECLFile, '*.txt', MA_TXT_FILES);
end;

procedure TMain.bTHANMFolderBrowseClick(Sender: TObject);
begin
  DirectorySelect(eTHANMFolder);
end;

procedure TMain.bTHANMArchiveBrowseClick(Sender: TObject);
begin
  FileSelect(eTHANMArchive, '*.anm', MA_ANM_FILES);
end;

procedure TMain.bTHANMCreateClick(Sender: TObject);
begin
  if not CheckTHTK('thanm') then
    exit;
  if not FileExists(eTHANMSpec.Text) then
  begin
    MessageDlg(Format(ERR_SPECFILE_NOT_FOUND, [eTHANMSpec.Text]), mtError,
      [mbOK], 0);
    exit;
  end;
  if not DirectoryExists(eTHANMFolder.Text) then
  begin
    MessageDlg(Format(ERR_FOLDER_DOES_NOT_EXIST, [eTHANMFolder.Text]), mtError,
      [mbOK], 0);
    exit;
  end;
  if FileExists(eTHANMArchive.Text) then
    if MessageDlg(Format(ERR_FILE_ALREADY_EXISTS, [eTHANMArchive.Text]),
      mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      exit;
  if cIgnoreErrors.Checked then
    sIgnore := 'f'
  else
    sIgnore := '';
  with TStringList.Create do
    try
      LoadFromFile(eTHANMSpec.Text);
      Delimiter := #13;
      CommExec('thanm', '-c', sIgnore, eTHANMArchive.Text, eTHANMFolder.Text,
        AddQuotes(eTHANMSpec.Text));
    finally
      Free;
    end;
end;

procedure TMain.bTHANMListClick(Sender: TObject);
var
  i: integer;
begin
  if not CheckTHTK('thanm') then
    exit;
  if not FileExists(eTHANMArchive.Text) then
  begin
    MessageDlg(Format(ERR_FILE_DOES_NOT_EXIST, [eTHANMArchive.Text]), mtError,
      [mbOK], 0);
    exit;
  end;
  if not DirectoryExists(ExtractFileDir(eTHANMSpec.Text)) then
    if not CreateDir(ExtractFileDir(eTHANMSpec.Text)) then
    begin
      MessageDlg(Format(ERR_UNABLE_TO_CREATE_FOLDER,
        [ExtractFileDir(eTHANMSpec.Text)]), mtError, [mbOK], 0);
      exit;
    end;
  if cIgnoreErrors.Checked then
    sIgnore := '-f'
  else
    sIgnore := '';
  CommExec('thanm', '-l', sIgnore, eTHANMArchive.Text, eTHANMFolder.Text, '>',
    AddQuotes(eTHANMSpec.Text));
end;

procedure TMain.bTHANMExtractClick(Sender: TObject);
begin
  if not CheckTHTK('thanm') then
    exit;
  if not FileExists(eTHANMArchive.Text) then
  begin
    MessageDlg(Format(ERR_FILE_DOES_NOT_EXIST, [eTHANMArchive.Text]), mtError,
      [mbOK], 0);
    exit;
  end;
  if not DirectoryExists(eTHANMFolder.Text) then
    if not CreateDir(eTHANMFolder.Text) then
    begin
      MessageDlg(Format(ERR_UNABLE_TO_CREATE_FOLDER, [eTHANMFolder.Text]),
        mtError, [mbOK], 0);
      exit;
    end;
  if cIgnoreErrors.Checked then
    sIgnore := '-f'
  else
    sIgnore := '';
  bTHANMList.Click;
  CommExec('thanm', '-x', sIgnore, eTHANMArchive.Text, eTHANMFolder.Text);
end;

procedure TMain.bTHECLArchiveBrowseClick(Sender: TObject);
begin
  FileSelect(eTHECLArchive, '*.ecl', MA_ECL_FILES);
end;

procedure TMain.bTHECLCreateClick(Sender: TObject);
begin
  if not CheckTHTK('thecl') then
    exit;
  if not FileExists(eTHECLFile.Text) then
  begin
    MessageDlg(Format(ERR_FILE_DOES_NOT_EXIST, [eTHECLFile.Text]), mtError,
      [mbOK], 0);
    exit;
  end;
  if FileExists(eTHECLArchive.Text) then
    if MessageDlg(Format(ERR_FILE_ALREADY_EXISTS, [eTHECLArchive.Text]),
      mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      exit;
  CommExec('thecl', '-c', GetGameNumber, '', eTHDATFolder.Text,
    AddQuotes(eTHECLFile.Text), AddQuotes(eTHECLArchive.Text));

end;

procedure TMain.bTHECLDumpClick(Sender: TObject);
var
  sEclDir: string;
begin
  if not CheckTHTK('thecl') then
    exit;
  if not FileExists(eTHECLArchive.Text) then
  begin
    MessageDlg(Format(ERR_FILE_DOES_NOT_EXIST, [eTHECLArchive.Text]), mtError,
      [mbOK], 0);
    exit;
  end;
  sEclDir := ExtractFileDir(eTHECLFile.Text);
  if not DirectoryExists(sEclDir) then
    if not CreateDir(sEclDir) then
    begin
      MessageDlg(Format(ERR_UNABLE_TO_CREATE_FOLDER, [sEclDir]), mtError,
        [mbOK], 0);
      exit;
    end;
  if FileExists(eTHECLFile.Text) then
    if MessageDlg(Format(ERR_FILE_ALREADY_EXISTS, [eTHECLFile.Text]),
      mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      exit;
  CommExec('thecl', '-d', GetGameNumber, eTHECLArchive.Text,
    ExtractFileDir(eTHECLArchive.Text), AddQuotes(eTHECLFile.Text));
end;

procedure TMain.bTHANMSpecBrowseClick(Sender: TObject);
begin
  FileSelect(eTHANMSpec, '*.txt', MA_TXT_FILES);
end;

procedure TMain.bTHDATFolderBrowseClick(Sender: TObject);
begin
  DirectorySelect(eTHDATFolder);
end;

procedure TMain.bTHDATArchiveBrowseClick(Sender: TObject);
begin
  FileSelect(eTHDATArchive, '*.dat', MA_DAT_FILES, true);
end;

procedure TMain.bTHDATCreateClick(Sender: TObject);
var
  i: integer;
begin
  if not CheckTHTK('thdat') then
    exit;
  if not FileExists(sListFilename) then
  begin
    MessageDlg(Format(ERR_LISTFILE_NOT_FOUND, [sListFilename]), mtError,
      [mbOK], 0);
    exit;
  end;
  if not DirectoryExists(eTHDATFolder.Text) then
  begin
    MessageDlg(Format(ERR_FOLDER_DOES_NOT_EXIST, [eTHDATFolder.Text]), mtError,
      [mbOK], 0);
    exit;
  end;
  if not CheckGame(eTHDATArchive.Text) then
    if MessageDlg(ERR_DAT_FILE_WRONG, mtWarning, [mbYes, mbNo], 0) = mrNo then
      exit;
  if FileExists(eTHDATArchive.Text) then
    if miSettingsBackup.Checked then
      if not MakeBackup(eTHDATArchive.Text) then
        if MessageDlg(Format(ERR_UNABLE_TO_CREATE_BACKUP, [eTHDATArchive.Text]),
          mtWarning, [mbYes, mbNo], 0) = mrNo then
          exit
        else
          null
      else
        null
    else if MessageDlg(Format(ERR_FILE_ALREADY_EXISTS, [eTHDATArchive.Text]),
      mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      exit;
  with TStringList.Create do
    try
      LoadFromFile(sListFilename);
      if LeftStr(Strings[0], 4) = 'Name' then
      begin
        Delete(0);
        for i := 0 to Count - 1 do
        begin
          Strings[i] := Trim(Strings[i]);
          Strings[i] := LeftStr(Strings[i], Pos(' ', Strings[i]) - 1);
        end;
      end;
      Delimiter := ' ';
      CommExec('thdat', '-c', GetGameNumber, eTHDATArchive.Text,
        eTHDATFolder.Text, DelimitedText);
    finally
      Free;
    end;
end;

procedure TMain.bTHDATListClick(Sender: TObject);
begin
  if not CheckTHTK('thdat') then
    exit;
  if not FileExists(eTHDATArchive.Text) then
  begin
    MessageDlg(Format(ERR_FILE_DOES_NOT_EXIST, [eTHDATArchive.Text]), mtError,
      [mbOK], 0);
    exit;
  end;
  if not CheckGame(eTHDATArchive.Text) then
    if MessageDlg(ERR_DAT_FILE_WRONG, mtWarning, [mbYes, mbNo], 0) = mrNo then
      exit;
  CommExec('thdat', '-l', GetGameNumber, eTHDATArchive.Text,
    ExtractFileDrive(sAppDir), '>', AddQuotes(sListFilename));
end;

procedure TMain.bTHDATExtractClick(Sender: TObject);
begin
  if not CheckTHTK('thdat') then
    exit;
  if not FileExists(eTHDATArchive.Text) then
  begin
    MessageDlg(Format(ERR_FILE_DOES_NOT_EXIST, [eTHDATArchive.Text]), mtError,
      [mbOK], 0);
    exit;
  end;
  if not CheckGame(eTHDATArchive.Text) then
    if MessageDlg(ERR_DAT_FILE_WRONG, mtWarning, [mbYes, mbNo], 0) = mrNo then
      exit;
  if not DirectoryExists(eTHDATFolder.Text) then
    if not CreateDir(eTHDATFolder.Text) then
    begin
      MessageDlg(Format(ERR_UNABLE_TO_CREATE_FOLDER, [eTHDATFolder.Text]),
        mtError, [mbOK], 0);
      exit;
    end;
  CommExec('thdat', '-x', GetGameNumber, eTHDATArchive.Text, eTHDATFolder.Text,
    '>', AddQuotes(sListFilename));
end;

procedure TMain.bTHMSGFileBrowseClick(Sender: TObject);
begin
  FileSelect(eTHMSGFile, '*.txt', MA_TXT_FILES);
end;

procedure TMain.bTHMSGArchiveBrowseClick(Sender: TObject);
begin
  FileSelect(eTHMSGArchive, '*msg*', MA_MSG_FILES);
end;

procedure TMain.eTHANMArchiveChange(Sender: TObject);
begin
  eTHANMFolder.Text := ExtractFilePath(eTHANMArchive.Text) +
    ANM_DEFAULT_SUBFOLDER;
  eTHANMSpec.Text := eTHANMFolder.Text + '\description_' +
    ExtractFileNameOnly(eTHANMArchive.Text) + '.txt';
end;

procedure TMain.eTHANMEntryKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Timer1.Tag := 0;
  Timer1.Enabled := true;
end;

procedure TMain.eTHANMFolderChange(Sender: TObject);
begin
  eTHANMSpec.Text := eTHANMFolder.Text + '\description.txt';
end;

procedure TMain.eTHDATFolderChange(Sender: TObject);
begin
  eTHANMFolder.Text := eTHDATFolder.Text;
  eTHECLFile.Text := eTHDATFolder.Text;
  eTHMSGFile.Text := eTHDATFolder.Text;
end;

procedure TMain.eTHECLArchiveChange(Sender: TObject);
begin
  eTHECLFile.Text := ExtractFilePath(eTHECLArchive.Text) + ECL_DEFAULT_SUBFOLDER
    + '\' + ExtractFileNameOnly(eTHECLArchive.Text, 'ecl') + '.txt';
end;

procedure TMain.eTHMSGArchiveChange(Sender: TObject);
begin
  eTHMSGFile.Text := ExtractFilePath(eTHMSGArchive.Text) + MSG_DEFAULT_SUBFOLDER
    + '\' + ExtractFileNameOnly(eTHMSGArchive.Text) + '.txt';
  cEndingDialogue.Checked := (LeftStr(ExtractFileName(eTHMSGArchive.Text), 1)
    = 'e') or (ExtractFileName(eTHMSGArchive.Text) = 'staff.msg');
end;

procedure TMain.FormActivate(Sender: TObject);
var
  i: integer;
begin
  if Main.Tag = 0 then
  begin
    Main.Tag := 1;
    for i := 0 to slLocal.Count - 1 do
      if Main.miSettingsLocal[i].Checked then
        ApplyLocalization(Main.miSettingsLocal[i].Caption);
    if sTHTKPath = '' then
      miSettingsPath.Click;
  end;
end;

procedure TMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveGameSettings(pCurrentGame.Caption);
end;

procedure TMain.FormCreate(Sender: TObject);
var
  i, k: integer;
  sBuff: string;
begin
  sAppDir := GetCurrentDir;
  slGames := TStringList.Create;
  slLocal := TStringList.Create;
  with TMemIniFile.Create(sAppDir + '\' + LANG_FILE_NAME, TEncoding.UTF8) do
    try
      ReadSections(slLocal);
      for i := 0 to slLocal.Count - 1 do
      begin
        miSettingsLocal.Add(TMenuItem.Create(Self));
        with miSettingsLocal[i] do
        begin
          Caption := slLocal[i];
          RadioItem := true;
          GroupIndex := 2;
          OnClick := miSettingsLocalClick;
        end;
      end;
    finally
      Free;
    end;
  with TMemIniFile.Create(sAppDir + '\' + INI_FILE_NAME, TEncoding.UTF8) do
    try
      ReadSectionValues('GAMES', slGames);
      sTHTKPath := ReadString('OPTIONS', 'THTK_MAIN_PATH', '');
      sGamesPath := ReadString('OPTIONS', 'TOUHOU_GAMES_PATH', '');
      Main.Height := ReadInteger('OPTIONS', 'WIN_HEIGHT',
        Main.Constraints.MinHeight);
      Main.Width := ReadInteger('OPTIONS', 'WIN_WIDTH', 730);
      Main.miSettingsShowDosOnError.Checked :=
        ReadBool('OPTIONS', 'SHOW_ERRORS', false);
      Main.miSettingsBackup.Checked :=
        ReadBool('OPTIONS', 'MI_AUTO_BACKUP', true);
      k := ReadInteger('OPTIONS', 'GAME_INDEX', 0);
      sBuff := ReadString('OPTIONS', 'LANGUAGE', '');
      for i := 0 to slGames.Count - 1 do
      begin
        miGame.Add(TMenuItem.Create(Self));
        with miGame[i] do
        begin
          Caption := slGames.Names[i];
          GroupIndex := 1;
          RadioItem := true;
          Checked := i = k;
          OnClick := miGameClick;
          Tag := i;
          if Checked then
            miGameClick(miGame[i]);
        end;
      end;
    finally
      Free;
    end;
  if sBuff <> '' then
    miSettingsLocal.Find(sBuff).Checked := true;
  if not DirectoryExists(sAppDir + '\lists') then
    CreateDir(sAppDir + '\lists');

end;

procedure TMain.miSettingsPathClick(Sender: TObject);
begin
  PathTHTK.ShowModal;
  if PathTHTK.ModalResult = mrOk then
  begin
    sTHTKPath := PathTHTK.eTHTKPath.Text;
    sGamesPath := PathTHTK.eGamesPath.Text;
  end;
end;

procedure TMain.miSettingsShowDosOnErrorClick(Sender: TObject);
begin
  miSettingsShowDosOnError.Checked := not miSettingsShowDosOnError.Checked;
end;

procedure TMain.miSettingsBackupClick(Sender: TObject);
begin
  miSettingsBackup.Checked := not miSettingsBackup.Checked;
end;

procedure TMain.miSettingsClearFieldsClick(Sender: TObject);
begin
  eTHDATFolder.Clear;
  eTHDATArchive.Clear;
  eTHANMArchive.Clear;
  eTHANMSpec.Clear;
  eTHANMEntry.Clear;
  eTHANMFile.Clear;
  eTHECLFile.Clear;
  eTHECLArchive.Clear;
  eTHMSGFile.Clear;
  eTHMSGArchive.Clear;
  cIgnoreErrors.Checked := false;
  cEndingDialogue.Checked := false;
end;

procedure TMain.miHelpAboutClick(Sender: TObject);
begin
  MessageBox(Application.Handle, PChar(ABOUT_INFO), PChar(Main.Caption), 0);
end;

procedure TMain.miHelpHelpClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, PChar('open'), PChar(sHelpFile), PChar(''),
    PChar(''), SW_SHOWNORMAL);
end;

procedure TMain.Timer1Timer(Sender: TObject);
begin
  bTHANMEntryBrowse.Default := not bTHANMEntryBrowse.Default;
  Timer1.Tag := Timer1.Tag + 1;
  if Timer1.Tag = 10 then
  begin
    Timer1.Enabled := false;
    if bTHANMEntryBrowse.Default then
      bTHANMEntryBrowse.Default := false;
  end;
end;

procedure TMain.miSettingsLocalClick(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := true;
  ApplyLocalization((Sender as TMenuItem).Caption);
end;

procedure TMain.miGameClick(Sender: TObject);
begin
  if pCurrentGame.Caption <> (Sender as TMenuItem).Caption then
  begin
    eTHANMArchive.Text := '';
    eTHECLArchive.Text := '';
    eTHMSGArchive.Text := '';
  end;
  (Sender as TMenuItem).Checked := true;
  if MainMenu1.Tag >= 0 then
    SaveGameSettings(pCurrentGame.Caption);
  pCurrentGame.Caption := (Sender as TMenuItem).Caption;
  MainMenu1.Tag := (Sender as TMenuItem).Tag;
  if StrToIntDef(GetGameNumber, -1) = -1 then
    MessageDlg(ERR_GAME_NUMBER_UNREADABLE, mtError, [mbOK], 0);
  sDefDir := sAppDir + '\' + GetGameNumber;
  LoadGameSettings(pCurrentGame.Caption);
  sListFilename := sAppDir + '\lists\list_' + pCurrentGame.Caption + '.txt';
end;

end.
