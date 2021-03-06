%Configuration 601:
%Z (R +jX) in ohms per mile
%  0.3465  1.0179   0.1560  0.5017   0.1580  0.4236
%                   0.3375  1.0478   0.1535  0.3849
%                                    0.3414  1.0348
z601=[0.3465+1.0179j 0.1560+0.5017j 0.1580+0.4236j;0.1560+0.5017j 0.3375+1.0478j 0.1535+0.3849j;0.1580+0.4236j 0.1535+0.3849j 0.3414+1.0348j];

%Adapta��o para seq pos, neg e zero serem perfeitamente desacopladas
%Configuration 601:
%Z (R +jX) in ohms per mile
%  0.34  1.04   0.15  0.4   0.15  0.4
%                   0.34  1.04   0.15  0.4
%                                    0.34  1.04
 za601=[0.34+1.04j 0.15+0.4j 0.15+0.4j;0.15+0.4j 0.34+1.04j 0.15+0.4j;0.15+0.4j 0.15+0.4j 0.34+1.04j];
 
 
%Configuration 602:
%Z (R +jX) in ohms per mile
% 0.7526  1.1814   0.1580  0.4236   0.1560  0.5017
%                  0.7475  1.1983   0.1535  0.3849
%                                   0.7436  1.2112
z602=[0.7526+1.1814j 0.1580+0.4236j 0.1560+0.5017j;0.1580+0.4236j 0.7475+1.1983j 0.1535+0.3849j;0.1560+0.5017j 0.1535+0.3849j 0.7436+1.2112j];

%Configuration 603:
%Z (R +jX) in ohms per mile
%  0.0000  0.0000   0.0000  0.0000   0.0000  0.0000
%                   1.3294  1.3471   0.2066  0.4591
%                                    1.3238  1.3569
z603=[0 0 0;0 1.3295+1.3471j 0.2066+0.4591j;0 0.2066+0.4591j 1.3238+1.3569j];

%Configuration 604:
%Z (R +jX) in ohms per mile
%  1.3238  1.3569   0.0000  0.0000   0.2066  0.4591
%                   0.0000  0.0000   0.0000  0.0000
%                                    1.3294  1.3471
 z604=[1.3238+1.3569j 0 0.2066+0.4591j;0 0 0;0.2066+0.4591j 0 1.3294+1.3471j];
 
%Configuration 605:
%Z (R +jX) in ohms per mile
%  0.0000  0.0000   0.0000  0.0000   0.0000  0.0000
%                   0.0000  0.0000   0.0000  0.0000
%                                    1.3292  1.3475
z605=[0 0 0;0 0 0;0 0 1.3291+1.3275j];

%Configuration 606:
%Z (R +jX) in ohms per mile
% 0.7982  0.4463   0.3192  0.0328   0.2849 -0.0143
%                  0.7891  0.4041   0.3192  0.0328
%                                   0.7982  0.4463
z606=[0.7982+0.4463j 0.3192+0.0328j 0.2849-0.0143j;0.3192+0.0328j 0.7891+0.4041j 0.3192+0.0328j;0.2849-0.0143j 0.3192+0.0328j 0.7982+0.4463j];

%Configuration 607:
%Z (R +jX) in ohms per mile
%  1.3425  0.5124   0.0000  0.0000   0.0000  0.0000
%                   0.0000  0.0000   0.0000  0.0000
%                                    0.0000  0.0000
z607=[1.3425+0.5124j 0 0;0 0 0;0 0 0];

T=[1 1 1;exp(j*pi*2/3)^2 exp(j*pi*2/3) 1;exp(j*pi*2/3) exp(j*pi*2/3)^2 1];
invT=inv(T);
Zs606=invT*z601*T

%%
%equivalente sistema
S3feq=75.558+192.9996j; %MVA
S1feq=56.981+139.6973j; %MVA
Sb=100; %MVA
z_pos_sistema=Sb/S3feq;
z_zero_sistema=(3*(Sb/S1feq))-(2*(Sb/S3feq));

%%
%equivalente sistema arquivo source
% Zpositive = 1.5 + j11.6 ohms;
% Zzero = 4.8 + j21.1 ohms;
z_pos_sistema2=(1.5+11.6j)*100/(115^2);
z_zero_sistema2=(4.8+21.1j)*100/(115^2);

%%
Vpos=0.6420*exp(deg2rad(0.6)*j);
Vneg=0.3581*exp(deg2rad(179)*j);
Vzero=0.2843*exp(deg2rad(-177.5)*j);

A=T*[Vpos;Vneg;Vzero]
[abs(A) radtodeg(angle(A))]

%%
Ia=10
Ib=10*exp(deg2rad(250)*j)
Ic=10*exp(deg2rad(110)*j)
A=inv(T)*[Ia;Ib;Ic]
[abs(A) radtodeg(angle(A))]

%%
Ia=0
Ib=4.6587*exp(deg2rad(-176.5)*j)
Ic=4.6587*exp(deg2rad(3.5)*j)
A=inv(T)*[Ia;Ib;Ic]
[abs(A) radtodeg(angle(A))]
%%
Ipos=0.5472*exp(deg2rad(-90)*j);
Ineg=0.5472*exp(deg2rad(-90)*j);
Izero=0.5472*exp(deg2rad(-90)*j);

A=T*[Ipos;Ineg;Izero]
[abs(A) radtodeg(angle(A))]
%%
Ipos=0.5472*exp(deg2rad(-60)*j);
Ineg=0.5472*exp(deg2rad(-120)*j);
Izero=0*exp(deg2rad(0)*j);

A=T*[Ipos;Ineg;Izero]
[abs(A) radtodeg(angle(A))]