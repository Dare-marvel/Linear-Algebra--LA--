clear 
clc
atomsLoad('casci')
data=csvRead("C:\Users\Talha\OneDrive\Documents\College\LA\Exp3\GSS2012a.csv",',','.','string')
[row,col]=size(data)

find='accntsci'
index=-1

for i=1:col do
    if strcmp(find,data(1,i))==0 then
        index=i
        break
    end
end

if index==-1 then
    disp('col not found')
    quit
end

sci=data(2:$,index)
[row,col]=size(sci)

for i=1:row
    if strcmp(sci(i),'')==0 then
        nan_index(i)=%F
    elseif strcmp(sci(i),'Very scientific')==0 
        sci(i)='1'
        nan_index(i)=%t
    elseif strcmp(sci(i),'Pretty scientific')==0 
        sci(i)='2'
        nan_index(i)=%t
    elseif strcmp(sci(i),'Not too scientific')==0 
        sci(i)='3'
        nan_index(i)=%t
    elseif strcmp(sci(i),'Not scientific at all')==0 
        sci(i)='4'
        nan_index(i)=%t
    end 
end

sci=sci(nan_index)
sci=strtod(sci)
disp(sci)


freq_=zeros(1,4)

[row,col]=size(sci)
for i=1:row
    if sci(i)==1 then
        freq_(1)=freq_(1)+1
    elseif sci(i)==2 then
        freq_(2)=freq_(2)+1
    elseif sci(i)==3 then
        freq_(3)=freq_(3)+1
    elseif sci(i)==4 then
        freq_(4)=freq_(4)+1
    end
end

disp(freq_)


m=median(sci)

if m==1 then
    disp('median(more than 50%) opinion is that acc is very scientific')
elseif m==2 then
    disp('median(more than 50%) opinion is that acc is pretty scientific')
elseif m==3 then
    disp('median(more than 50%) opinion is that acc is not too scientific')
elseif m==4 then
    disp('median(more than 50%) opinion is that acc is not scientific at all')
end

n=sum(freq_)

H0='People feel that accounting is pretty scientific i.e median=pretty scientific'
Ha='People feel that accounting is not in the pretty scientific bracket i.e median != pretty scientific'

hypothesize_median=2
n_minus=sum(freq_(1:hypothesize_median-1))
n_plus=sum(freq_(hypothesize_median:$))

p=2*(cdfbinomial(min(n_minus,n_plus),n,0.5))
disp(p)


alpha=0.05
if p<alpha then
    disp('As p value of '+string(p)+' is less than 0.05(significance level) The result is statically significant.')
    disp('Reject null hypothesis: '+Ha)
else
    disp('As p value of '+string(p)+' is greater than 0.05(significance level i decided) The result is statically insignificant ')
    disp('Fail to reject null hypothesis: '+H0)
end


//for hypothesid median between pretty scientific and not too scientific

H0='People feel that accounting is between pretty scientific and not too scientific '
Ha='People feel that accounting is not between the pretty scientific bracket and not too scientifc bracket'

n_minus=sum(freq_(1:2))
n_plus=sum(freq_(3:$))

p=2*(cdfbinomial(min(n_minus,n_plus),n,0.5))
disp(p)


alpha=0.05
if p<alpha then
    disp('As p value of '+string(p)+' is less than 0.05(significance level) The result is statically significant.')
    disp('Reject null hypothesis: '+Ha)
else
    disp('As p value of '+string(p)+' is greater than 0.05(significance level i decided) The result is statically insignificant ')
    disp('Fail to reject null hypothesis: '+H0)
end



