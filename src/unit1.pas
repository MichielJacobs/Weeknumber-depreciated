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
    Timer1: TTimer;
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
  Appvisible: Boolean = true;

implementation

{$R *.lfm}

{ TTFWeeknumber }

procedure TTFWeeknumber.TTIWeeknumberClick(Sender: TObject);
begin
  if Appvisible then
  begin
        TFWeeknumber.hide;       // Hide the weeknumer app after click on systrayicon
        Appvisible:= false;
  end
  else
  begin
        TFWeeknumber.show;       // Show the weeknumer app after click on systrayicon
        Appvisible := true;
  end;
end;

procedure TTFWeeknumber.btnStartAppClick(Sender: TObject);
begin
  TTIWeeknumber.Show;    // show the system tray icon
  TFWeeknumber.Hide;     // hide main app window
  Appvisible := false;
end;

procedure TTFWeeknumber.FormCreate(Sender: TObject);
begin
    TTIWeeknumber.Icon.LoadFromFile('ico/' + IntToStr(WeekOfTheYear(Now)) +'.ico');      //Set the correct icon file
    TTIWeeknumber.Hint := 'Current weeknumber: ' + IntToStr(WeekOfTheYear(Now)) + LineEnding + 'Current Time: ' + FormatDateTime('DDDD, dd MMMM YYYY HH:MM', Now);         //Set help text to sysicon

    LblWeekNumber.Caption := IntToStr((WeekOfTheYear(Now))); //Set the weeknumber in the main application window

    TTIWeeknumber.Show;    // show the system tray icon
end;


end.

