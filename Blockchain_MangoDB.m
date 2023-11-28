global A;

fileID = fopen('newfile.txt','w');
nbytes = fprintf(fileID,'%5d %5d %5d %5d\n',A);
fclose(fileID);