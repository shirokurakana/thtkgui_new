object Main: TMain
  Left = 309
  Top = 279
  Caption = 'Touhou Toolkit GUI v1.2'
  ClientHeight = 576
  ClientWidth = 715
  Color = clBtnFace
  Constraints.MinHeight = 634
  Constraints.MinWidth = 539
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox3: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 136
    Width = 709
    Height = 216
    Align = alTop
    Caption = 'THANM'
    TabOrder = 0
    DesignSize = (
      709
      216)
    object eTHANMFolder: TLabeledEdit
      Left = 48
      Top = 16
      Width = 617
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      EditLabel.Width = 30
      EditLabel.Height = 13
      EditLabel.Caption = 'Folder'
      LabelPosition = lpLeft
      TabOrder = 0
      OnChange = eTHANMFolderChange
    end
    object eTHANMArchive: TLabeledEdit
      Left = 48
      Top = 43
      Width = 617
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      EditLabel.Width = 36
      EditLabel.Height = 13
      EditLabel.Caption = 'Archive'
      LabelPosition = lpLeft
      TabOrder = 2
      OnChange = eTHANMArchiveChange
    end
    object bTHANMFolderBrowse: TButton
      Left = 671
      Top = 16
      Width = 25
      Height = 21
      Anchors = [akTop, akRight]
      Caption = '...'
      TabOrder = 1
      OnClick = bTHANMFolderBrowseClick
    end
    object bTHANMArchiveBrowse: TButton
      Left = 671
      Top = 43
      Width = 25
      Height = 21
      Anchors = [akTop, akRight]
      Caption = '...'
      TabOrder = 3
      OnClick = bTHANMArchiveBrowseClick
    end
    object bTHANMCreate: TButton
      Left = 48
      Top = 96
      Width = 153
      Height = 25
      Caption = 'Create archive'
      TabOrder = 6
      OnClick = bTHANMCreateClick
    end
    object bTHANMList: TButton
      Left = 207
      Top = 96
      Width = 153
      Height = 25
      Caption = 'Get description'
      TabOrder = 7
      OnClick = bTHANMListClick
    end
    object bTHANMExtract: TButton
      Left = 366
      Top = 96
      Width = 138
      Height = 25
      Caption = 'Extract archive'
      TabOrder = 8
      OnClick = bTHANMExtractClick
    end
    object eTHANMEntry: TLabeledEdit
      Left = 48
      Top = 127
      Width = 617
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      EditLabel.Width = 26
      EditLabel.Height = 13
      EditLabel.Caption = 'Entry'
      LabelPosition = lpLeft
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 9
      OnKeyUp = eTHANMEntryKeyUp
    end
    object bTHANMEntryBrowse: TButton
      Left = 671
      Top = 127
      Width = 25
      Height = 21
      Anchors = [akTop, akRight]
      Caption = '...'
      TabOrder = 10
      OnClick = bTHANMEntryBrowseClick
    end
    object eTHANMFile: TLabeledEdit
      Left = 48
      Top = 154
      Width = 617
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      EditLabel.Width = 16
      EditLabel.Height = 13
      EditLabel.Caption = 'File'
      LabelPosition = lpLeft
      TabOrder = 11
    end
    object bTHANMFileBrowse: TButton
      Left = 671
      Top = 154
      Width = 25
      Height = 21
      Anchors = [akTop, akRight]
      Caption = '...'
      TabOrder = 12
      OnClick = bTHANMFileBrowseClick
    end
    object bTHANMReplace: TButton
      Left = 48
      Top = 181
      Width = 153
      Height = 25
      Caption = 'Replace entry'
      TabOrder = 13
      OnClick = bTHANMReplaceClick
    end
    object cIgnoreErrors: TCheckBox
      Left = 554
      Top = 185
      Width = 139
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Ignore errors'
      TabOrder = 14
    end
    object eTHANMSpec: TLabeledEdit
      Left = 88
      Top = 69
      Width = 577
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      EditLabel.Width = 53
      EditLabel.Height = 13
      EditLabel.Caption = 'Description'
      LabelPosition = lpLeft
      TabOrder = 4
    end
    object bTHANMSpecBrowse: TButton
      Left = 671
      Top = 69
      Width = 25
      Height = 21
      Anchors = [akTop, akRight]
      Caption = '...'
      TabOrder = 5
      OnClick = bTHANMSpecBrowseClick
    end
  end
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 25
    Width = 709
    Height = 105
    Align = alTop
    Caption = 'THDAT'
    TabOrder = 1
    DesignSize = (
      709
      105)
    object eTHDATFolder: TLabeledEdit
      Left = 48
      Top = 16
      Width = 617
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      EditLabel.Width = 30
      EditLabel.Height = 13
      EditLabel.Caption = 'Folder'
      LabelPosition = lpLeft
      TabOrder = 0
      OnChange = eTHDATFolderChange
    end
    object eTHDATArchive: TLabeledEdit
      Left = 48
      Top = 43
      Width = 617
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      EditLabel.Width = 36
      EditLabel.Height = 13
      EditLabel.Caption = 'Archive'
      LabelPosition = lpLeft
      TabOrder = 2
    end
    object bTHDATFolderBrowse: TButton
      Left = 671
      Top = 16
      Width = 25
      Height = 21
      Anchors = [akTop, akRight]
      Caption = '...'
      TabOrder = 1
      OnClick = bTHDATFolderBrowseClick
    end
    object bTHDATArchiveBrowse: TButton
      Left = 671
      Top = 43
      Width = 25
      Height = 22
      Anchors = [akTop, akRight]
      Caption = '...'
      TabOrder = 3
      OnClick = bTHDATArchiveBrowseClick
    end
    object bTHDATCreate: TButton
      Left = 48
      Top = 70
      Width = 153
      Height = 25
      Caption = 'Create archive'
      TabOrder = 4
      OnClick = bTHDATCreateClick
    end
    object bTHDATList: TButton
      Left = 207
      Top = 70
      Width = 153
      Height = 25
      Caption = 'Get file list'
      TabOrder = 5
      OnClick = bTHDATListClick
    end
    object bTHDATExtract: TButton
      Left = 366
      Top = 70
      Width = 138
      Height = 25
      Caption = 'Extract archive'
      TabOrder = 6
      OnClick = bTHDATExtractClick
    end
  end
  object GroupBox2: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 469
    Width = 709
    Height = 103
    Align = alTop
    Caption = 'THMSG'
    TabOrder = 2
    DesignSize = (
      709
      103)
    object eTHMSGFile: TLabeledEdit
      Left = 48
      Top = 16
      Width = 617
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      EditLabel.Width = 16
      EditLabel.Height = 13
      EditLabel.Caption = 'File'
      LabelPosition = lpLeft
      TabOrder = 0
    end
    object eTHMSGArchive: TLabeledEdit
      Left = 48
      Top = 43
      Width = 617
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      EditLabel.Width = 36
      EditLabel.Height = 13
      EditLabel.Caption = 'Archive'
      LabelPosition = lpLeft
      TabOrder = 2
      OnChange = eTHMSGArchiveChange
    end
    object bTHMSGFileBrowse: TButton
      Left = 671
      Top = 16
      Width = 25
      Height = 21
      Anchors = [akTop, akRight]
      Caption = '...'
      TabOrder = 1
      OnClick = bTHMSGFileBrowseClick
    end
    object bTHMSGArchiveBrowse: TButton
      Left = 671
      Top = 43
      Width = 25
      Height = 21
      Anchors = [akTop, akRight]
      Caption = '...'
      TabOrder = 3
      OnClick = bTHMSGArchiveBrowseClick
    end
    object bTHMSGCreate: TButton
      Left = 48
      Top = 70
      Width = 153
      Height = 25
      Caption = 'Create archive'
      TabOrder = 4
      OnClick = bTHMSGCreateClick
    end
    object bTHMSGDump: TButton
      Left = 207
      Top = 70
      Width = 153
      Height = 25
      Caption = 'Extract archive'
      TabOrder = 5
      OnClick = bTHMSGDumpClick
    end
    object cEndingDialogue: TCheckBox
      Left = 554
      Top = 74
      Width = 142
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Ending dialogue'
      TabOrder = 6
    end
  end
  object GroupBox4: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 358
    Width = 709
    Height = 105
    Align = alTop
    Caption = 'THECL'
    TabOrder = 3
    DesignSize = (
      709
      105)
    object eTHECLFile: TLabeledEdit
      Left = 48
      Top = 16
      Width = 617
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      EditLabel.Width = 16
      EditLabel.Height = 13
      EditLabel.Caption = 'File'
      LabelPosition = lpLeft
      TabOrder = 0
    end
    object eTHECLArchive: TLabeledEdit
      Left = 48
      Top = 43
      Width = 617
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      EditLabel.Width = 36
      EditLabel.Height = 13
      EditLabel.Caption = 'Archive'
      LabelPosition = lpLeft
      TabOrder = 2
      OnChange = eTHECLArchiveChange
    end
    object bTHECLFileBrowse: TButton
      Left = 671
      Top = 16
      Width = 25
      Height = 21
      Anchors = [akTop, akRight]
      Caption = '...'
      TabOrder = 1
      OnClick = bTHECLFileBrowseClick
    end
    object bTHECLArchiveBrowse: TButton
      Left = 671
      Top = 43
      Width = 25
      Height = 21
      Anchors = [akTop, akRight]
      Caption = '...'
      TabOrder = 3
      OnClick = bTHECLArchiveBrowseClick
    end
    object bTHECLCreate: TButton
      Left = 48
      Top = 70
      Width = 153
      Height = 25
      Caption = 'Create archive'
      TabOrder = 4
      OnClick = bTHECLCreateClick
    end
    object bTHECLDump: TButton
      Left = 207
      Top = 70
      Width = 153
      Height = 25
      Caption = 'Extract archive'
      TabOrder = 5
      OnClick = bTHECLDumpClick
    end
  end
  object pCurrentGame: TPanel
    Left = 0
    Top = 0
    Width = 715
    Height = 22
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'EoSD'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 50
    OnTimer = Timer1Timer
    Left = 112
  end
  object MainMenu1: TMainMenu
    Tag = -1
    AutoHotkeys = maManual
    Left = 72
    object miGame: TMenuItem
      Caption = 'Game'
    end
    object miSettings: TMenuItem
      Caption = 'Settings'
      object miSettingsBackup: TMenuItem
        Caption = 'Make backup'
        Checked = True
        OnClick = miSettingsBackupClick
      end
      object miSettingsShowDosOnError: TMenuItem
        Caption = 'Do not close console on error'
        OnClick = miSettingsShowDosOnErrorClick
      end
      object N1: TMenuItem
        Caption = '-'
        GroupIndex = 2
      end
      object miSettingsLocal: TMenuItem
        Caption = 'Language'
        GroupIndex = 2
      end
      object miSettingsPath: TMenuItem
        Caption = 'Paths...'
        GroupIndex = 2
        OnClick = miSettingsPathClick
      end
      object N2: TMenuItem
        Caption = '-'
        GroupIndex = 2
      end
      object miSettingsClearFields: TMenuItem
        Caption = 'Clear all fields'
        GroupIndex = 2
        OnClick = miSettingsClearFieldsClick
      end
    end
    object miHelp: TMenuItem
      Caption = 'Help'
      object miHelpHelp: TMenuItem
        Caption = 'Help'
        ShortCut = 112
        OnClick = miHelpHelpClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object miHelpAbout: TMenuItem
        Caption = 'About...'
        OnClick = miHelpAboutClick
      end
    end
  end
end
