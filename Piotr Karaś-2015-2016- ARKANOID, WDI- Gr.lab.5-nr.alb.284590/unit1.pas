unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Wyjscie: TButton;
    Level_3: TButton;
    Level_2: TButton;
    Shape25: TShape;
    Shape26: TShape;
    Shape27: TShape;
    Shape28: TShape;
    Shape29: TShape;
    Shape30: TShape;
    Shape31: TShape;
    Shape32: TShape;
    Shape33: TShape;
    Shape34: TShape;
    Shape35: TShape;
    Shape36: TShape;
    Shape37: TShape;
    Shape38: TShape;
    Shape39: TShape;
    Shape40: TShape;
    Shape41: TShape;
    Shape42: TShape;
    Shape43: TShape;
    Shape44: TShape;
    Shape45: TShape;
    Shape46: TShape;
    Shape47: TShape;
    Shape48: TShape;
    Shape49: TShape;
    Shape50: TShape;
    Shape51: TShape;
    Shape52: TShape;
    Shape53: TShape;
    Shape54: TShape;
    Shape55: TShape;
    Shape56: TShape;
    Zwolnienie_paletki: TImage;
    Przysp_paletki: TImage;
    Zmiana_kieronkow: TImage;
    Zwolnienie: TImage;
    Przyspieszenie: TImage;
    Zmniejszenie: TImage;
    Rozszerzenie: TImage;
    Rakieta1: TImage;
    Liczba_zyc_dodana: TImage;
    Nowa_gra: TButton;
    Liczba_zyc: TLabel;
    Paletka: TShape;
    Pilka: TShape;
    Przegrana: TStaticText;
    Rakieta2: TImage;
    Rakieta3: TImage;
    Shape1: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    Shape13: TShape;
    Shape14: TShape;
    Shape15: TShape;
    Shape16: TShape;
    Shape17: TShape;
    Shape18: TShape;
    Shape19: TShape;
    Shape2: TShape;
    Shape20: TShape;
    Shape21: TShape;
    Shape22: TShape;
    Shape23: TShape;
    Shape24: TShape;
    Shape9: TShape;
    Shape8: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape7: TShape;
    Wygrana: TStaticText;
    Timer1: TTimer;
    Timer2: TTimer;
    Lewo: TTimer;
    Prawo: TTimer;
    Tlo: TImage;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Level_2Click(Sender: TObject);
    procedure Level_3Click(Sender: TObject);
    procedure LewoTimer(Sender: TObject);
    procedure Nowa_graClick(Sender: TObject);
    procedure PrawoTimer(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure WyjscieClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
   pr_pozioma,pr_pionowa,pr_ogolna,level,pr_poziom1,pr_poziom2,pr_poziom3:integer;
   zmiana_kier:boolean;
implementation

{$R *.lfm}

{ TForm1 }








                                                                                   //przy uderzeniu w klocek
procedure zmien_klocek(var Klocek:TShape);
begin
      if Klocek.Tag=1 then Klocek.Visible:=false else Klocek.Tag:=Klocek.Tag-1;
      case Klocek.Tag of
      3: Klocek.Brush.Color:=clRed;
      2: begin Klocek.Brush.Color:=clYellow; Klocek.Pen.Color:=clOlive;   end;
      1: begin Klocek.Brush.Color:=clLime;   Klocek.Pen.Color:=clGreen;   end;

      end;

end;

                                                                                        //czy zaszla kolizja z konkretnym klockiem
procedure kolizja_z_jednym(var klocek:TShape; var Pilka:TShape);
begin
      if klocek.Visible=true then begin
      if (Pilka.Top<=klocek.Top+klocek.Height) and  (Pilka.Top+Pilka.Height>=klocek.Top) and
      (Pilka.Left+Pilka.Width>=klocek.Left) and (Pilka.Left<=klocek.Left+klocek.Width) then
      begin

           if ((Pilka.Left+Pilka.Width*4/5<=klocek.Left) or (Pilka.Left+Pilka.Width/5>=klocek.Left+klocek.Width))
              and (Pilka.Top+Pilka.Height/2>=klocek.Top) and (Pilka.Top+Pilka.Height/2<=klocek.Top+klocek.Height) then
                  begin if (Pilka.Top+Pilka.Height/2>klocek.Top) or (Pilka.Top+Pilka.Height/2<klocek.Top+klocek.Height)
                        then begin
                             if Pilka.Left<klocek.Left then pr_pozioma:=-abs(pr_pozioma) else pr_pozioma:=abs(pr_pozioma);
                             if Pilka.Top<klocek.Top then pr_pionowa:=-abs(pr_pionowa) else pr_pionowa:=abs(pr_pionowa);
                        end

                  else pr_pozioma:=-pr_pozioma end
              else    pr_pionowa:=-pr_pionowa;

       zmien_klocek(klocek);

      end;
      end;

end;



procedure TForm1.Timer1Timer(Sender: TObject);
   procedure kolizja();
begin
      kolizja_z_jednym(Shape1,Pilka);
      kolizja_z_jednym(Shape2,Pilka);
      kolizja_z_jednym(Shape3,Pilka);
      kolizja_z_jednym(Shape4,Pilka);
      kolizja_z_jednym(Shape5,Pilka);
      kolizja_z_jednym(Shape6,Pilka);
      kolizja_z_jednym(Shape7,Pilka);
      kolizja_z_jednym(Shape8,Pilka);
      kolizja_z_jednym(Shape9,Pilka);
      kolizja_z_jednym(Shape10,Pilka);
      kolizja_z_jednym(Shape11,Pilka);
      kolizja_z_jednym(Shape12,Pilka);
      kolizja_z_jednym(Shape13,Pilka);
      kolizja_z_jednym(Shape14,Pilka);
      kolizja_z_jednym(Shape15,Pilka);
      kolizja_z_jednym(Shape16,Pilka);
      kolizja_z_jednym(Shape17,Pilka);
      kolizja_z_jednym(Shape18,Pilka);
      kolizja_z_jednym(Shape19,Pilka);
      kolizja_z_jednym(Shape20,Pilka);
      kolizja_z_jednym(Shape21,Pilka);
      kolizja_z_jednym(Shape22,Pilka);
      kolizja_z_jednym(Shape23,Pilka);
      kolizja_z_jednym(Shape24,Pilka);
      kolizja_z_jednym(Shape25,Pilka);
      kolizja_z_jednym(Shape26,Pilka);
      kolizja_z_jednym(Shape27,Pilka);
      kolizja_z_jednym(Shape28,Pilka);
      kolizja_z_jednym(Shape29,Pilka);
      kolizja_z_jednym(Shape30,Pilka);
      kolizja_z_jednym(Shape31,Pilka);
      kolizja_z_jednym(Shape32,Pilka);
      kolizja_z_jednym(Shape33,Pilka);
      kolizja_z_jednym(Shape34,Pilka);
      kolizja_z_jednym(Shape35,Pilka);
      kolizja_z_jednym(Shape36,Pilka);
      kolizja_z_jednym(Shape37,Pilka);
      kolizja_z_jednym(Shape38,Pilka);
      kolizja_z_jednym(Shape39,Pilka);
      kolizja_z_jednym(Shape40,Pilka);
      kolizja_z_jednym(Shape41,Pilka);
      kolizja_z_jednym(Shape42,Pilka);
      kolizja_z_jednym(Shape43,Pilka);
      kolizja_z_jednym(Shape44,Pilka);
      kolizja_z_jednym(Shape45,Pilka);
      kolizja_z_jednym(Shape46,Pilka);
      kolizja_z_jednym(Shape47,Pilka);
      kolizja_z_jednym(Shape48,Pilka);
      kolizja_z_jednym(Shape49,Pilka);
      kolizja_z_jednym(Shape50,Pilka);
      kolizja_z_jednym(Shape51,Pilka);
      kolizja_z_jednym(Shape52,Pilka);
      kolizja_z_jednym(Shape53,Pilka);
      kolizja_z_jednym(Shape54,Pilka);
      kolizja_z_jednym(Shape55,Pilka);
      kolizja_z_jednym(Shape56,Pilka);

end;
procedure zginales;
begin
       Liczba_zyc.Caption:=inttostr(strtoint(Liczba_zyc.Caption)-1);                  //jak sie skujesz!!!

         Timer1.Enabled:=false;
         Paletka.Width:=160;
         zmiana_kier:=false;
         Lewo.Interval:=20;
         Prawo.Interval:=20;
         case level of                    //predkosc pileczki jest coraz większa w późniejszym etapie gry
         1: pr_ogolna:=pr_poziom1;
         2: pr_ogolna:=pr_poziom2;
         3: pr_ogolna:=pr_poziom3;

         end;



end;
var a:integer;                         //odbicie od paletki pod różnymi kątami
begin
      if (Pilka.Left<=0) or (Pilka.Left>=1024-Pilka.Width) then pr_pozioma:=-pr_pozioma else
         begin if Pilka.Top<=0 then pr_pionowa:=-pr_pionowa else kolizja() end;

      if(Pilka.Left+Pilka.Width>=Paletka.Left)and(Pilka.Left<=Paletka.Left+Paletka.Width)and (Pilka.Top+Pilka.Height>=Paletka.Top-3)and (Pilka.Top+Pilka.Height<=Paletka.Top+15) then begin
      a:= Trunc((((Pilka.Left+Pilka.Width/2)-Paletka.Left) / Paletka.Width)*11);
      case  a  of

      -2,-1,0: pr_pozioma:=-5;
      1: pr_pozioma:=-4;
      2: pr_pozioma:=-3;
      3: pr_pozioma:=-2;
      4: pr_pozioma:=-1;
      5: pr_pozioma:=0;
      6: pr_pozioma:=1;
      7: pr_pozioma:=2;
      8: pr_pozioma:=3;
      9: pr_pozioma:=4;
      10: pr_pozioma:=5;
      11,12,13:pr_pozioma:=5;
      end;

      pr_pionowa:=Trunc(sqrt(pr_ogolna*pr_ogolna-pr_pozioma*pr_pozioma));
      pr_pionowa:=-pr_pionowa;
      end;

      Pilka.Left:=Pilka.Left+pr_pozioma;
      Pilka.Top:=Pilka.Top+pr_pionowa;

      if Pilka.Top>Form1.Height then zginales;




       randomize;
       case random(7000) of        //losowanie bonusów itp.
       1:  if Liczba_zyc_dodana.Visible=false then begin Liczba_zyc_dodana.Visible:=true; Liczba_zyc_dodana.Left:=random(Tlo.Width-Liczba_zyc_dodana.Width); Liczba_zyc_dodana.Top:=0; end;
       100..130: if Rakieta1.Visible=false then begin Rakieta1.Visible:=true; Rakieta1.Top:=0; Rakieta1.Left:=random(Tlo.Width-Rakieta1.Width) end
              else begin if Rakieta2.Visible=false then begin Rakieta2.Visible:=true; Rakieta2.Top:=0; Rakieta2.Left:=random(Tlo.Width-Rakieta2.Width)
              end else if Rakieta3.Visible=false then begin Rakieta3.Visible:=true; Rakieta3.Top:=0; Rakieta3.Left:=random(Tlo.Width-Rakieta3.Width)   end; end;
       21,22: if Rozszerzenie.Visible=false then begin Rozszerzenie.Visible:=true; Rozszerzenie.Top:=0; Rozszerzenie.Left:=random(Tlo.Width-Rozszerzenie.Width) end;
       23,24: if Zmniejszenie.Visible=false then begin Zmniejszenie.Visible:=true; Zmniejszenie.Top:=0; Zmniejszenie.Left:=random(Tlo.Width-Zmniejszenie.Width) end;
       25,26: if Przyspieszenie.Visible=false then begin Przyspieszenie.Visible:=true;  Przyspieszenie.Top:=0; Przyspieszenie.Left:=random(Tlo.Width-Przyspieszenie.Width); end;
       27,28: if Zwolnienie.Visible=false then begin Zwolnienie.Visible:=true;  Zwolnienie.Top:=0; Zwolnienie.Left:=random(Tlo.Width-Zwolnienie.Width); end;
       29,30: if Zmiana_kieronkow.Visible=false then begin Zmiana_kieronkow.Visible:=true;  Zmiana_kieronkow.Top:=0; Zmiana_kieronkow.Left:=random(Tlo.Width-Zmiana_kieronkow.Width); end;
       31,32: if Przysp_paletki.Visible=false then begin Przysp_paletki.Visible:=true;  Przysp_paletki.Top:=0; Przysp_paletki.Left:=random(Tlo.Width-Przysp_paletki.Width); end;
       33,34:  if Zwolnienie_paletki.Visible=false then begin Zwolnienie_paletki.Visible:=true;  Zwolnienie_paletki.Top:=0; Zwolnienie_paletki.Left:=random(Tlo.Width-Zwolnienie_paletki.Width); end;
       end;

    if Liczba_zyc_dodana.Visible=true then begin
     Liczba_zyc_dodana.Top:=Liczba_zyc_dodana.Top+6;
     if Liczba_zyc_dodana.Top+Liczba_zyc_dodana.Height>Paletka.Top then begin
     if Liczba_zyc_dodana.Top>Tlo.Height then Liczba_zyc_dodana.Visible:=false else
         begin  if ((Liczba_zyc_dodana.Top+Liczba_zyc_dodana.Height)>Paletka.Top) and(Liczba_zyc_dodana.Top<Paletka.Top+Paletka.Height)
                   and (Liczba_zyc_dodana.Left<Paletka.Left+Paletka.Width) and(Liczba_zyc_dodana.Left+Liczba_zyc_dodana.Width>Paletka.Left)
                   then begin Liczba_zyc.Caption:=inttostr(strtoint(Liczba_zyc.Caption)+1); Liczba_zyc_dodana.Visible:=false; end;
         end;
     end;
     end;

    if Rakieta1.Visible=true then
        with Rakieta1 do begin
        Top:=Top+6;
        if Top+Height>Paletka.Top then begin
           if Top>Tlo.Height then Visible:=false;
              if (Left+Width>Paletka.Left)and(Left<Paletka.Left+Paletka.Width) then
                  begin zginales; Visible:=false; end;
        end;
    end;

    if Rakieta2.Visible=true then
        with Rakieta2 do begin
        Top:=Top+6;
        if Top+Height>Paletka.Top then begin
           if Top>Tlo.Height then Visible:=false;
              if (Left+Width>Paletka.Left)and(Left<Paletka.Left+Paletka.Width) then
                  begin zginales; Visible:=false;  end;
        end;
    end;

    if Rakieta3.Visible=true then
        with Rakieta3 do begin
        Top:=Top+6;
        if Top+Height>Paletka.Top then begin
           if Top>Tlo.Height then Visible:=false;
              if (Left+Width>Paletka.Left)and(Left<Paletka.Left+Paletka.Width) then
                  begin zginales; Visible:=false;  end;
        end;
    end;

    if Rozszerzenie.Visible=true then
        with Rozszerzenie do begin
        Top:=Top+6;
        if Top+Height>Paletka.Top then begin
           if Top>Tlo.Height then Visible:=false;
              if (Left+Width>Paletka.Left)and(Left<Paletka.Left+Paletka.Width) then
                  begin Paletka.Width:=Paletka.Width*3 div 2; Visible:=false; end;
        end;
    end;

    if Zmniejszenie.Visible=true then
        with Zmniejszenie do begin
        Top:=Top+6;
        if Top+Height>Paletka.Top then begin
           if Top>Tlo.Height then Visible:=false;
              if (Left+Width>Paletka.Left)and(Left<Paletka.Left+Paletka.Width) then
                  begin Paletka.Width:=2*Paletka.Width div 3; Visible:=false; end;
        end;
    end;

    if Przyspieszenie.Visible=true then
        with Przyspieszenie do begin
        Top:=Top+6;
        if Top+Height>Paletka.Top then begin
           if Top>Tlo.Height then Visible:=false;
              if (Left+Width>Paletka.Left)and(Left<Paletka.Left+Paletka.Width) then
                  begin pr_ogolna:=pr_ogolna+2; Visible:=false; end;
        end;
    end;

    if Zwolnienie.Visible=true then
        with Zwolnienie do begin
        Top:=Top+6;
        if Top+Height>Paletka.Top then begin
           if Top>Tlo.Height then Visible:=false;
              if (Left+Width>Paletka.Left)and(Left<Paletka.Left+Paletka.Width) then
                  begin if pr_ogolna>7 then pr_ogolna:=pr_ogolna-2; Visible:=false; end;
        end;
    end;

    if Zmiana_kieronkow.Visible=true then
        with Zmiana_kieronkow do begin
        Top:=Top+6;
        if Top+Height>Paletka.Top then begin
           if Top>Tlo.Height then Visible:=false;
              if (Left+Width>Paletka.Left)and(Left<Paletka.Left+Paletka.Width) then
                  begin if zmiana_kier=false then begin zmiana_kier:=true; Visible:=false; end else zmiana_kier:=false; Visible:=false; end;
        end;
    end;

    if Przysp_paletki.Visible=true then
        with Przysp_paletki do begin
        Top:=Top+6;
        if Top+Height>Paletka.Top then begin
           if Top>Tlo.Height then Visible:=false;
              if (Left+Width>Paletka.Left)and(Left<Paletka.Left+Paletka.Width) then
                  begin  Lewo.Interval:=2*Lewo.Interval div 3; Prawo.Interval:=2*Prawo.Interval div 3; Visible:=false; end;
        end;
    end;

    if Zwolnienie_paletki.Visible=true then
        with Zwolnienie_paletki do begin
        Top:=Top+6;
        if Top+Height>Paletka.Top then begin
           if Top>Tlo.Height then Visible:=false;
              if (Left+Width>Paletka.Left)and(Left<Paletka.Left+Paletka.Width) then
                  begin  Lewo.Interval:=3*Lewo.Interval div 2; Prawo.Interval:=3*Prawo.Interval div 2; Visible:=false; end;
        end;
    end;

end;
procedure TForm1.Timer2Timer(Sender: TObject);
begin
  if Timer1.Enabled=false then
         begin Pilka.Left:=Paletka.Left+Paletka.Width div 2; Pilka.Top:=Paletka.Top-Paletka.Height-3; end ;

  if  strtoint(Liczba_zyc.Caption)<1 then  begin
          Przegrana.Visible:=true;
          Nowa_gra.Visible:=true;
          Timer1.Enabled:=false;
          Wyjscie.Visible:=true;

      end;

  if (Timer1.Enabled=true)and(Shape1.Visible=false)and(Shape2.Visible=false)and(Shape3.Visible=false)       //sprawdzenie czy już jest koniec gry                              //czy przeszedles poziom
     and (Shape4.Visible=false)and(Shape5.Visible=false)and(Shape6.Visible=false)
     and (Shape7.Visible=false)and(Shape8.Visible=false)and(Shape9.Visible=false)
     and (Shape10.Visible=false)and(Shape11.Visible=false)and(Shape12.Visible=false)
     and (Shape13.Visible=false)and(Shape14.Visible=false)and(Shape15.Visible=false)
     and (Shape16.Visible=false)and(Shape17.Visible=false)and(Shape18.Visible=false)
     and (Shape19.Visible=false)and(Shape20.Visible=false)and(Shape21.Visible=false)
     and (Shape22.Visible=false)and(Shape23.Visible=false)and(Shape24.Visible=false)
     and (Shape25.Visible=false)and(Shape26.Visible=false)and(Shape27.Visible=false)
     and (Shape28.Visible=false)and(Shape29.Visible=false)and(Shape30.Visible=false)
     and (Shape31.Visible=false)and(Shape32.Visible=false)and(Shape33.Visible=false)
     and (Shape34.Visible=false)and(Shape35.Visible=false)and(Shape36.Visible=false)
     and (Shape37.Visible=false)and(Shape38.Visible=false)and(Shape39.Visible=false)
     and (Shape40.Visible=false)and(Shape41.Visible=false)and(Shape42.Visible=false)
     and (Shape43.Visible=false)and(Shape44.Visible=false)and(Shape45.Visible=false)
     and (Shape46.Visible=false)and(Shape47.Visible=false)and(Shape48.Visible=false)
     and (Shape49.Visible=false)and(Shape50.Visible=false)and(Shape51.Visible=false)
     and (Shape52.Visible=false)and(Shape53.Visible=false)and(Shape54.Visible=false)
     and (Shape55.Visible=false)and(Shape56.Visible=false)
     then  begin level:=level+1; Timer1.Enabled:=false; if level=2 then begin Level_2.visible:=true; Wyjscie.Visible:=true; end
           else if level=3 then begin Level_3.Visible:=true; Wyjscie.Visible:=true; end else  begin Wygrana.Visible:=true; Nowa_gra.Visible:=true; end; Wyjscie.Visible:=true; end;
end;

procedure TForm1.WyjscieClick(Sender: TObject);
begin
 application.terminate;
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: char);
begin

     if  (char(Key)=' ')and(strtoint(Liczba_zyc.Caption)>0) then Timer1.Enabled:=true;
     if (char(Key)='o') then   begin                                                                          //kody - 'o' powoduje przejscie poziomu
           Shape1.Visible:=false;Shape2.Visible:=false;Shape3.Visible:=false;
           Shape4.Visible:=false;Shape5.Visible:=false;Shape6.Visible:=false;
           Shape7.Visible:=false;Shape8.Visible:=false;Shape9.Visible:=false;
           Shape10.Visible:=false;Shape11.Visible:=false;Shape12.Visible:=false;
           Shape13.Visible:=false;Shape14.Visible:=false;Shape15.Visible:=false;
           Shape16.Visible:=false;Shape17.Visible:=false;Shape18.Visible:=false;
           Shape19.Visible:=false;Shape20.Visible:=false;Shape21.Visible:=false;
           Shape22.Visible:=false;Shape23.Visible:=false;Shape24.Visible:=false;
           Shape25.Visible:=false;Shape26.Visible:=false;
           Shape27.Visible:=false; Shape28.Visible:=false; Shape29.Visible:=false; Shape30.Visible:=false;
     Shape31.Visible:=false; Shape32.Visible:=false; Shape33.Visible:=false; Shape34.Visible:=false;
     Shape35.Visible:=false; Shape36.Visible:=false; Shape37.Visible:=false; Shape38.Visible:=false;
     Shape39.Visible:=false; Shape40.Visible:=false; Shape41.Visible:=false; Shape42.Visible:=false;
     Shape43.Visible:=false; Shape44.Visible:=false; Shape45.Visible:=false; Shape46.Visible:=false;
     Shape47.Visible:=false; Shape48.Visible:=false; Shape49.Visible:=false; Shape50.Visible:=false;
     Shape51.Visible:=false; Shape52.Visible:=false; Shape53.Visible:=false; Shape54.Visible:=false;
     Shape55.Visible:=false; Shape56.Visible:=false;

     end;

