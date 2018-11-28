unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DateTimePicker, Forms, Controls, Graphics,
  Dialogs, ExtCtrls, StdCtrls, Calendar, Menus, DateUtils;

type

  { TTFWeeknumber }

  TTFWeeknumber = class(TForm)
    Calendar1: TCalendar;
    MenuItemAbout: TMenuItem;
    MenuItemExit: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItemOpen: TMenuItem;
    PopupMenu1: TPopupMenu;
    Timer1: TTimer;
    TTIWeeknumber: TTrayIcon;
    procedure FormCreate(Sender: TObject);
    procedure MenuItemAboutClick(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItemExitClick(Sender: TObject);
    procedure MenuItemOpenClick(Sender: TObject);
    procedure TTIWeeknumberClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  TFWeeknumber: TTFWeeknumber;
  Appvisible: Boolean = false;

implementation

{$R *.lfm}

{ TTFWeeknumber }

procedure showApp();
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

procedure TTFWeeknumber.TTIWeeknumberClick(Sender: TObject);
begin
  showApp;
end;

procedure TTFWeeknumber.FormCreate(Sender: TObject);
begin
     Calendar1.datetime:= Now; // set calendar to the correct date on application start
     TTIWeeknumber.Icon.LoadFromFile('ico/' + IntToStr(WeekOfTheYear(Now)) +'.ico');      //Set the correct icon file
     TTIWeeknumber.Hint := 'Current weeknumber: ' + IntToStr(WeekOfTheYear(Now)) + LineEnding + 'Current Time: ' + FormatDateTime('DDDD, dd MMMM YYYY HH:MM', Now) + LineEnding + 'Appinfo: https://github.com/MichielJacobs/Weeknumber';         //Set help text to sysicon

     //LblWeekNumber.Caption := IntToStr((WeekOfTheYear(Now))); //Set the weeknumber in the main application window
     TFWeeknumber.Caption    := 'Current weeknumber: ' + IntToStr((WeekOfTheYear(Now))); //Set the weeknumber in the main application window
     TTIWeeknumber.Show;    // show the system tray icon
end;

procedure TTFWeeknumber.MenuItemAboutClick(Sender: TObject);
begin
   // Display about information
  ShowMessage('This application is made by Michiel Jacobs.' + sLineBreak + 'More information and updated versions can be found at:' + sLineBreak + 'https://github.com/MichielJacobs/Weeknumber' );
end;

procedure TTFWeeknumber.MenuItem2Click(Sender: TObject);
begin

end;

procedure TTFWeeknumber.MenuItemExitClick(Sender: TObject);
begin
    Close;   // stop the application
end;

procedure TTFWeeknumber.MenuItemOpenClick(Sender: TObject);
begin
     showapp;
end;


end.

