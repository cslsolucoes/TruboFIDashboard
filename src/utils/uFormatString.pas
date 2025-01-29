{
API Strings - Manipulação de Strings
Versão : 2.0.0
Autor: Claiton de Souza Linhares
Criação : 01/07/2019
Atualização: 02/07/2023 - atualização realizada de campos senteças (Sessao, Padrão, Encriptação)
Atualização: 05/07/2023 - atualização realizada função caracter se caNumero retorna 0 caso string vazia
Atualização: 24/03/2024 - compatibilização com Delphi 11
Atualização: 12/12/2024 - compatibilização com Delphi 12 adicionado orientação a objeto
}

unit uFormatString;

interface

uses
{$ifdef FPC}
  Classes, SysUtils, Graphics, Dialogs, Forms;
{$else}
  System.Classes, System.SysUtils
  {$IFDEF MSWINDOWS}
    ,Vcl.Graphics, Vcl.Dialogs, Vcl.Forms
  {$endif}
{$endif}
   ;
const
  {$ifdef FPC}
     ;
  {$else}
     LineEnding = #13#10;
     EmptyStr = '';

     {$IFDEF MSWINDOWS}
        DirectorySeparator = '\';
     {$ELSE}
        DirectorySeparator = '/';
     {$ENDIF}
  {$endif}

{$I Constrants.inc}

Type
  TStringArray     = array of String;
  TArrayStringList = Array of TStringList;
  ArrayChar        = array of Char;
  TAnsiString      = array of AnsiString;