end;

procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);     //ruch paletki
begin
   if zmiana_kier=false then begin
      if (Key = 37)then Lewo.Enabled := false;
      if (Key = 39)then prawo.Enabled := false;
   end else begin
      if (Key = 39)then Lewo.Enabled := false;
      if (Key = 37)then prawo.Enabled := false;
   end;

end;
                                                              // 2 poziom
procedure TForm1.Level_2Click(Sender: TObject);
begin
     Shape1.Visible:=true;   Shape1.Left:=224; Shape1.Top:=352; Shape1.Tag:=3; Shape1.Brush.Color:=clRed; Shape1.Pen.Color:=clMaroon;
     Shape2.Visible:=true;   Shape2.Left:=344; Shape2.Top:=352; Shape2.Tag:=3; Shape2.Brush.Color:=clRed; Shape2.Pen.Color:=clMaroon;
     Shape3.Visible:=true;   Shape3.Left:=464; Shape3.Top:=352; Shape3.Tag:=3; Shape3.Brush.Color:=clRed; Shape3.Pen.Color:=clMaroon;
     Shape4.Visible:=true;   Shape4.Left:=584; Shape4.Top:=352; Shape4.Tag:=3; Shape4.Brush.Color:=clRed; Shape4.Pen.Color:=clMaroon;
     Shape5.Visible:=true;   Shape5.Left:=704; Shape5.Top:=352; Shape5.Tag:=3; Shape5.Brush.Color:=clRed; Shape5.Pen.Color:=clMaroon;
     Shape6.Visible:=true;   Shape6.Left:=160; Shape6.Top:=304; Shape6.Tag:=2; Shape6.Brush.Color:=clYellow; Shape6.Pen.Color:=clOlive;
     Shape7.Visible:=true;   Shape7.Left:=280; Shape7.Top:=304; Shape7.Tag:=2; Shape7.Brush.Color:=clYellow; Shape7.Pen.Color:=clOlive;
     Shape8.Visible:=true;   Shape8.Left:=400; Shape8.Top:=304; Shape8.Tag:=2; Shape8.Brush.Color:=clYellow; Shape8.Pen.Color:=clOlive;
     Shape9.Visible:=true;   Shape9.Left:=520; Shape9.Top:=304; Shape9.Tag:=2; Shape9.Brush.Color:=clYellow; Shape9.Pen.Color:=clOlive;
     Shape10.Visible:=true;  Shape10.Left:=645; Shape10.Top:=304; Shape10.Tag:=2; Shape10.Brush.Color:=clYellow; Shape10.Pen.Color:=clOlive;
     Shape11.Visible:=true;  Shape11.Left:=768; Shape11.Top:=304; Shape11.Tag:=2; Shape11.Brush.Color:=clYellow; Shape11.Pen.Color:=clOlive;
     Shape12.Visible:=true;  Shape12.Left:=224; Shape12.Top:=256; Shape12.Tag:=2; Shape12.Brush.Color:=clYellow; Shape12.Pen.Color:=clOlive;
     Shape13.Visible:=true;  Shape13.Left:=344; Shape13.Top:=256; Shape13.Tag:=2; Shape13.Brush.Color:=clYellow; Shape13.Pen.Color:=clOlive;
     Shape14.Visible:=true;  Shape14.Left:=464; Shape14.Top:=256; Shape14.Tag:=2; Shape14.Brush.Color:=clYellow; Shape14.Pen.Color:=clOlive;
     Shape25.Visible:=true;  Shape25.Left:=584; Shape25.Top:=256; Shape25.Tag:=2; Shape25.Brush.Color:=clYellow; Shape25.Pen.Color:=clOlive;
     Shape26.Visible:=true;  Shape26.Left:=704; Shape26.Top:=256; Shape26.Tag:=2; Shape26.Brush.Color:=clYellow; Shape26.Pen.Color:=clOlive;

     Shape15.Visible:=true;  Shape15.Left:=152; Shape15.Top:=208; Shape15.Tag:=1; Shape15.Brush.Color:=clLime; Shape15.Pen.Color:=clGreen;
     Shape16.Visible:=true;  Shape16.Left:=272; Shape16.Top:=208; Shape16.Tag:=1; Shape16.Brush.Color:=clLime; Shape16.Pen.Color:=clGreen;
     Shape17.Visible:=true;  Shape17.Left:=397; Shape17.Top:=208; Shape17.Tag:=1; Shape17.Brush.Color:=clLime; Shape17.Pen.Color:=clGreen;
     Shape18.Visible:=true;  Shape18.Left:=520; Shape18.Top:=208; Shape18.Tag:=1; Shape18.Brush.Color:=clLime; Shape18.Pen.Color:=clGreen;
     Shape19.Visible:=true;  Shape19.Left:=640; Shape19.Top:=208; Shape19.Tag:=1; Shape19.Brush.Color:=clLime; Shape19.Pen.Color:=clGreen;
     Shape20.Visible:=true;  Shape20.Left:=768; Shape20.Top:=208; Shape20.Tag:=1; Shape20.Brush.Color:=clLime; Shape20.Pen.Color:=clGreen;
     Shape21.Visible:=true;  Shape21.Left:=224; Shape21.Top:=160; Shape21.Tag:=1; Shape21.Brush.Color:=clLime; Shape21.Pen.Color:=clGreen;
     Shape22.Visible:=true;  Shape22.Left:=344; Shape22.Top:=160; Shape22.Tag:=1; Shape22.Brush.Color:=clLime; Shape22.Pen.Color:=clGreen;
     Shape23.Visible:=true;  Shape23.Left:=464; Shape23.Top:=160; Shape23.Tag:=1; Shape23.Brush.Color:=clLime; Shape23.Pen.Color:=clGreen;
     Shape24.Visible:=true;  Shape24.Left:=584; Shape24.Top:=160; Shape24.Tag:=1; Shape24.Brush.Color:=clLime; Shape24.Pen.Color:=clGreen;
     Shape27.Visible:=true;  Shape27.Left:=704; Shape27.Top:=160; Shape27.Tag:=1; Shape27.Brush.Color:=clLime; Shape27.Pen.Color:=clGreen;

     Paletka.Visible:=true;
     Pilka.Visible:=true;
     Level_2.Visible:=false;
     Rakieta1.Visible:=false;
     Rakieta2.Visible:=false;
     Rakieta3.Visible:=false;
     Liczba_zyc_dodana.Visible:=false;
     Paletka.Width:=160;
     Wygrana.Visible:=false;
     Zwolnienie.Visible:=false;
     Przyspieszenie.Visible:=false;
     zmiana_kier:=false;
     zmiana_kieronkow.Visible:=false;
     Lewo.Interval:=20;
     Prawo.Interval:=20;
     Paletka.Top:=700;
     Zmniejszenie.Visible:=false;
     Rozszerzenie.Visible:=false;
     Przysp_paletki.Visible:=false;
     Zwolnienie_paletki.Visible:=false;
     pr_ogolna:=pr_poziom2;
     Wyjscie.Visible:=false;
