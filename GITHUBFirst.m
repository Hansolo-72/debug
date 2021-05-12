% clc;
clear all;
% close all;
ds=0.1; %length of every single node
rho=5; %density of polymer
a0=0.02; %initial diameter of nozzle
% format longEng

strp='C:\Users\Dell\Desktop\DP-SP Projects\postprocessing codes\JETSPIN DATA_static collector\';

 
str='';
extstr='xlsx';

%     for i=2011:1:2013
%         file{i}=xlsread([num2str(i) '.xlsx']);
%     end

first=1;
% last=176;
last=2;
rbc=0; rbcn=0; loop_theta=0;

for i1= first:last
%     i2=i1+1;

%     str1 = ' '; str2 = [str, num2str(str1), num2str(i1)];
   
    file{i1}=xlsread([str,num2str(i1) '.xlsx'])
   
end % test-delete

%     load POLYMERJET

for j=first:last
    arb=file{1,j}
    b1=arb(:,1);
    b2=arb(:,2);
    b3=arb(:,3);
    
    temp1=arb(:,1);
    temp2=arb(:,2);
    temp3=arb(:,3);
    
    
    deltat = arb(:,6);
    
    w  = 3;
    cd = 0.1025799243;
    r =0.2;
    c=cd+r;
    %xprime= zeros(1001,1);
    %yprime = zeros(1001,1);
    for i=1:1000
        
        b2(i) = b2(i) + 1*(j-1);
        
        if (temp1(i)==cd)
            
        b3(i) = r/(1+((temp1(i)-c)/temp3(i))^2)^0.5;
            if(b3(i)*temp3(i)<0) 
                b3(i) = -1*b3(i);
            end
            b1(i) = (b3(i)*(temp1(i)-c)+temp3(i)*c)/temp3(i);
            %if(temp3(i)==0)b3(i)=0; b1(i)=cd;end
           r1=-w/100;r2=-r1; 
         %M = rand(r1,r2);
         random=rand;
         X = (r2-r1)*random + r1;
         
         %disp("X="+X);
         %disp("random"+random);
        add =0.06/X;
        
        if(add>0.06/abs(r1)||add<-0.06*abs(r1))
            add = (X/abs(X))*0.06/r1;
        end
        
        b2(i)= b2(i)+ add;
        
        end
        
    end
    
    for i=1:1001
        if (temp1(i)== cd)
             theta = atand(b3(i)/(c-b1(i)));
             b1(i) = cd+r*(1-cosd(theta+w*deltat(i)));   
             b3(i) = r*sind(theta + w*deltat(i));
        end
    end
   
    %dia= rand(length(b1))
    dia= arb(:,4)*2;

figure(1060), hold on, plot3(b1,b2,b3,'color',rand(1,3),'Linewidth',2)
xlabel('X')
ylabel('Y')
zlabel('Z')
grid on, box on
view(3), view(58,38)

[cheese_x,cheese_y,cheese_z]=architecture_3d([b1';b2';b3'],dia,50);

figure(1000), hold on, surf(cheese_x,cheese_y,cheese_z), shading interp,view(18,68),box on, grid on
xlabel('X'),ylabel('Y'),zlabel('Z')

clear arb
clear b1
clear b2
clear b3
end

% figure(300), hold on, plot3(b2(:,2),b2(:,3),1-b2(:,1),'color',rand(1,3),'Linewidth',1.5)
 
% [d1 d2]=size(arb);    
%
% b4=ones(d1,3);
%
% b3=b2;
% rbc=rbc+1;
% arbcount(rbc)=d1;


% xc=b2(:,2);


% yc=b2(:,3);
% % zc=1-b2(:,1);
% zc=1-b3(:,1);
%
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
% view(3), view(58,38)
% % figure(1070), hold on, plot3(b2(:,2),b2(:,3),1-b3(:,1),'color',rand(1,3),'Linewidth',1.5)
% figure(300), hold on, plot3(b2(:,2),b2(:,3),1-b3(:,1),'color',rand(1,3),'Linewidth',1.5)
%
% view(3), view(58,38)
%
%
% % c = 1:d1;      %# colors
% % h = surface([xc(:), xc(:)], [yc(:), yc(:)], [zc(:), zc(:)], ...
% %     [1-zc(:), 1-zc(:)], 'EdgeColor','flat', 'FaceColor','none','Linewidth',1.5);
% % colormap(jet(numel(zc))), colorbar
% % % plot3(x,y,z,'marker','.','markeredgecolor',z)
% % view(3)
% end;
%
%
% %        len=size(arbit);
% %        for i=1:len(1)
% %            
% %             b1(i,1)=arbit(i,1);
% %              b2(i,1)=arbit(i,2);
% %                 b3(i,1)=arbit(i,3);
% %        end
% %                
% % %              b2(i,:)=b1(:);
% % %             b3(i,:)=b1(:);
% %        
% %         figure(300), hold on, plot3(b1(:),b2(:),b3(:),'color',rand(1,3),'Linewidth',2)
% %
% %         view(3), view(58,38)
%
%
%        
%
%
%         

