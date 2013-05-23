function[result]=knnclassify(cepstrum, dir_to_go)
    switch dir_to_go
        case 1
            cd audio1
        case 10
            cd audio10
        otherwise
            cd audio175
    end
    results=[];
    all_classes=[]; %Number
    directory=dir;
    for i=3:length(dir) %For every folders
        cd (directory(i).name); %Go into the folder
        file_directory=dir;
        for j=3:length(dir)% For every file
            file_directory(j).name;
            file_data=wavread(file_directory(j).name); % Read the data from the file
            [ceps,freqresp,fb,fbrecon,freqrecon] = mfcc(file_data,12000,100); %Get the MFCC
            temp=sqrt(sum(sum((cepstrum-fb).^2))); %%Euclidian distance
            results=[results;temp];
            all_classes=[all_classes;i-3];        
        end
        cd ..;
    end
    [y,i]=sort(results); %I is the best values in sorted order
    cd ..;
    length(all_classes); %length of all the files combined
    if (length(all_classes)>111)
           counter=[];
           for index=1:175 %For the 175 best files
               switch all_classes(i(index)) %Get the best file, then second best match, etc
                   case 0
                       counter=[counter;0];
                   case 1
                       counter=[counter;1];
                   case 2
                       counter=[counter;2];
                   case 3
                       counter=[counter;3];
                   case 4
                       counter=[counter;4];
                   case 5
                       counter=[counter;5];
                   case 6
                       counter=[counter;6];
                   case 7
                       counter=[counter;7];
                   case 8
                       counter=[counter;8];
                   case 9
                       counter=[counter;9];
                   case 10
                       counter=[counter;10];
               end
           end
           result=mode(counter);    
        
    elseif (length(all_classes)==110) %If audio10
        counter=[];
        for index=1:10 %Get the 10 best files
               switch all_classes(i(index)) %Get the best file, then second best match, etc
                   case 0
                       counter=[counter;0];
                   case 1
                       counter=[counter;1];
                   case 2
                       counter=[counter;2];
                   case 3
                       counter=[counter;3];
                   case 4
                       counter=[counter;4];
                   case 5
                       counter=[counter;5];
                   case 6
                       counter=[counter;6];
                   case 7
                       counter=[counter;7];
                   case 8
                       counter=[counter;8];
                   case 9
                       counter=[counter;9];
                   case 10
                       counter=[counter;10];
               end
        end
           result=mode(counter);         
    else %If one
        result=all_classes(i(1)); %Pop the top
    end
    return;    
end

