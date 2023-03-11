clc
clear all
close all
warning off
%========================================================
%------- Perekaman Suara ----------
% Fs=2000;%Sampling frequency in hertz
% ch=1;%Number of channels--2 options--1 (mono) or 2 (stereo)
% datatype='uint8';
% nbits=16;%8,16,or 24 BitsperSample
% nseconds=1;%panjang durasi
% %--------- mulai rekaman ---------
% recorder=audiorecorder(Fs,nbits,ch);
% disp('Mulai merekam...')
% %------- proses rekaman -----
% recordblocking(recorder,nseconds);
% disp('Rekaman berhenti.');
% %-------- simpan sinyal audio dalam numerik -------
% x=getaudiodata(recorder,datatype);
% %-------- menyimpan file audio ----------
% audiowrite('test.wav',x,Fs);
%----------- rekaman selesai ------------
%========================================================
[x1,fs1]=audioread('test.wav');
t = 0:1/fs1:(length(x1)-1)/fs1;
subplot(2,2,1);
plot(t,x1,'b');
title('Sinyal Original')
subplot (2,2,2);
plot(t,x1,'b');
hold on
stem(t,x1,'r');
hold off
title('Sampling sinyal Original')
%===================[Kuantisasi]========================
lev = [-1:.02:1];
c = [-1.02:.02:1];
[index,x2] = quantiz(x1,lev,c);
t2 = 0:1/fs1:(length(x1)-1)/fs1;
subplot(2,2,3);
plot(t2,x2,'g');
title('Sinyal di Kuantisasi')
%====================[Sampling]==========================
subplot(2,2,4);
plot(t2,x2,'g');
hold on
stem(t2,x2,'r');
title('Sampling sinyal yang dikuantisasi')
%==================[Pengkodean]==========================
wavbinary = dec2bin( typecast( single(x2), 'uint8'), 8 ) - '0';
mod(wavbinary, 2)
%=======================[End]============================
