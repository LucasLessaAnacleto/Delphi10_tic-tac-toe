unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TTikTacToe = class(TForm)
    line1: TLabel;
    line2: TLabel;
    line3: TLabel;
    lb_tittle: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    linha: TEdit;
    coluna: TEdit;
    Button1: TButton;
    procedure linhaKeyPress(Sender: TObject; var Key: Char);
    procedure colunaKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    procedure termina(messagem: String);
    procedure inicia;
    procedure Imprimir;
    function tag(jog:integer):String;
    function getPosi(linha,coluna:integer):integer;
    function alterna():integer;
    function VerificaVitoria():boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TikTacToe: TTikTacToe;
  tabuleiro:array[1..9]of string;
  jogador:integer=1;
  rodada:integer;

implementation

{$R *.dfm}

{Construa um algoritmo para o jogo da velha. Esse jogo consiste em um tabuleiro de
dimens�o 3x3 de valores O ou X. Os usu�rios devem informar a linha e a coluna que
desejam preencher. A partir da terceira jogada de cada jogador � necess�rio verificar
se houve algum ganhador. Tamb�m � poss�vel que o resultado do jogo seja empate
(nenhum jogador preencheu uma coluna, uma linha ou uma diagonal).}

function TTikTacToe.alterna: integer;
begin
 if jogador = 1 then
 jogador:=2
 else
 jogador:=1;
end;

procedure TTikTacToe.Button1Click(Sender: TObject);
var
calc:integer;
begin
 if uppercase(button1.Caption) = 'JOGAR NOVAMENTE' then
 begin
    inicia;
 end else
 if (length(linha.text)>0)and(length(coluna.text)>0) then
 begin
  if tabuleiro[getPosi(strtoint(linha.Text),strtoint(coluna.Text))] = '-' then
  begin
    rodada:=rodada+1;
    tabuleiro[getPosi(strtoint(linha.Text),strtoint(coluna.Text))]:=tag(jogador);
    imprimir;
    linha.Clear;
    coluna.clear;
    linha.SetFocus;
    alterna;
    lb_tittle.caption:='Jogador: "'+uppercase(tag(jogador))+'"';
    if (VerificaVitoria()) then
    begin
       termina('Jogador "'+uppercase(tag(jogador))+'" venceu!!!');
    end else
    if rodada = 9 then
    begin
      termina('Deu velha!!!');
    end;
  end else begin
   Showmessage('essa posi��o ja esta prenchida');
   linha.Clear;
   coluna.Clear;
   linha.SetFocus;

  end;
end else begin
 Showmessage('Defina a linha e coluna que deseja por "'+uppercase(tag(jogador))+'"');
 linha.clear;
 coluna.Clear;
 linha.SetFocus;

end;

end;

procedure TTikTacToe.colunaKeyPress(Sender: TObject; var Key: Char);
begin
 if (not(key in ['1'..'3',#8]))or((length(coluna.text) <> 0)and(key<>#8)) then
   key:=#0;
end;

procedure TTikTacToe.FormActivate(Sender: TObject);
begin
 button1.Left:=(width div 2)-(button1.Width div 2);
 line2.Left:=line1.Left;
 inicia;
end;

procedure TTikTacToe.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
  Perform(WM_NEXTDLGCTL,0,0);
end;

function TTikTacToe.getPosi(linha, coluna: integer): integer;
begin
 result:=((linha-1)*3)+coluna;
end;

procedure TTikTacToe.Imprimir;
var
i:integer;
barra:string;
begin
line1.Caption:='';
line2.Caption:='';
line3.Caption:='';
barra:='|';
  for I := 1 to 3 do
  begin
   if i > 2 then
   barra:='';
   line1.Caption:=line1.Caption+' '+tabuleiro[i]+' '+barra;
   line2.Caption:=line2.Caption+' '+tabuleiro[i+3]+' '+barra;
   line3.Caption:=line3.Caption+' '+tabuleiro[i+6]+' '+barra;
  end;
end;

procedure TTikTacToe.inicia;
var
i:integer;
begin
 jogador:=1;
 rodada:=0;
 lb_tittle.Left:=256;
 lb_tittle.top:=24;
 lb_tittle.Caption:='Jogador: "'+uppercase(tag(jogador))+'"';
 label6.Visible:=true;
 label5.Visible:=true;
 linha.Visible:=true;
 coluna.Visible:=true;
 coluna.clear;
 linha.clear;
 button1.Caption:='Realizar Jogada';
 for i := 1 to 9 do
 begin
  tabuleiro[i]:='-';
 end;
 imprimir;
end;

procedure TTikTacToe.linhaKeyPress(Sender: TObject; var Key: Char);
begin
 if (not(key in ['1'..'3',#8]))or((length(linha.text) <> 0)and(key<>#8)) then
   key:=#0;
end;

function TTikTacToe.tag(jog:integer): String;
begin
 if jog = 1 then
 result:='x'
 else
 result:='o';
end;

procedure TTikTacToe.termina(messagem: String);
begin
 label6.Visible:=false;
 label5.Visible:=false;
 linha.Visible:=false;
 coluna.Visible:=false;
 lb_tittle.Caption:=messagem;
 lb_tittle.Top:=label6.Top;
 lb_tittle.left:=(width div 2)-(lb_tittle.width div 2);
 Button1.Caption:='Jogar Novamente';
end;

function TTikTacToe.VerificaVitoria: boolean;
var
bool:boolean;
  I,j,p: Integer;
begin
 bool:=false;
 alterna;
  for I := 1 to 3 do
  begin
    if (tabuleiro[getPosi(i,1)]=tag(jogador) )and(tabuleiro[getPosi(i,2)]=tag(jogador))and(tabuleiro[getPosi(i,3)]=tag(jogador)) then
    begin
     bool:=TRUE;
     break;
    end else
    if (tabuleiro[getPosi(1,i)]=tag(jogador) )and(tabuleiro[getPosi(2,i)]=tag(jogador))and(tabuleiro[getPosi(3,i)]=tag(jogador)) then
    begin
     bool:=TRUE;
     break;
    end else
    if (tabuleiro[getPosi(1,1)]=tag(jogador))and(tabuleiro[getPosi(2,2)]=tag(jogador))and(tabuleiro[getPosi(3,3)]=tag(jogador))and(i=1) then
    begin
     bool:=TRUE;
     break;
    end else
    if (tabuleiro[getPosi(1,3)]=tag(jogador) )and(tabuleiro[getPosi(2,2)]=tag(jogador))and(tabuleiro[getPosi(3,1)]=tag(jogador))and(i=1) then
    begin
     bool:=TRUE;
     break;
    end;
  end;
  if not(bool) then
  alterna;
  result:=bool;
end;

end.