end;

procedure TForm1.Level_3Click(Sender: TObject);                      // 3 poziom
begin
     with Shape1 do begin    end;
     Shape1.Visible:=true;   Shape1.Left:=40; Shape1.Top:=65; Shape1.Tag:=3; Shape1.Brush.Color:=clRed; Shape1.Pen.Color:=clMaroon;
     Shape2.Visible:=true;   Shape2.Left:=160; Shape2.Top:=65; Shape2.Tag:=3; Shape2.Brush.Color:=clRed; Shape2.Pen.Color:=clMaroon;
     Shape3.Visible:=true;   Shape3.Left:=280; Shape3.Top:=65; Shape3.Tag:=3; Shape3.Brush.Color:=clRed; Shape3.Pen.Color:=clMaroon;
     Shape4.Visible:=true;   Shape4.Left:=400; Shape4.Top:=65; Shape4.Tag:=3; Shape4.Brush.Color:=clRed; Shape4.Pen.Color:=clMaroon;
     Shape5.Visible:=true;   Shape5.Left:=520; Shape5.Top:=65; Shape5.Tag:=3; Shape5.Brush.Color:=clRed; Shape5.Pen.Color:=clMaroon;

     Shape6.Visible:=true;   Shape6.Left:=160; Shape6.Top:=112; Shape6.Tag:=2; Shape6.Brush.Color:=clYellow; Shape6.Pen.Color:=clOlive;
     Shape7.Visible:=true;   Shape7.Left:=280; Shape7.Top:=112; Shape7.Tag:=2; Shape7.Brush.Color:=clYellow; Shape7.Pen.Color:=clOlive;
     Shape8.Visible:=true;   Shape8.Left:=400; Shape8.Top:=112; Shape8.Tag:=2; Shape8.Brush.Color:=clYellow; Shape8.Pen.Color:=clOlive;
     Shape9.Visible:=true;   Shape9.Left:=520; Shape9.Top:=112; Shape9.Tag:=2; Shape9.Brush.Color:=clYellow; Shape9.Pen.Color:=clOlive;
     Shape10.Visible:=true;  Shape10.Left:=645; Shape10.Top:=112; Shape10.Tag:=2; Shape10.Brush.Color:=clYellow; Shape10.Pen.Color:=clOlive;
     Shape11.Visible:=true;  Shape11.Left:=768; Shape11.Top:=112; Shape11.Tag:=2; Shape11.Brush.Color:=clYellow; Shape11.Pen.Color:=clOlive;
     Shape12.Visible:=true;  Shape12.Left:=768; Shape12.Top:=160; Shape12.Tag:=2; Shape12.Brush.Color:=clYellow; Shape12.Pen.Color:=clOlive;
     Shape13.Visible:=true;  Shape13.Left:=768; Shape13.Top:=208; Shape13.Tag:=2; Shape13.Brush.Color:=clYellow; Shape13.Pen.Color:=clOlive;
     Shape14.Visible:=true;  Shape14.Left:=768; Shape14.Top:=304; Shape14.Tag:=2; Shape14.Brush.Color:=clYellow; Shape14.Pen.Color:=clOlive;
     with Shape45 do begin Visible:=true; Left:=645;  Top:=304;  Tag:=2; Brush.Color:=clYellow;   Pen.Color:=clOlive; end;
     with Shape46 do begin Visible:=true; Left:=520;  Top:=304;  Tag:=2; Brush.Color:=clYellow;   Pen.Color:=clOlive; end;
     with Shape47 do begin Visible:=true; Left:=400;  Top:=304;  Tag:=2; Brush.Color:=clYellow;   Pen.Color:=clOlive; end;
     with Shape48 do begin Visible:=true; Left:=280;  Top:=304;  Tag:=2; Brush.Color:=clYellow;   Pen.Color:=clOlive; end;
     with Shape49 do begin Visible:=true; Left:=160;  Top:=304;  Tag:=2; Brush.Color:=clYellow;   Pen.Color:=clOlive; end;
     with Shape50 do begin Visible:=true; Left:=160;  Top:=256;  Tag:=2; Brush.Color:=clYellow;   Pen.Color:=clOlive; end;
     with Shape51 do begin Visible:=true; Left:=160;  Top:=208;  Tag:=2; Brush.Color:=clYellow;   Pen.Color:=clOlive; end;
     with Shape52 do begin Visible:=true; Left:=160;  Top:=160;  Tag:=2; Brush.Color:=clYellow;   Pen.Color:=clOlive; end;
     with Shape56 do begin Visible:=true; Left:=768;  Top:=256;  Tag:=2; Brush.Color:=clYellow;   Pen.Color:=clOlive; end;

     Shape15.Visible:=true;  Shape15.Left:=280; Shape15.Top:=160; Shape15.Tag:=1; Shape15.Brush.Color:=clLime; Shape15.Pen.Color:=clGreen;
     Shape16.Visible:=true;  Shape16.Left:=400; Shape16.Top:=160; Shape16.Tag:=1; Shape16.Brush.Color:=clLime; Shape16.Pen.Color:=clGreen;
     Shape17.Visible:=true;  Shape17.Left:=520; Shape17.Top:=160; Shape17.Tag:=1; Shape17.Brush.Color:=clLime; Shape17.Pen.Color:=clGreen;
     Shape18.Visible:=true;  Shape18.Left:=645; Shape18.Top:=160; Shape18.Tag:=1; Shape18.Brush.Color:=clLime; Shape18.Pen.Color:=clGreen;
     Shape19.Visible:=true;  Shape19.Left:=645; Shape19.Top:=208; Shape19.Tag:=1; Shape19.Brush.Color:=clLime; Shape19.Pen.Color:=clGreen;
     Shape20.Visible:=true;  Shape20.Left:=645; Shape20.Top:=256; Shape20.Tag:=1; Shape20.Brush.Color:=clLime; Shape20.Pen.Color:=clGreen;
     Shape21.Visible:=true;  Shape21.Left:=520; Shape21.Top:=256; Shape21.Tag:=1; Shape21.Brush.Color:=clLime; Shape21.Pen.Color:=clGreen;
     Shape22.Visible:=true;  Shape22.Left:=400; Shape22.Top:=256; Shape22.Tag:=1; Shape22.Brush.Color:=clLime; Shape22.Pen.Color:=clGreen;
     Shape23.Visible:=true;  Shape23.Left:=280; Shape23.Top:=256; Shape23.Tag:=1; Shape23.Brush.Color:=clLime; Shape23.Pen.Color:=clGreen;
     Shape24.Visible:=true;  Shape24.Left:=280; Shape24.Top:=208; Shape24.Tag:=1; Shape24.Brush.Color:=clLime; Shape24.Pen.Color:=clGreen;
     with Shape53 do begin Visible:=true; Left:=400;  Top:=208;  Tag:=1; Brush.Color:=clLime;   Pen.Color:=clGreen; end;
     with Shape54 do begin Visible:=true; Left:=520;  Top:=208;  Tag:=1; Brush.Color:=clLime;   Pen.Color:=clGreen; end;

     with Shape25 do begin Visible:=true; Left:=645  ;  Top:=65   ;  Tag:=3; Brush.Color:=clRed;   Pen.Color:=clMaroon; end;
     with Shape26 do begin Visible:=true; Left:=768  ;  Top:=65   ;  Tag:=3; Brush.Color:=clRed;   Pen.Color:=clMaroon; end;
     with Shape27 do begin Visible:=true; Left:=888  ;  Top:=65   ;  Tag:=3; Brush.Color:=clRed;   Pen.Color:=clMaroon; end;
     with Shape28 do begin Visible:=true; Left:=888  ;  Top:=112   ;  Tag:=3; Brush.Color:=clRed;   Pen.Color:=clMaroon; end;
     with Shape29 do begin Visible:=true; Left:=888  ;  Top:=160   ;  Tag:=3; Brush.Color:=clRed;   Pen.Color:=clMaroon; end;
     with Shape30 do begin Visible:=true; Left:=888  ;  Top:=208   ;  Tag:=3; Brush.Color:=clRed;   Pen.Color:=clMaroon; end;
     with Shape31 do begin Visible:=true; Left:=888  ;  Top:=256   ;  Tag:=3; Brush.Color:=clRed;   Pen.Color:=clMaroon; end;
     with Shape32 do begin Visible:=true; Left:=888  ;  Top:=352   ;  Tag:=3; Brush.Color:=clRed;   Pen.Color:=clMaroon; end;
     with Shape33 do begin Visible:=true; Left:=768  ;  Top:=352   ;  Tag:=3; Brush.Color:=clRed;   Pen.Color:=clMaroon; end;
     with Shape34 do begin Visible:=true; Left:=645  ;  Top:=352   ;  Tag:=3; Brush.Color:=clRed;   Pen.Color:=clMaroon; end;
     with Shape35 do begin Visible:=true; Left:=520  ;  Top:=352   ;  Tag:=3; Brush.Color:=clRed;   Pen.Color:=clMaroon; end;
     with Shape36 do begin Visible:=true; Left:=400  ;  Top:=352   ;  Tag:=3; Brush.Color:=clRed;   Pen.Color:=clMaroon; end;
     with Shape37 do begin Visible:=true; Left:=280  ;  Top:=352   ;  Tag:=3; Brush.Color:=clRed;   Pen.Color:=clMaroon; end;
     with Shape38 do begin Visible:=true; Left:=160  ;  Top:=352   ;  Tag:=3; Brush.Color:=clRed;   Pen.Color:=clMaroon; end;
     with Shape39 do begin Visible:=true; Left:=40  ;  Top:=352   ;  Tag:=3; Brush.Color:=clRed;   Pen.Color:=clMaroon; end;
     with Shape40 do begin Visible:=true; Left:=40  ;  Top:=304   ;  Tag:=3; Brush.Color:=clRed;   Pen.Color:=clMaroon; end;
     with Shape41 do begin Visible:=true; Left:=40  ;  Top:=256   ;  Tag:=3; Brush.Color:=clRed;   Pen.Color:=clMaroon; end;
     with Shape42 do begin Visible:=true; Left:=40  ;  Top:=208   ;  Tag:=3; Brush.Color:=clRed;   Pen.Color:=clMaroon; end;
     with Shape43 do begin Visible:=true; Left:=40  ;  Top:=160   ;  Tag:=3; Brush.Color:=clRed;   Pen.Color:=clMaroon; end;
     with Shape44 do begin Visible:=true; Left:=40  ;  Top:=112   ;  Tag:=3; Brush.Color:=clRed;   Pen.Color:=clMaroon; end;
     with Shape55 do begin Visible:=true; Left:=888  ;  Top:=304   ;  Tag:=3; Brush.Color:=clRed;   Pen.Color:=clMaroon; end;



     Paletka.Visible:=true;
     Pilka.Visible:=true;
     Level_3.Visible:=false;
     Rakieta1.Visible:=false;
     Rakieta2.Visible:=false;
     Rakieta3.Visible:=false;
     Liczba_zyc_dodana.Visible:=false;
     Paletka.Width:=160;
     Wygrana.Visible:=false;
     Zwolnienie.Visible:=false;
     Przyspieszenie.Visible:=false;
     zmiana_kier:=false;
     zmiana_kieronkow.Visible:=false;
     Lewo.Interval:=20;
     Prawo.Interval:=20;
     Paletka.Top:=666;
     Zmniejszenie.Visible:=false;
     Rozszerzenie.Visible:=false;
     Przysp_paletki.Visible:=false;
     Zwolnienie_paletki.Visible:=false;
     pr_ogolna:=pr_poziom3;
     Wyjscie.Visible:=false;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
  );
