object PathTHTK: TPathTHTK
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Paths'
  ClientHeight = 142
  ClientWidth = 466
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  DesignSize = (
    466
    142)
  PixelsPerInch = 96
  TextHeight = 13
  object bOK: TButton
    Left = 304
    Top = 109
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object eTHTKPath: TLabeledEdit
    Left = 8
    Top = 24
    Width = 419
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 108
    EditLabel.Height = 13
    EditLabel.Caption = 'Path to Touhou Toolkit'
    TabOrder = 1
  end
  object bTHTKPathBrowse: TButton
    Left = 433
    Top = 24
    Width = 25
    Height = 21
    Anchors = [akTop, akRight]
    Caption = '...'
    TabOrder = 2
    OnClick = bTHTKPathBrowseClick
  end
  object bCancel: TButton
    Left = 385
    Top = 109
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object eGamesPath: TLabeledEdit
    Left = 8
    Top = 64
    Width = 419
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 95
    EditLabel.Height = 13
    EditLabel.Caption = 'Path to game folder'
    TabOrder = 4
  end
  object bGamesPathBrowse: TButton
    Left = 433
    Top = 64
    Width = 25
    Height = 21
    Anchors = [akTop, akRight]
    Caption = '...'
    TabOrder = 5
    OnClick = bGamesPathBrowseClick
  end
end
