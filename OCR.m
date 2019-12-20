% TEMEL PROGRAM
warning off %#ok<WNOFF>
% Clear all
clc, close all, clear all
% RESM� OKU
imagen=imread('resim3.jpg');
% RESM� G�STER
figure(1);
imshow(imagen);
%RES�M BA�LI�I EKLE
title('OR�J�NAL RES�M')
%RESM�N MET�N(ALTYAZI) KISMINI KES
imagen = imcrop(imagen,[0, 567, 1280, 79]);
figure(2);
imshow(imagen);
title('KIRPILMI� RES�M');
% RESM� GRAY SCALE �EV�R
if size(imagen,3)==3 %RGB RES�M �SE
    imagen=rgb2gray(imagen);
    figure(3);
    imshow(imagen);
end
%RESM� TERSLEME
imagen = imadjust(imagen, [0 1], [1 0]);
figure(4);
imshow(imagen);
% BW D�N��T�R
threshold = graythresh(imagen);
imagen =~im2bw(imagen,threshold);
figure(5);
imshow(imagen);
% 30 pikselden az i�eren t�m nesneleri kald�r
imagen = bwareaopen(imagen,30);
%Resimdeki kelimeyi matrisel olarak depola
word=[ ];
re=imagen;
%metin.txt dosyas�n� yazmak i�in a�
fid = fopen('metin.txt', 'wt');
% �ablonlar� y�kle
load templates
global templates
% �ablon dosyas�ndaki harf say�s�n� hesapla
numaralar_karakterler=size(templates,2);
fprintf('harf say�s� = %d\n', numaralar_karakterler);
while 1
    %Fcn 'lines' metinde ayr� sat�rlar
    [fl re]=lines(re);
    imgn=fl;
    %Sat�rlar� birer birer g�rmek i�in a�a��daki uncomment sat�r�
    %imshow(fl);pause(0.5)    
    %-----------------------------------------------------------------     
    % Ba�l� bile�enleri etiketleyin ve say�n
    [L Ne] = bwlabel(imgn);    
    for n=1:Ne
        [r,c] = find(L==n);
        % Harf ay�kla
        n1=imgn(min(r):max(r),min(c):max(c));  
        %Karakteri yeniden boyutland�r (ayn� boyutta �ablon)
        img_r=imresize(n1,[42 24]);
        %Harfleri birer birer g�rmek i�in a�a��daki sat�r� gir
        %imshow(img_r);pause(0.5)
        %-------------------------------------------------------------------
        %Resmi metne d�n��t�rmek i�in fcn'yi �a��r�n
        letter=read_letter(img_r,numaralar_karakterler);
        % Harf biti�tirme
        word=[word letter];
    end
    %fprintf(fid,'%s\n',lower(word));%metin dosyas�na k���k harfle yazmak i�in
    fprintf(fid,'%s\n',word);%metin dosyas�na b�y�k harfle yazmak i�in
    word=[ ];
    %*C�mleler bitti�inde, d�ng�y� keser.
    if isempty(re)  %Fcn 'sat�rlar�nda' re 'de�i�kenine bak�n�z.
        break
    end    
end
fclose(fid);
%'Metin.txt' dosyas�n� a�
winopen('metin.txt')
clear all