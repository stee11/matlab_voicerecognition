%Steven Kolln

%Use this function in a while loop to perform many voice recordings for
%faster recording

function [ceps]=recordSound(userInput)
%userInput=input('Enter a number 0-10 for which number to say: ');
voice=audiorecorder;%Stores audiorecorder object
%Callback functions to help guide user.
voice.StartFcn='disp(''The timer has started. Say your word.'')';
voice.StopFcn='disp(''The timer has ended. Here is your sound.'')';
record(voice, 1); 
pause(1);
%play(voice);
audioData=getaudiodata(voice);
%plot(audioData);
cd('audio');
filename='';
%This switch determines where to put file and the file number and name
switch userInput
    case 0
        cd('0');
        myDir=dir;
        number=length(myDir);
        number=number-1;
        numString=num2str(number);
        filename=strcat('zero',numString,'.wav');
    case 1
        cd('1');
        myDir=dir;
        number=length(myDir);
        number=number-1;
        numString=num2str(number);
        filename=strcat('one',numString,'.wav');
    case 2
        cd('2');
        myDir=dir;
        number=length(myDir);
        number=number-1;
        numString=num2str(number);
        filename=strcat('two',numString,'.wav');
    case 3
        cd('3');
        myDir=dir;
        number=length(myDir);
        number=number-1;
        numString=num2str(number);
        filename=strcat('three',numString,'.wav');
    case 4 
        cd('4');
        myDir=dir;
        number=length(myDir);
        number=number-1;
        numString=num2str(number);
        filename=strcat('four',numString,'.wav');
    case 5
        cd('5');
        myDir=dir;
        number=length(myDir);
        number=number-1;
        numString=num2str(number);
        filename=strcat('five',numString,'.wav');
    case 6
        cd('6');
        myDir=dir;
        number=length(myDir);
        number=number-1;
        numString=num2str(number);
        filename=strcat('six',numString,'.wav');
    case 7
        cd('7');
        myDir=dir;
        number=length(myDir);
        number=number-1;
        numString=num2str(number);
        filename=strcat('seven',numString,'.wav');
    case 8
        cd('8');
        myDir=dir;
        number=length(myDir);
        number=number-1;
        numString=num2str(number);
        filename=strcat('eight',numString,'.wav');
    case 9
        cd('9');
        myDir=dir;
        number=length(myDir);
        number=number-1;
        numString=num2str(number);
        filename=strcat('nine',numString,'.wav');
    case 10
        cd('10');
        myDir=dir;
        number=length(myDir);
        number=number-1;
        numString=num2str(number);
        filename=strcat('ten',numString,'.wav');
    otherwise
        cd('test');
        myDir=dir;
        number=length(myDir);
        number=number-1;
        numString=num2str(number);
        filename=strcat('test',numString,'.wav');
end
audiowrite(filename, audioData, 8000); %8,000 is the sample rate.
cd('..');
cd('..');
[ceps,freqresp,fb,fbrecon,freqrecon] = mfcc(audioData,12000,100);
%imagesc(flipud(freqresp));
%imagesc(flipud(fbrecon));
return 
end


