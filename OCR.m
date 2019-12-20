% TEMEL PROGRAM
warning off %#ok<WNOFF>
% Clear all
clc, close all, clear all
% RESMÝ OKU
imagen=imread('resim3.jpg');
% RESMÝ GÖSTER
figure(1);
imshow(imagen);
%RESÝM BAÞLIÐI EKLE
title('ORÝJÝNAL RESÝM')
%RESMÝN METÝN(ALTYAZI) KISMINI KES
imagen = imcrop(imagen,[0, 567, 1280, 79]);
figure(2);
imshow(imagen);
title('KIRPILMIÞ RESÝM');
% RESMÝ GRAY SCALE ÇEVÝR
if size(imagen,3)==3 %RGB RESÝM ÝSE
    imagen=rgb2gray(imagen);
    figure(3);
    imshow(imagen);
end
%RESMÝ TERSLEME
imagen = imadjust(imagen, [0 1], [1 0]);
figure(4);
imshow(imagen);
% BW DÖNÜÞTÜR
threshold = graythresh(imagen);
imagen =~im2bw(imagen,threshold);
figure(5);
imshow(imagen);
% 30 pikselden az içeren tüm nesneleri kaldýr
imagen = bwareaopen(imagen,30);
%Resimdeki kelimeyi matrisel olarak depola
word=[ ];
re=imagen;
%metin.txt dosyasýný yazmak için aç
fid = fopen('metin.txt', 'wt');
% Þablonlarý yükle
load templates
global templates
% Þablon dosyasýndaki harf sayýsýný hesapla
numaralar_karakterler=size(templates,2);
fprintf('harf sayýsý = %d\n', numaralar_karakterler);
while 1
    %Fcn 'lines' metinde ayrý satýrlar
    [fl re]=lines(re);
    imgn=fl;
    %Satýrlarý birer birer görmek için aþaðýdaki uncomment satýrý
    %imshow(fl);pause(0.5)    
    %-----------------------------------------------------------------     
    % Baðlý bileþenleri etiketleyin ve sayýn
    [L Ne] = bwlabel(imgn);    
    for n=1:Ne
        [r,c] = find(L==n);
        % Harf ayýkla
        n1=imgn(min(r):max(r),min(c):max(c));  
        %Karakteri yeniden boyutlandýr (ayný boyutta þablon)
        img_r=imresize(n1,[42 24]);
        %Harfleri birer birer görmek için aþaðýdaki satýrý gir
        %imshow(img_r);pause(0.5)
        %-------------------------------------------------------------------
        %Resmi metne dönüþtürmek için fcn'yi çaðýrýn
        letter=read_letter(img_r,numaralar_karakterler);
        % Harf bitiþtirme
        word=[word letter];
    end
    %fprintf(fid,'%s\n',lower(word));%metin dosyasýna küçük harfle yazmak için
    fprintf(fid,'%s\n',word);%metin dosyasýna büyük harfle yazmak için
    word=[ ];
    %*Cümleler bittiðinde, döngüyü keser.
    if isempty(re)  %Fcn 'satýrlarýnda' re 'deðiþkenine bakýnýz.
        break
    end    
end
fclose(fid);
%'Metin.txt' dosyasýný aç
winopen('metin.txt')
clear all