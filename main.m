%Steven Kolln 


%Don't forget to add the voicebox folder to the classpath
%For the function [ceps,freqresp,fb,fbrecon,freqrecon] = mfcc(audioData,12000,100);
%The parameters passed to the ‘mfcc.m’ are as follow: ceps – cepstrum coefficients, 
%freqresp – fast fourier transform, fb – converts to Mel-frequency scale, fbrecon – 
%converts to standard frequency scale, fre

function main()
    timer_length=1;
    which_knn=input('Would you like to use knn with 1, 10, or 175 files? Enter 1, 10, or 175: ');
    switch which_knn
        case 1
            cd audio1;
        case 10
            cd audio10;
        case 175
            cd audio175;
        otherwise
            cd audio175;
    end
    disp('Excluding the dots, here are the phrases you can say:');
    %Shows contents of folders
    ls;
    cd ..;
    %Callback functions to help guide user.
    voice.StartFcn='disp(''The timer has started. Say your word.'')';
    voice.StopFcn='disp(''The timer has ended. Here is your sound.'')';
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    while (true)
        input('When you hit enter. Say a phrase');
        voice=audiorecorder;%Stores audiorecorder object
        record(voice, timer_length); 
        pause(timer_length);
        audioData=getaudiodata(voice);
        %The ceps of the sound the user just created.
        [ceps,freqresp,fb,fbrecon,freqrecon] = mfcc(audioData,12000,100);
        if (length(fb)==61)
            break;
        end
    end
    input('Press a key to hear voice then preform a knn & bayes.');
    play(voice);
    pause(timer_length);
    tic;
    knn_result=knnclassify(fb, which_knn)
    toc;
    return 
end
