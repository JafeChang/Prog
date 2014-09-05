unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TooBigEvent(Sender: TObject);

  private
    { private declarations }
    FTooBig:TNotifyEvent;
  public
    { public declarations }
  published
    property OnTooBig:TNotifyevent read FTooBig write FTooBig;
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
   if assigned(FTooBig) then OnTooBig(Self);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 FTooBig := @TooBigEvent;
end;

procedure TForm1.TooBigEvent(Sender: TObject);
begin
  Application.MessageBox('Too Big','Test Event!',MrOK);
end;

end.

