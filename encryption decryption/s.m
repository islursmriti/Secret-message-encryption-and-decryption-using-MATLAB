FID = fopen('myfile.txt','rb');
Str = fread(FID, [1, inf], 'char');
fclose(FID);
Str=uint16(Str);
x=imread('original.png');
x=uint16(x);
[x_row,x_col]=size(x);

c=numel(Str);
a=1;

for i=1:x_row
    for j=1:x_col
        if(a<=c)
            
            if(x(i,j)+Str(a)>255)
                temp=x(i,j)+Str(a)-256;
            else
                 temp=x(i,j)+Str(a);
                 
            end
            z(i,j)=uint8(temp);
        else
            z(i,j)=uint8(x(i,j));
            
        end
        a=a+1;
    end
end
imwrite(z,'encrypted.png'); 
x=uint16(x);