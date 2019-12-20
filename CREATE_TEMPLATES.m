%ŞABLONLARI KUR
%Karakterler
A=imread('karakterler_numaralar\A.bmp');B=imread('karakterler_numaralar\B.bmp');
C=imread('karakterler_numaralar\C.bmp');D=imread('karakterler_numaralar\D.bmp');
E=imread('karakterler_numaralar\E.bmp');F=imread('karakterler_numaralar\F.bmp');
G=imread('karakterler_numaralar\G.bmp');H=imread('karakterler_numaralar\H.bmp');
I=imread('karakterler_numaralar\I.bmp');J=imread('karakterler_numaralar\J.bmp');
K=imread('karakterler_numaralar\K.bmp');L=imread('karakterler_numaralar\L.bmp');
M=imread('karakterler_numaralar\M.bmp');N=imread('karakterler_numaralar\N.bmp');
O=imread('karakterler_numaralar\O.bmp');P=imread('karakterler_numaralar\P.bmp');
Q=imread('karakterler_numaralar\Q.bmp');R=imread('karakterler_numaralar\R.bmp');
S=imread('karakterler_numaralar\S.bmp');T=imread('karakterler_numaralar\T.bmp');
U=imread('karakterler_numaralar\U.bmp');V=imread('karakterler_numaralar\V.bmp');
W=imread('karakterler_numaralar\W.bmp');X=imread('karakterler_numaralar\X.bmp');
Y=imread('karakterler_numaralar\Y.bmp');Z=imread('karakterler_numaralar\Z.bmp');
%imshow(H);
%Numaralar
one=imread('karakterler_numaralar\1.bmp');  two=imread('karakterler_numaralar\2.bmp');
three=imread('karakterler_numaralar\3.bmp');four=imread('karakterler_numaralar\4.bmp');
five=imread('karakterler_numaralar\5.bmp'); six=imread('karakterler_numaralar\6.bmp');
seven=imread('karakterler_numaralar\7.bmp');eight=imread('karakterler_numaralar\8.bmp');
nine=imread('karakterler_numaralar\9.bmp'); zero=imread('karakterler_numaralar\0.bmp');
%*-*-*-*-*-*-*-*-*-*-*-
letter=[A B C D E F G H I J K L M...
    N O P Q R S T U V W X Y Z];
number=[one two three four five...
    six seven eight nine zero];
character=[letter number];
templates=mat2cell(character,42,[24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 24]);
save ('templates','templates')
clear all
