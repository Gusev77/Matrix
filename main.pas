unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, StdCtrls,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button13: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    RadioGroup1: TRadioGroup;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    StringGrid3: TStringGrid;
    procedure Button13Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckMatrix();
    procedure Label4Click(Sender: TObject);
    procedure SumMatrix();
    procedure SubMatrix();
    procedure DevMatrix();

  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }
procedure TForm1.Button13Click(Sender: TObject);
var i,j:byte;
begin
     Form1.CheckMatrix();

     for i:=0 to (StringGrid3.RowCount-1) do
         for j:=0 to (StringGrid3.ColCount-1) do StringGrid3.Cells[i,j] := '';

  case RadioGroup1.ItemIndex of
  0: Form1.SumMatrix();
  1: Form1.SubMatrix();
  2: Form1.DevMatrix();
  end;
end;

procedure TForm1.DevMatrix();
var i,j,l,n,k,m:byte;
    A,B,C:real;
begin
  if (StringGrid2.RowCount) <> (StringGrid1.ColCount) then
     begin
          MessageDLG('Число строк матрицы B должно равняться числу столбцов матрицы А',mtError,[mbOK],0);
          exit;
     end;

  StringGrid3.ColCount:=StringGrid2.ColCount;
  StringGrid3.RowCount:=StringGrid1.RowCount;

  n:=StringGrid1.rowCount-1;
  k:=StringGrid1.colCount-1;
  m:=StringGrid2.colCount-1;
  for i:=0 to n do
      for j:=0 to m do
          begin
               C:=0;
               for l:=0 to k do
                   begin
                        A:=StrToFloat(StringGrid1.Cells[l,i]);
                        B:=StrToFloat(StringGrid2.Cells[j,l]);
                        C:=C+A*B;
                        StringGrid3.Cells[j,i]:=FloatToStr (C) ;
                   end;
          end;
end;

procedure TForm1.SubMatrix();
var i,j:byte;
    A,B,C:real;
begin
     if ((Form1.StringGrid2.RowCount <> Form1.StringGrid1.RowCount) or (Form1.StringGrid2.ColCount <> Form1.StringGrid1.ColCount)) then
        begin
          MessageDLG('Размеры матриц должны быть одинаковыми.',mtError,[mbOK],0);
          exit;
        end;

     StringGrid3.ColCount:=StringGrid2.ColCount;
     StringGrid3.RowCount:=StringGrid1.RowCount;

     for i:=0 to (Form1.StringGrid2.RowCount-1) do
      for j:=0 to (Form1.StringGrid2.ColCount-1) do
          begin
               A:=StrToFloat(Form1.StringGrid1.Cells[i,j]);
               B:=StrToFloat(Form1.StringGrid2.Cells[i,j]);
               C:=(A-B);
               Form1.StringGrid3.Cells[i,j]:=FloatToStr(C);
          end;
end;

procedure TForm1.SumMatrix();
var i,j:byte;
    A,B,C:real;
begin
  if ((Form1.StringGrid2.RowCount <> Form1.StringGrid1.RowCount) or (Form1.StringGrid2.ColCount <> Form1.StringGrid1.ColCount)) then
     begin
          MessageDLG('Размеры матриц должны быть одинаковыми.',mtError,[mbOK],0);
          exit;
     end;

  StringGrid3.ColCount:=StringGrid2.ColCount;
  StringGrid3.RowCount:=StringGrid1.RowCount;

  for i:=0 to (Form1.StringGrid2.RowCount-1) do
      for j:=0 to (Form1.StringGrid2.ColCount-1) do
          begin
               A:=StrToFloat(Form1.StringGrid1.Cells[i,j]);
               B:=StrToFloat(Form1.StringGrid2.Cells[i,j]);
               C:=(A+B);
               Form1.StringGrid3.Cells[i,j]:=FloatToStr(C);
          end;
end;

procedure TForm1.CheckMatrix;
var j,i,p:byte;
    check:string;
begin
  check := '';
  for j:=0 to (Form1.StringGrid1.RowCount-1) do
      for i:=0 to (Form1.StringGrid1.ColCount-1) do
          begin
            if Form1.StringGrid1.Cells[i,j]= '' then
              begin
                MessageDLG('Заполните все ячейки.',mtError,[mbOK],0);
                exit;
              end

            else
              check:=check+Form1.StringGrid1.Cells[i,j];
          end;

      for j:=0 to (Form1.StringGrid2.RowCount-1) do
          for i:=0 to (Form1.StringGrid2.ColCount-1) do
              begin
                   if Form1.StringGrid2.Cells[i,j]= '' then
                      begin
                           MessageDLG('Заполните все ячейки.',mtError,[mbOK],0);
                           exit;
                      end
                   else
                       check:=check+Form1.StringGrid2.Cells[i,j];
              end;
    for i:=1 to length(check) do
        begin
             if check[i] in ['0'..'9','-'] then p:=1
             else
                 begin
                      MessageDLG('Некорректный ввод!',mtError,[mbOK],0);
                      exit;
                 end;
        end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Image1.Picture.LoadFromFile('bg.jpg');
end;

procedure TForm1.Label4Click(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  StringGrid1.ColCount:=StringGrid1.ColCount-1;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  StringGrid1.ColCount:=StringGrid1.ColCount+1;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  StringGrid1.RowCount:=StringGrid1.RowCount-1;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  StringGrid1.RowCount:=StringGrid1.RowCount+1;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  StringGrid2.ColCount:=StringGrid2.ColCount-1;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  StringGrid2.ColCount:=StringGrid2.ColCount+1;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  StringGrid2.RowCount:=StringGrid2.RowCount-1;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  StringGrid2.RowCount:=StringGrid2.RowCount+1;
end;

end.

