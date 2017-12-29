unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls,DateUtils;

type

  { TTFWeeknumber }

  TTFWeeknumber = class(TForm)
    btnStartApp: TButton;
    lblWeekNumber: TLabel;
    LblStandardInfo: TLabel;
    TTIWeeknumber: TTrayIcon;
    procedure btnStartAppClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TTIWeeknumberClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  TFWeeknumber: TTFWeeknumber;

implementation

{$R *.lfm}

{ TTFWeeknumber }

procedure TTFWeeknumber.TTIWeeknumberClick(Sender: TObject);
begin
  TFWeeknumber.Show;      // Show the weeknumer app after click on systrayicon
end;

procedure TTFWeeknumber.btnStartAppClick(Sender: TObject);
begin

  TTIWeeknumber.Icon.LoadFromFile('ico/' + IntToStr(WeekOfTheYear(Now)) +'.ico');      //Set the correct icon file
  TTIWeeknumber.Hint := 'Current weeknumber: ' + IntToStr(WeekOfTheYear(Now));


  TTIWeeknumber.Show;    // show the system tray icon
  TFWeeknumber.Hide;     // hide main app window
end;

procedure TTFWeeknumber.FormCreate(Sender: TObject);
begin
     LblWeekNumber.Caption := IntToStr((WeekOfTheYear(Now))); //Set the weeknumber in the main application window
end;


end.

