function [fl re]=lines(metinim)
% Metni sat�rlara b�l
% metinim->input image; fl->ilk sat�r; re->kalan sat�rlar
% �RNEK:
% metinim=imread('TEST_3.jpg');
% [fl re]=lines(metinim);
% subplot(3,1,1);imshow(metinim);title('G�R�� RESM�')
% subplot(3,1,2);imshow(fl);title('�LK SATIR')
% subplot(3,1,3);imshow(re);title('KALAN SATIRLAR')
metinim=clip(metinim);
num_filas=size(metinim,1);
for s=1:num_filas
    if sum(metinim(s,:))==0
        nm=metinim(1:s-1, :); % �lk sat�r matrixi
        rm=metinim(s:end, :);% Kalan sat�r matrixleri
        fl = clip(nm);
        re=clip(rm);
        %*-*-*Sonucu g�rmek i�in a�a��daki uncomment sat�rlar�*-*-*-*-
                 subplot(2,1,1);imshow(fl);
                 subplot(2,1,2);imshow(re);
        break
    else
        fl=metinim;%Sadece bir sat�r.
        re=[ ];
    end
end

function img_out=clip(img_in)
[f c]=find(img_in);
img_out=img_in(min(f):max(f),min(c):max(c));%resmi kes