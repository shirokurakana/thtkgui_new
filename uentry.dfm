object Entry: TEntry
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Choose a file to replace'
  ClientHeight = 409
  ClientWidth = 242
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  DesignSize = (
    242
    409)
  PixelsPerInch = 96
  TextHeight = 13
  object ListBox1: TListBox
    Left = 0
    Top = 0
    Width = 242
    Height = 372
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 0
    OnDblClick = ListBox1DblClick
  end
  object bOK: TButton
    Left = 78
    Top = 378
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    TabOrder = 1
    OnClick = bOKClick
  end
  object bCancel: TButton
    Left = 159
    Top = 378
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = bCancelClick
  end
end