begin
      if zmiana_kier=false then begin
      if (Key = 37)then Lewo.Enabled := true;
      if (Key = 39)then prawo.Enabled := true;
   end else begin
      if (Key = 39)then Lewo.Enabled := true;
      if (Key = 37)then prawo.Enabled := true;
   end;
end;

procedure TForm1.LewoTimer(Sender: TObject);
begin
    if(paletka.Left >0) then paletka.Left:=paletka.Left-20;
end;

procedure TForm1.PrawoTimer(Sender: TObject);
begin
   if(paletka.Left+paletka.Width < tlo.Width) then paletka.Left:=paletka.Left+20;
end;



procedure TForm1.Nowa_graClick(Sender: TObject);          // 1 poziom/nowa gra
begin
     Przegrana.Visible:=false;
     Liczba_zyc.Caption:=inttostr(3);
     Shape1.Visible:=true;   Shape1.Left:=104; Shape1.Top:=152; Shape1.Tag:=3; Shape1.Brush.Color:=clRed; Shape1.Pen.Color:=clMaroon;
     Shape2.Visible:=true;   Shape2.Left:=104; Shape2.Top:=208; Shape2.Tag:=3; Shape2.Brush.Color:=clRed; Shape2.Pen.Color:=clMaroon;
     Shape3.Visible:=true;   Shape3.Left:=104; Shape3.Top:=280; Shape3.Tag:=3; Shape3.Brush.Color:=clRed; Shape3.Pen.Color:=clMaroon;
     Shape4.Visible:=true;   Shape4.Left:=104; Shape4.Top:=352; Shape4.Tag:=3; Shape4.Brush.Color:=clRed; Shape4.Pen.Color:=clMaroon;
     Shape5.Visible:=true;   Shape5.Left:=240; Shape5.Top:=352; Shape5.Tag:=3; Shape5.Brush.Color:=clRed; Shape5.Pen.Color:=clMaroon;
     Shape6.Visible:=true;   Shape6.Left:=384; Shape6.Top:=152; Shape6.Tag:=2; Shape6.Brush.Color:=clYellow; Shape6.Pen.Color:=clOlive;
     Shape7.Visible:=true;   Shape7.Left:=384; Shape7.Top:=208; Shape7.Tag:=2; Shape7.Brush.Color:=clYellow; Shape7.Pen.Color:=clOlive;
     Shape8.Visible:=true;   Shape8.Left:=384; Shape8.Top:=280; Shape8.Tag:=2; Shape8.Brush.Color:=clYellow; Shape8.Pen.Color:=clOlive;
     Shape9.Visible:=true;   Shape9.Left:=384; Shape9.Top:=352; Shape9.Tag:=2; Shape9.Brush.Color:=clYellow; Shape9.Pen.Color:=clOlive;
     Shape10.Visible:=true;  Shape10.Left:=504; Shape10.Top:=352; Shape10.Tag:=2; Shape10.Brush.Color:=clYellow; Shape10.Pen.Color:=clOlive;
     Shape11.Visible:=true;  Shape11.Left:=616; Shape11.Top:=352; Shape11.Tag:=2; Shape11.Brush.Color:=clYellow; Shape11.Pen.Color:=clOlive;
     Shape12.Visible:=true;  Shape12.Left:=616; Shape12.Top:=280; Shape12.Tag:=2; Shape12.Brush.Color:=clYellow; Shape12.Pen.Color:=clOlive;
     Shape13.Visible:=true;  Shape13.Left:=616; Shape13.Top:=208; Shape13.Tag:=2; Shape13.Brush.Color:=clYellow; Shape13.Pen.Color:=clOlive;
     Shape14.Visible:=true;  Shape14.Left:=616; Shape14.Top:=152; Shape14.Tag:=2; Shape14.Brush.Color:=clYellow; Shape14.Pen.Color:=clOlive;
     Shape15.Visible:=true;  Shape15.Left:=760; Shape15.Top:=152; Shape15.Tag:=1; Shape15.Brush.Color:=clLime; Shape15.Pen.Color:=clGreen;
     Shape16.Visible:=true;  Shape16.Left:=760; Shape16.Top:=208; Shape16.Tag:=1; Shape16.Brush.Color:=clLime; Shape16.Pen.Color:=clGreen;
     Shape17.Visible:=true;  Shape17.Left:=760; Shape17.Top:=256; Shape17.Tag:=1; Shape17.Brush.Color:=clLime; Shape17.Pen.Color:=clGreen;
     Shape18.Visible:=true;  Shape18.Left:=760; Shape18.Top:=304; Shape18.Tag:=1; Shape18.Brush.Color:=clLime; Shape18.Pen.Color:=clGreen;
     Shape19.Visible:=true;  Shape19.Left:=760; Shape19.Top:=352; Shape19.Tag:=1; Shape19.Brush.Color:=clLime; Shape19.Pen.Color:=clGreen;
     Shape20.Visible:=true;  Shape20.Left:=919; Shape20.Top:=152; Shape20.Tag:=1; Shape20.Brush.Color:=clLime; Shape20.Pen.Color:=clGreen;
     Shape21.Visible:=true;  Shape21.Left:=888; Shape21.Top:=208; Shape21.Tag:=1; Shape21.Brush.Color:=clLime; Shape21.Pen.Color:=clGreen;
     Shape22.Visible:=true;  Shape22.Left:=872; Shape22.Top:=256; Shape22.Tag:=1; Shape22.Brush.Color:=clLime; Shape22.Pen.Color:=clGreen;
     Shape23.Visible:=true;  Shape23.Left:=896; Shape23.Top:=304; Shape23.Tag:=1; Shape23.Brush.Color:=clLime; Shape23.Pen.Color:=clGreen;
     Shape24.Visible:=true;  Shape24.Left:=919; Shape24.Top:=352; Shape24.Tag:=1; Shape24.Brush.Color:=clLime; Shape24.Pen.Color:=clGreen;
     Shape25.Visible:=false;
     Shape26.Visible:=false;
     Shape27.Visible:=false; Shape28.Visible:=false; Shape29.Visible:=false; Shape30.Visible:=false;
     Shape31.Visible:=false; Shape32.Visible:=false; Shape33.Visible:=false; Shape34.Visible:=false;
     Shape35.Visible:=false; Shape36.Visible:=false; Shape37.Visible:=false; Shape38.Visible:=false;
     Shape39.Visible:=false; Shape40.Visible:=false; Shape41.Visible:=false; Shape42.Visible:=false;
     Shape43.Visible:=false; Shape44.Visible:=false; Shape45.Visible:=false; Shape46.Visible:=false;
     Shape47.Visible:=false; Shape48.Visible:=false; Shape49.Visible:=false; Shape50.Visible:=false;
     Shape51.Visible:=false; Shape52.Visible:=false; Shape53.Visible:=false; Shape54.Visible:=false;
     Shape55.Visible:=false; Shape56.Visible:=false;

     Paletka.Visible:=true;
     Pilka.Visible:=true;
     Nowa_gra.Visible:=false;
     Rakieta1.Visible:=false;
     Rakieta2.Visible:=false;
     Rakieta3.Visible:=false;
     Liczba_zyc_dodana.Visible:=false;
     Paletka.Width:=160;
     Wygrana.Visible:=false;
     Zwolnienie.Visible:=false;
     Przyspieszenie.Visible:=false;
     zmiana_kier:=false;
     zmiana_kieronkow.Visible:=false;
     level:=1;
     Lewo.Interval:=20;
     Prawo.Interval:=20;
     Paletka.Top:=736;
     Zmniejszenie.Visible:=false;
     Rozszerzenie.Visible:=false;
     Przysp_paletki.Visible:=false;
     Zwolnienie_paletki.Visible:=false;
     pr_ogolna:=pr_poziom1;
     Wyjscie.Visible:=false;

end;



begin
   pr_poziom1:=8;                        //poczatkowe wartosci predkosci
   pr_poziom2:=10;
   pr_poziom3:=11;
   level:=1;
   pr_ogolna:=pr_poziom1;
   pr_pozioma:=0;
   pr_pionowa:=Trunc(sqrt(pr_ogolna*pr_ogolna-pr_pozioma*pr_pozioma));
end.

