function [fl re]=lines(metinim)
% Metni satýrlara böl
% metinim->input image; fl->ilk satýr; re->kalan satýrlar
% ÖRNEK:
% metinim=imread('TEST_3.jpg');
% [fl re]=lines(metinim);
% subplot(3,1,1);imshow(metinim);title('GÝRÝÞ RESMÝ')
% subplot(3,1,2);imshow(fl);title('ÝLK SATIR')
% subplot(3,1,3);imshow(re);title('KALAN SATIRLAR')
metinim=clip(metinim);
num_filas=size(metinim,1);
for s=1:num_filas
    if sum(metinim(s,:))==0
        nm=metinim(1:s-1, :); % Ýlk satýr matrixi
        rm=metinim(s:end, :);% Kalan satýr matrixleri
        fl = clip(nm);
        re=clip(rm);
        %*-*-*Sonucu görmek için aþaðýdaki uncomment satýrlarý*-*-*-*-
                 subplot(2,1,1);imshow(fl);
                 subplot(2,1,2);imshow(re);
        break
    else
        fl=metinim;%Sadece bir satýr.
        re=[ ];
    end
end

function img_out=clip(img_in)
[f c]=find(img_in);
img_out=img_in(min(f):max(f),min(c):max(c));%resmi kes