Type
  TFormatString = Class
  private
    class var FDelimiter: Char;
  Protected

    Class Function StrZero                 (VFString  : String; VFTamanho: Integer): String;
    Class Function FAsc                    (VFString  : String) : Integer;
    Class Function PDireita                (VFString  : String; VFQuantidade : Integer) : String;
    Class Function PadStr                  (v:string) : String;

  public
    Const
      caNumero           : Char = 'N';
      caNumeroPonto      : Char = 'I';
      caAaZMaiusculo     : Char = 'D';
      caAaZMinusculo     : Char = 'U';
      caHexMaiusculo     : Char = 'E';
      caHexMinusculo     : Char = 'H';
      caVersaoProduto    : Char = '1';
      caVerSaoArquivo    : Char = '2';
      caVerSaoGestao     : Char = '3';
      caVersaoNumero     : Char = '4';

      ipFormatoPadrao    : Char = 'B';
      ipFormato15d       : Char = 'A';

      maFormato2pontos   : Char = 'A';
      maFormato100pontos : Char = 'B';

    class property  Delimiter  : Char read FDelimiter write FDelimiter;

    Class Function  Crypta              (VFString:String) : String;
    Class Function  DeCrypta            (VFString:String) : String;

    Class Function  ArrayToString       (ArrayValor : TStringArray ; const Delimiter : char = ',') : String; overload;
    Class Function  ArrayToString       (A: arrayChar): String; overload;
    Class Procedure ArrayReserveFast    (var a: TStringArray; const len: longint; const reserveLength: longint);
    Class Function  ArrayAddFast        (var a: TStringArray; var len: longint; const e: string): longint;
    Class Function  ArrayField          (valor: string; delimitador: char; campo: integer): String;
    Class Function  ArrayFieldCount     (valor: string; const delimitador: char = #0): Integer;

    Class Function  StrArrayToArrayChar (const StrArray: tStringArray): ArrayChar;
    Class Procedure StrSplit            (out splitted: TStringArray; s, sep: string; includeEmpty: boolean); overload;
    Class Function  StrSplit            (const s, sep: string; includeEmpty: boolean) : TStringArray; overload;
    Class Function  Strlsequal          (p1,p2:pchar;l1,l2: longint):boolean;
    Class Function  StrlsIndexOf        (str, searched: pchar; l1, l2: longint): longint;
    Class Function  Strindexof          (const str, searched: string; from: longint): longint;
    Class Function  StrCopyFrom         (const s: string; start: longint): string; inline;
    Class Function  StrToArray          (strValor : String ; Const Delimiter : Char = ',' ; Const IncluirVazio : Boolean = False) : TStringArray;
    Class Function  StrAlign            (valor: string; tam: integer; const alinha: char = 'D'): String;
    Class Function  StrAlignLeft        (valor: string; tam: integer; const alinha: char = 'E'): String;
    Class Function  StrAlignRigth       (valor: string; tam: integer; const alinha: char = 'D'): String;
    Class Function  StrAlignCenter      (valor: string; tam: integer; const alinha: char = 'C'): String;
    Class Function  FormatIPAddress     (valor:string; const tipo:char = 'B') : String;
    Class Function  FormatMACAddress    (valor:string; const tipo:char = 'A') : String;
    Class Function  FormatCharacter     (valor:string; const tipo:char = 'E') : String;
    Class Function  FormatSpace         (valor:string; tam :integer ; const alinha:char = 'E')    : String;
  End;

implementation

{ TUtil }

class function TFormatString.ArrayAddFast(var a: TStringArray; var len: longint; const e: string): longint;
begin
  if len >= length(a) then
  arrayReserveFast(a, len, len+1);
  result:=len;
  len := len +1;
  a[result] := Trim(e);
end;

class function TFormatString.ArrayField(valor: string; delimitador: char; campo: integer): String;
var
  s,t:string;
  i,c:integer;
  sair:boolean;
begin
  s := '';
  t := '';
  i :=  0;
  c :=  1;
  sair := false;
  repeat
    inc(i);
    if (c = campo) and (i = length(valor))
    then begin
         if valor[i] <> delimitador then s := s + valor[i];
         t      := s;
         Result := t;
         sair   := true;
         end;

    if (valor = '')
    then sair := true
    else begin
         if (valor[i] = delimitador) and (t = '') and not sair
         then begin
              if c = campo
              then begin
                   t      := s;
                   Result := t;
                   end
              else begin
                   s      := '';
                   inc(c);
                   end
              end
         else if not sair then s := s + valor[i];
         end;
    if (i = length(valor)) and (t = '') then Result := '';

  until (i = length(valor)) or ((c = campo) and (t <> '')) or (sair = true);
end;

class function TFormatString.ArrayFieldCount(valor: string; const delimitador: char): Integer;
var
  i,c:integer;
  D : String;
begin
  If delimitador = #0 then
     D := FDelimiter
  Else
     D := delimitador;
  c :=  1;
  for i := 1 to length(valor)
  do begin
     if valor[i] = D[1]
     then begin
          inc(c);
          end;
     end;
  Result := c;
end;

class procedure TFormatString.ArrayReserveFast(var a: TStringArray; const len, reserveLength: longint);
begin
  if reserveLength <= len then exit;
  if reserveLength <= length(a) then exit;
  if reserveLength <= 4  then SetLength(a, 4)
  else if reserveLength <= 16 then SetLength(a, 16)
  else if (len <= 1024) and (reserveLength <= 2*len) then SetLength(a, 2*len)
  else if (length(a) <= 1024) and (reserveLength <= 2*length(a)) then SetLength(a, 2*length(a))
  else if (reserveLength <= len+1024) then SetLength(a, len+1024)
  else if (reserveLength <= length(a)+1024) then SetLength(a, length(a)+1024)
  else SetLength(a, reserveLength);
end;

class function TFormatString.ArrayToString(ArrayValor: TStringArray; const Delimiter: char): String;
Var
    s : String;
    i : Integer;
begin
  FDelimiter := Delimiter;
  s := '';
  for i := 0 to High(ArrayValor) do
    s := s + ArrayValor[i] + FDelimiter;
  Result := copy(s,1,Length(s) - 1);
end;

class function TFormatString.ArrayToString(A: arrayChar): String;
var i: integer;
begin
  Result := '';
  for i := 0 to High(A) do
    Result := Result + A[i];
end;

class function TFormatString.FormatCharacter(valor: string; const tipo: char): String;
var
  i:integer;
  s:String;
begin
  s := '';
  case upcase(tipo) of
                       //12345
    '1': //1.00.00 Versão  10000
       s := Copy(valor,1,1) + '.' + Copy(valor,2,2) + '.' + Copy(valor,4,2);
                       //1234
    '2': //1.0.0.0 Versão  1000
       s := Copy(valor,1,1) + '.' + Copy(valor,2,1) + '.' + Copy(valor,3,1) + '.' + Copy(valor,4,4);
                          //12345678
    '3': //10.00.0000 Versão  10000000
       s := Copy(valor,1,2) + '.' + Copy(valor,3,2) + '.' + Copy(valor,5,4);

    '4':Begin
         for i := 1 to length(valor) do
            if valor[i] in ['0'..'9','.']
               then s := s + valor[i];
         if Length(s) = 0 Then s := '0';
    end;

    'D':for i := 1 to length(valor) do
          if valor[i] in ['A'..'Z']
             then s := s + chr(ord(valor[i]) + 32)
             else s := s + valor[i];

    'U':for i := 1 to length(valor) do
          if valor[i] in ['a'..'z']
             then s := s + chr(ord(valor[i]) - 32)
             else s := s + valor[i];

    'E':for i := 1 to length(valor) do
          if valor[i] in ['A'..'Z','a'..'z','0'..'9']
             then s := s + valor[i];

    'H':for i := 1 to length(valor) do
          if valor[i] in ['A'..'F','a'..'f','0'..'9']
             then s := s + valor[i];

    'N':for i := 1 to length(valor) do
          if valor[i] in ['0'..'9']
             then s := s + valor[i];

    'I':for i := 1 to length(valor) do
          if valor[i] in ['0'..'9','.']
             then s := s + valor[i];
//      else s := s +  valor[i];
  end;
  Result := s;
end;

class function TFormatString.FAsc(VFString: String): Integer;
var
  VFS: String;
begin
  VFS    := VFString;
  Result := Ord(VFS[1]);
end;

class function TFormatString.Crypta(VFString: String): String;
Var
  Y,
  VTamanho,
  k        : Word;
  VAsc     : Real;
  VCrypta  : String;
  VNumAsc,
  VAjuda,
  VFLetra  : String;
  VImpar   : Boolean;
Begin
  VTamanho := Length(trim(VFString));
  VCrypta  := '';
  VNumAsc  := '';
  VFString := Trim(VFString);
  For y := 1 To VTamanho Do
  Begin
    VFLetra  := Copy(VFString,y,1);
    VNumAsc  := StrZero(FloatToStr(FAsc(VFLetra)),3);
    VAjuda   := '';
    For k := 3 Downto 1 Do
       VAjuda := VAjuda + copy(VNumAsc,k,1);

    VImpar := False;

    If (y mod 2) = 0 Then
      VAsc   := StrToFloat(VAjuda)
    Else
      Begin
      VAsc   := StrToFloat(Vajuda)+3;
      VImpar := True;
    End;

    If VAsc > 255 Then
      If Vimpar Then
         VCrypta := VCrypta + Chr(252)+Chr(145)+Chr(254)+Chr(StrToInt(Copy(StrZero(FloatToStr(VAsc),3),1,2)))+Chr(StrToInt(PDireita(StrZero(FloatToStr(VAsc),3),2)))
      Else
         VCrypta := VCrypta + Chr(252)+Chr(145)+Chr(247)+Chr(StrToInt(Copy(StrZero(FloatToStr(VAsc),3),1,2)))+Chr(StrToInt(PDireita(StrZero(FloatToStr(VAsc),3),2)))
    Else
      If Vimpar Then
         VCrypta := VCrypta + Chr(254)+ Chr(StrToInt(FloatToStr(VAsc)))
      Else
         VCrypta := VCrypta + Chr(247)+ Chr(StrToInt(FloatToStr(VAsc)));
  End;
  Result := VCrypta;
end;

class function TFormatString.DeCrypta(VFString: String): String;
Var
  y,
  k         : Word;
  VCrypta,
  VProc,
  VFLetra,
  VAjuda,
  VNumASc   : String;
  VAsc      : Real;
  VPrimNum,
//  VContProc,
  VPegouPar,
  VPar,
  VParLetra : Boolean;
Begin
  VCrypta    := '';
  VProc      := '';
  VPar       := False;
  VNumASc    := '';
  VPrimNum   := False;
//  VContProc  := False;
  VPegouPar := False;
  VParLetra  := False;
  For y := 1 To Length(VFString) Do
  Begin
    VFLetra  := Copy(VFString,y,1);
    If (FAsc(VFLetra) = 252) And (VProc = '') Then
    Begin
      VProc := Vproc + VFletra;
      Continue;
    End;
    If (FAsc(VFLetra) = 145) And (VFLetra <> '') Then
    Begin
      VProc := VProc + VFletra;
      Continue;
    End;
    If VProc = Chr(252)+Chr(145) Then
    Begin
      VPrimNum  := True;
      VProc     := '';
      If VFLetra = Chr(247) Then
         VPar := True
      Else
         VPar := False;

      VPegoupar := True;
      Continue;
    End;
    If VPrimNum Then
    Begin
      VPrimNum := False;
      VNumAsc  := Trim(FloatToStr(FAsc(VFLetra)));
      Continue;
    End;
    If VPegoupar Then
    Begin
      VPegouPar := False;
      VNumAsc   := VNumAsc + PDireita(Trim(FloatToStr(FAsc(VFLetra))),1);
      VAsc      := StrToFloat(VNumASc);
      If Not Vpar Then
         VAsc  := VAsc - 3;

      VAjuda := '';
      For k := 3 Downto 1 Do
          VAjuda := VAjuda + Copy(FloatToStr(VAsc),k,1);

      VAsc := StrToFloat(VAjuda);
    End
    Else
    Begin
      If Not VParLetra Then
      Begin
        If VFletra = Chr(247) Then
          VPar := True
        Else
          Vpar := False;

        VParLetra := True;
        Continue;
      End
      Else
        VParletra := False;

      VAjuda := FloatToStr(FAsc(VFLetra));

      If VPar Then
        VAsc := StrToFloat(VAjuda)
      Else
        VAsc := StrToFloat(VAjuda) - 3;

      VNumAsc  := StrZero(FloatToStr(VAsc),3);
      VAjuda   := '';
      For k := 3 Downto 1 Do
        VAjuda := VAjuda + Copy(VNumAsc,k,1);

      VAsc := StrToFloat(VAjuda);
    End;
    VCrypta := VCrypta + Chr(StrToInt(FloatToStr(VAsc)));
  End;
  Result := VCrypta;
end;

class function TFormatString.FormatIPAddress(valor: string; const tipo: char): String;
Var
  t: integer;
  a: Array [1..4] of String;
  v: String;
begin
  valor := FormatCharacter(trim(valor),'I');

  if (valor = '')
  then Result := '';

  if  (not (ArrayFieldCount(valor,'.') > 3))
  then begin Result := ''; exit; end;

  for t := 1 to 4
  do if ArrayField(valor,'.',t) = ''
     then a[t] := '0'
     else a[t] := ArrayField(valor,'.',t) ;

  case upcase(tipo) of
    // com 12 Characteres (000.000.000.000)
    'A': v      := PadStr(a[1]) + '.' +
                   PadStr(a[2]) + '.' +
                   PadStr(a[3]) + '.' +
                   PadStr(a[4]) ;

    // minimo (0.0.0.0)
    'B': v      := IntToStr(StrToInt(PadStr(a[1]))) + '.' +
                   IntToStr(StrToInt(PadStr(a[2]))) + '.' +
                   IntToStr(StrToInt(PadStr(a[3]))) + '.' +
                   IntToStr(StrToInt(PadStr(a[4]))) ;

    // com 12 Characteres ()
    'C': v      := PadStr(a[1]) + '.' +
                   PadStr(a[2]) + '.' +
                   PadStr(a[3]) + '.' +
                   PadStr(a[4]) ;
  end;

  if  ((v = '000.000.000.000')
  or   (v = '0.0.0.0'))
  and ((upcase(tipo) = 'C')
  or   (upcase(tipo) = 'B')) then
    Result := ''
  else
    Result := v ;
end;

class function TFormatString.FormatMACAddress(valor: string; const tipo: char): String;
var
  t: integer;
  j: integer;
  s,r: string;
begin
  j := 0;
  case upcase(tipo) of
    // 00:00:00:00:00:00
    'A':begin
        s := trim(FormatCharacter(valor,'E'));
        if  (not Length(s) > 0)
        or  (s = '')
        then begin
             Result := '';
             exit;
             end;
        if Length(s) < 12
        then for t := 1 to (12 - Length(s))
             do  s :=  '0' + s;
        for t := 1 to Length(s)
        do begin
           inc(j);
           r := r + s[t];
           if  (j = 2)
           and (Length(s) > t)
           then begin
                j := 0;
                r := r + ':';
                end;
           end;
        Result := r;
        end;
     //001122334455
    'B':Result := trim(FormatCharacter(valor,'H'));
  end;
end;

class function TFormatString.PadStr(v: string): String;
var
  s:string;
  t:integer;
begin
  s := trim(v);
  if Length(s) < 3
  then for t := 1 to (3 - Length(s))
       do s :=  '0' + s;
  Result := s;
end;

class function TFormatString.PDireita(VFString: String; VFQuantidade: Integer): String;
begin
  Result := Copy(VFString,Length(VFString)-VFQuantidade+1,VFQuantidade);
end;

class function TFormatString.FormatSpace(valor: string; tam: integer; const alinha: char): String;
var
i,j,t:integer;
s,m:string;
begin
  //   alinha := upcase(alinha);
  s   := '';
  m   := '';
  valor := copy(valor,1,tam);
  tam := tam - length(valor);
  case upCase(alinha) of
    'D':begin
       for i := 1 to tam do
           s := s + ' ';
       Result := s + valor;
    end;

    'E':begin
       for i := 1 to tam do
           s := s + ' ';
       Result := valor + s;
    end;

    'C':begin
       t := tam div 2;
       j := tam mod 2;
       for i := 1 to (t + j) do
           s := s + ' ';
       for i := 1 to t do
           m := m + ' ';
       Result := s + valor + m;
    end;

    'L':begin
       for i:= 1 to length(valor) do
           if valor[i] in ['a'..'z','A'..'Z','=',',',':','|','!'] then  s := s + valor[i];
       Result := s;
    end;
  end;
end;

class function TFormatString.StrAlign(valor: string; tam: integer;
  const alinha: char): String;
var
  i,j,t:integer;
  s,m:string;
begin
  //   alinha := upcase(alinha);
  s   := '';
  m   := '';
  valor := copy(valor,1,tam);
  tam := tam - length(valor);
  case upCase(alinha) of
    'D':begin
          for i := 1 to tam do
            s := s + ' ';
          Result := s + valor;
    end;

    'E':begin
          for i := 1 to tam do
            s := s + ' ';
          Result := valor + s;
    end;

    'C':begin
          t := tam div 2;
          j := tam mod 2;
          for i := 1 to (t + j) do
            s := s + ' ';
          for i := 1 to t do
            m := m + ' ';
          Result := s + valor + m;
    end;

    'L':begin
          for i:= 1 to length(valor) do
            if valor[i] in ['a'..'z','A'..'Z','=',',',':','|','!'] then  s := s + valor[i];
          Result := s;
    end;
  end;
end;

class function TFormatString.StrAlignCenter(valor: string; tam: integer;
  const alinha: char): String;
begin
  Result := StrAlign(valor,tam,alinha);
end;

class function TFormatString.StrAlignLeft(valor: string; tam: integer; const alinha: char): String;
Begin
  Result := StrAlign(valor,tam,alinha);
end;

class function TFormatString.StrAlignRigth(valor: string; tam: integer;
  const alinha: char): String;
begin
  Result := StrAlign(valor,tam,alinha);
end;

class function TFormatString.StrCopyFrom(const s: string; start: longint): string;
begin
  result:=copy(s,start,length(s)-start+1);
end;

class function TFormatString.Strindexof(const str, searched: string;
  from: longint): longint;
begin
  if from > length(str) then exit(0);
  result := strlsIndexOf(pchar(pointer(str))+from-1, pchar(pointer(searched)), length(str) - from + 1, length(searched));
  if result < 0 then exit(0);
  result := result + from;
end;

class function TFormatString.StrArrayToArrayChar(const StrArray: tStringArray): ArrayChar;
var
  i, j, len: Integer;
begin
  len := 0;
  // Calcula o comprimento total do array de caracteres
  for i := Low(StrArray) to High(StrArray) do
    len := len + Length(StrArray[i]);

  // Aloca memória para o array de caracteres
  SetLength(Result, len);

  // Copia os caracteres para o array de caracteres
  len := 0;
  for i := Low(StrArray) to High(StrArray) do
  begin
    for j := 1 to Length(StrArray[i]) do
    begin
      Result[len] := StrArray[i][j];
      Inc(len);
    end;
  end;
end;

class function TFormatString.StrToArray(strValor: String; const Delimiter: Char; const IncluirVazio: Boolean): TStringArray;
Var p, m, reslen: Longint;
    srtArray: TStringArray;
Begin
  FDelimiter := Delimiter;

  //Zerando variáveis
  SetLength(srtArray, 0);
  reslen := 0;
  //checando string se é vazio
  If strValor = EmptyStr Then
  Begin
    If IncluirVazio Then
    Begin
      SetLength(srtArray, 1);
      srtArray[0] := EmptyStr;
    End;
    exit;
  End;

  p := pos(Delimiter, strValor);
  m := 1;

  While p > 0 Do
  Begin

    If p = m Then
    Begin
      If IncluirVazio Then
        arrayAddFast(srtArray, reslen, '');
    End
    Else
      arrayAddFast(srtArray, reslen, copy(strValor, m, p - m));

    m := p + length(Delimiter);
    p := strindexof(strValor, Delimiter, m);

  End;

  If (m <> length(strValor) + 1) Or IncluirVazio Then
    arrayAddFast(srtArray, reslen, strcopyfrom(strValor, m));

  SetLength(srtArray, reslen);
  Result := srtArray;
end;

class function TFormatString.Strlsequal(p1, p2: pchar; l1, l2: longint): boolean;
var i:integer;
begin
  result:=l1=l2;
  if not result then exit;
  for i:=0 to l1-1 do
    if p1[i]<>p2[i] then
      exit(false);
end;

class function TFormatString.StrlsIndexOf(str, searched: pchar; l1, l2: longint): longint;
var last: pchar;
begin
  if l2<=0 then exit(0);
  if l1<l2 then exit(-1);
  last:=str+(l1-l2);
  result:=0;
  while str <= last do begin
    if str^ = searched^ then
      if strlsequal(str, searched, l2, l2) then
        exit();
    inc(str);
    result := result + 1;
  end;
  result := -1;
end;

class procedure TFormatString.StrSplit(out splitted: TStringArray; s, sep: string; includeEmpty: boolean);
var p:longint;
    m: longint;
    reslen: longint;
begin
  SetLength(splitted,0);
  reslen := 0;
  if s='' then begin
    if includeEmpty then begin
      SetLength(splitted, 1);
      splitted[0] := '';
    end;
    exit;
  end;
  p:=pos(sep,s);
  m:=1;
  while p>0 do begin
    if p=m then begin
      if includeEmpty then
        arrayAddFast(splitted, reslen, '');
    end else
      arrayAddFast(splitted, reslen, copy(s,m,p-m));
    m:=p+length(sep);
    p:=strindexof(s, sep, m);
  end;
  if (m<>length(s)+1) or includeEmpty then
    arrayAddFast(splitted, reslen, strcopyfrom(s,m));
  SetLength(splitted, reslen);
end;

class function TFormatString.StrSplit(const s, sep: string; includeEmpty: boolean): TStringArray;
Var
  p, m, reslen: Longint;
  splitted: TStringArray;
Begin
  SetLength(splitted, 0);
  reslen := 0;
  If s = '' Then
  Begin
    If includeEmpty Then
    Begin
      SetLength(splitted, 1);
      splitted[0] := '';
    End;
    exit;
  End;
  p := pos(sep, s);
  m := 1;
  While p > 0 Do
  Begin
    If p = m Then
    Begin
      If includeEmpty Then
        arrayAddFast(splitted, reslen, '');
    End
    Else
      arrayAddFast(splitted, reslen, copy(s, m, p - m));
    m := p + length(sep);
    p := strindexof(s, sep, m);
  End;
  If (m <> length(s) + 1) Or includeEmpty Then
    arrayAddFast(splitted, reslen, strcopyfrom(s, m));
  SetLength(splitted, reslen);
  Result := splitted;
end;

class function TFormatString.StrZero(VFString: String; VFTamanho: Integer): String;
Var
  VFRetorno       : String;
  I,
  VFZerosAColocar : Integer;
Begin
  VFZerosAColocar := VFTamanho - Length(TrimLeft(TrimRight(VFString)));
  VFRetorno       := '';

  For I := 1 To VFZerosAColocar Do
     VFRetorno := VFRetorno + '0';

  Result := VFRetorno + TrimLeft(TrimRight(VFString));
end;

end.
