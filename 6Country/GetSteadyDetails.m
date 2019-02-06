function [ MaxJPResids, JP_, WD1_, WW1_, WT1_ ,WNT1_ ,WSW1_ ,WST1_ ,WSNT1_, SOC] = GetSteadyDetails( InVec, lambda, eta, phiR, zetaR, gamma, scriptp, scriptq, alphaCP, alphaCD, alphah, alphaKP, alphaD, alphaND, alphaHP, alphaHW, alphaHL, alphaK, alphaKL, alphaHLX, alphaY, betabarl, sigma, xi, bbeta, varrhoC, eC, varrhoCP, eCP, varrhoCD, nuW, nuT, nuNT, nuSW, nuST, nuSNT, nuD, nuNDCG, rhoQB, thetaDU0, thetaDU1, tauCG_, tauD_, tauLa_, tauLb_, Omegah_, OmegaCP_, OmegaC_, OmegaD_, OmegaND_, OmegaCG_, OmegaY_, GN_, Z_, deltaItilde_, scriptFI_, deltaD_, kappaT_, kappaNT_, kappaW_, kappaST_, kappaSNT_, kappaSW_, kappaD_, kappaNDCG_, betabarb, m_, varpi_, Ntilde1_)
LW1l_ = exp( InVec( 1+(1-1)*28 ) );
LT1l_ = exp( InVec( 2+(1-1)*28 ) );
LNT1l_ = exp( InVec( 3+(1-1)*28 ) );
LSW1l_ = exp( InVec( 4+(1-1)*28 ) );
LST1l_ = exp( InVec( 5+(1-1)*28 ) );
LSNT1l_ = exp( InVec( 6+(1-1)*28 ) );
LNDCG1l_ = exp( InVec( 7+(1-1)*28 ) );
Lh1l_ = exp( InVec( 8+(1-1)*28 ) );
CD1l_ = exp( InVec( 9+(1-1)*28 ) );
CND1l_ = exp( InVec( 10+(1-1)*28 ) );
LNDCG1b_ = exp( InVec( 11+(1-1)*28 ) );
Lh1b_ = exp( InVec( 12+(1-1)*28 ) );
CD1b_ = exp( InVec( 13+(1-1)*28 ) );
CND1b_ = exp( InVec( 14+(1-1)*28 ) );
LND1_ = exp( InVec( 17+(1-1)*28 ) );
LCG1_ = exp( InVec( 18+(1-1)*28 ) );
P1_ = exp( InVec( 26+(1-1)*28 ) );
alphaHG = alphaHP;
alphaKG = alphaKP;
alphaCG = alphaND;
tt3 = (alphaK * alphaY);
tt4 = (tt3 * alphaHG);
tt6 = (alphaHW * alphaKG * alphaKL);
tt10 = (alphaHW * alphaKL * alphaKP);
tt13 = (alphaY * alphaHG);
tt15 = (alphaHLX * alphaHP);
tt16 = (tt15 * alphaHW);
tt21 = (alphaK * alphaHG);
tt26 = (alphaHW ^ 2);
tt31 = (alphaY * alphaHL);
tt33 = (alphaKG * alphaKL);
tt35 = (alphaKL * alphaKP);
tt37 = (alphaK * alphaHW);
tt44 = 2 * tt4 * tt6 - 2 * tt4 * tt10 - 2 * tt13 * alphaHL * tt16 + tt3 * tt6 - tt3 * tt10 - 2 * tt21 * tt6 + 2 * tt21 * tt10 - tt13 * alphaHLX * tt26 + 2 * tt13 * tt10 - tt31 * tt16 - tt3 * tt33 + tt3 * tt35 - tt37 * tt33 + tt37 * tt35 + tt13 * alphaHLX * alphaHW + tt13 * tt26 + tt31 * tt15;
tt45 = alphaY * alphaHLX;
tt47 = alphaY * alphaHW;
tt49 = alphaHW * alphaHG;
tt64 = alphaK * alphaKG * alphaKL - alphaK * alphaKL * alphaKP - alphaY * alphaKL * alphaKP + alphaY * tt26 - tt13 * alphaHW - tt45 * tt26 + tt47 * tt35 - 2 * tt49 * tt35 + 2 * tt45 * alphaHW + alphaY - tt10 + tt35 - tt45 - 2 * tt47 + 2 * tt49 + alphaHW - 1;
b_ = (-1 + alphaHLX) * alphaY / (tt44 + tt64) * (tt49 + alphaHW - 1) * (-1 + alphaHW);
c_ =b_*alphaHG/(1-alphaHW-alphaHW*alphaHG);
d_ =(b_-c_*alphaHW)/(1-alphaHW);
a_ = b_+1;
CND1_ = CND1b_ + CND1l_;
N1b_ = 100*Ntilde1_ * varpi_;
N1l_ = 100*Ntilde1_ * (1-varpi_);
Y1_ = OmegaY_ *Ntilde1_ /Ntilde1_;
YND1_ = ( CND1_ / OmegaND_ / LND1_ ^ ( 1 - alphaND ) ) ^ ( 1 / alphaND );
PND1_DIVIDEDP1_ = YND1_ / CND1_ / alphaND;
PND1_ = PND1_DIVIDEDP1_ * P1_;
beta1b_ = betabarb - bbeta * log( CND1_ * PND1_DIVIDEDP1_ / Y1_ );
beta1l_ = betabarl - bbeta * log( CND1_ * PND1_DIVIDEDP1_ / Y1_ );
YCG1_ = tauCG_ * alphaCG * Y1_;
CG1_ = OmegaCG_ * YCG1_ ^ alphaCG * LCG1_ ^ ( 1 - alphaCG );
[ JP_, MaxJPResids ] = GetJPSlow( beta1l_, Z_, deltaItilde_, eta, gamma, lambda, phiR, scriptp, scriptq, zetaR, GN_, scriptFI_, sigma, xi, d_, b_, alphaND, alphaD, alphah, alphaCD, alphaCG, alphaCP );
SOC=JP_^3*gamma*eta^3*(JP_-1+eta)^3*lambda^3+2*eta^2*(JP_-1+eta)*((JP_^3+(2*eta-2)*JP_^2+3*(-1+eta)^2*JP_*(1/2)+(eta-1/2)*(-1+eta)^2)*gamma-(1/2)*(JP_-1+eta)*(JP_^2+(3*eta-3)*JP_+eta^2-3*eta+2))*JP_^2*lambda^2+eta*((JP_^2+(-1+eta)*JP_+(-1+eta)^2)*(JP_^3+(2*eta-2)*JP_^2+(-1+eta)^2*JP_+eta*(-1+eta)^2)*gamma-(2*(JP_^4+(4*eta-4)*JP_^3+(4*eta^2-9*eta+5)*JP_^2+(3*eta^3-8*eta^2+7*eta-2)*JP_+eta*(eta-2)*(-1+eta)^2))*(JP_-1+eta))*JP_*lambda-JP_^6+(-5*eta+5)*JP_^5+(-8*eta^2+17*eta-9)*JP_^4+(-8*eta^3+22*eta^2-20*eta+6)*JP_^3+(-7*eta^4+22*eta^3-22*eta^2+6*eta+1)*JP_^2-(3*(eta^2-(4/3)*eta-1))*(-1+eta)^3*JP_-(eta^2-eta-1)*(-1+eta)^4;
muP_ = lambda * eta * JP_ / ( JP_ - ( 1 - eta ) );
omegaP_ = JP_ * ( 1 - eta ) / ( JP_ - ( 1 - eta ) ) ^ 2 / ( 1 + muP_ );
scriptdP_ = 1 - omegaP_ / ( 1 + omegaP_ ) * ( lambda - muP_ ) * ( muP_ - eta * lambda ) / lambda / ( 1 - eta ) / muP_;
ScriptFRP_ = muP_ * scriptp / ( scriptdP_ - muP_ * scriptp * gamma ) / Z_;
GAs_ = ( 1 + gamma * Z_ * ScriptFRP_ ) ^ ( 1 / gamma );
gCG_ = GN_ * GAs_ ^ ( d_ * alphaCG );
gCND_ = GN_ * GAs_ ^ ( d_ * alphaND );
gD_ = GN_ * GAs_ ^ ( d_ * alphaD );
gCD_ = GN_ * GAs_ ^ ( d_ * alphaD * alphah );
gCDBar_ = gCD_ / gCND_;
gCP_ = gCDBar_ ^ alphaCD * gCND_;
gCPBar_ = gCP_ / gCG_;
gC_ = gCPBar_ ^ alphaCP * gCG_;
gCBar_ = gC_;
gV_ = gCBar_ * GN_ ^ ( xi / ( 1 - sigma ) - 1 );
glambda_C_ = GN_ ^ ( xi / ( 1 - sigma ) - 1 );
glambda_CPBar_ = gC_ / gCPBar_ * glambda_C_;
glambda_CP_ = glambda_CPBar_ / gCG_;
glambda_B_ = glambda_CP_ * GAs_ ^ ( alphaCD * ( d_ * alphaD * alphah - d_ * alphaND ) - a_ + d_ * alphaND );
glambda_GD_ = glambda_CP_ * GAs_ ^ ( alphaCD * ( d_ * alphaD * alphah - d_ * alphaND ) + d_ * alphaND - d_ * alphaD );
glambda_D_ = glambda_GD_;
CDBar1b_ = CD1b_ / CND1b_ * gCDBar_ ^ ( -varrhoCD / ( 1 - varrhoCD ) );
CP1b_ = N1b_ * OmegaCP_ * ( CDBar1b_ / gCDBar_ ) ^ alphaCD * ( alphaCD * ( CD1b_ / N1b_ / ( CDBar1b_ / gCDBar_ ) ) ^ ( ( eCP - 1 ) / eCP ) + ( 1 - alphaCD ) * ( CND1b_ / N1b_ ) ^ ( ( eCP - 1 ) / eCP ) ) ^ ( eCP / ( eCP - 1 ) );
CPBar1b_ = CP1b_ / CG1_ * ( N1b_ + N1l_ ) / N1b_ * gCPBar_ ^ ( -varrhoCP / ( 1 - varrhoCP ) );
C1b_ = N1b_ * OmegaC_ * ( CPBar1b_ / gCPBar_ ) ^ alphaCP * ( alphaCP * ( CP1b_ / N1b_ / ( CPBar1b_ / gCPBar_ ) ) ^ ( ( eC - 1 ) / eC ) + ( 1 - alphaCP ) * ( CG1_ / ( N1b_ + N1l_ ) ) ^ ( ( eC - 1 ) / eC ) ) ^ ( eC / ( eC - 1 ) );
CBar1b_ = N1b_ * ( C1b_ / N1b_ ) * ( gCBar_ / GN_ ) ^ ( -varrhoC / ( 1 - varrhoC ) );
CDBar1l_ = CD1l_ / CND1l_ * gCDBar_ ^ ( -varrhoCD / ( 1 - varrhoCD ) );
CP1l_ = N1l_ * OmegaCP_ * ( CDBar1l_ / gCDBar_ ) ^ alphaCD * ( alphaCD * ( CD1l_ / N1l_ / ( CDBar1l_ / gCDBar_ ) ) ^ ( ( eCP - 1 ) / eCP ) + ( 1 - alphaCD ) * ( CND1l_ / N1l_ ) ^ ( ( eCP - 1 ) / eCP ) ) ^ ( eCP / ( eCP - 1 ) );
CPBar1l_ = CP1l_ / CG1_ * ( N1b_ + N1l_ ) / N1l_ * gCPBar_ ^ ( -varrhoCP / ( 1 - varrhoCP ) );
C1l_ = N1l_ * OmegaC_ * ( CPBar1l_ / gCPBar_ ) ^ alphaCP * ( alphaCP * ( CP1l_ / N1l_ / ( CPBar1l_ / gCPBar_ ) ) ^ ( ( eC - 1 ) / eC ) + ( 1 - alphaCP ) * ( CG1_ / ( N1b_ + N1l_ ) ) ^ ( ( eC - 1 ) / eC ) ) ^ ( eC / ( eC - 1 ) );
CBar1l_ = N1l_ * ( C1l_ / N1l_ ) * ( gCBar_ / GN_ ) ^ ( -varrhoC / ( 1 - varrhoC ) );
VV1l_=beta1l_ * gV_ ^ -sigma;
VV1b_=beta1b_ * gV_ ^ -sigma;
Xi1_ = VV1l_ * glambda_B_;
Xi_ = Xi1_;
Q_ = Xi_;
lambda_F1_DIVIDEDlambda_B1b_ = ( Q_ - VV1b_ * glambda_B_ ) / ( 1 - VV1b_ * glambda_B_ * rhoQB );
DU1l_ = ( ( 1 - VV1l_ * glambda_D_ * ( 1 - deltaD_ ) ) / ( thetaDU0 / gD_ - VV1l_ * glambda_D_ * thetaDU0 / ( 1+thetaDU1 ) ) ) ^ ( 1 / ( 1+thetaDU1 ) );
DU1b_ = ( ( 1 - VV1b_ * glambda_D_ * ( 1 - deltaD_ ) - lambda_F1_DIVIDEDlambda_B1b_ * ( 1 - rhoQB ) * m_ / ( 1 + tauD_ ) ) / ( thetaDU0 / gD_ - VV1b_ * glambda_D_ * thetaDU0 / ( 1+thetaDU1 ) ) ) ^ ( 1 / ( 1+thetaDU1 ) );
D1b_ = ( CD1b_ / Lh1b_ ^ ( 1 - alphah ) / Omegah_ ) ^ ( 1 / alphah ) / DU1b_;
ID1b_ = ( D1b_ - D1b_ / gD_ * ( 1 - deltaD_ - thetaDU0 / ( 1 + thetaDU1 ) * DU1b_ ^ ( 1 + thetaDU1 ) ) );
D1l_ = ( CD1l_ / Lh1l_ ^ ( 1 - alphah ) / Omegah_ ) ^ ( 1 / alphah ) / DU1l_;
ID1l_ = ( D1l_ - D1l_ / gD_ * ( 1 - deltaD_ - thetaDU0 / ( 1 + thetaDU1 ) * DU1l_ ^ ( 1 + thetaDU1 ) ) );
ID1_ = ID1b_ + ID1l_;
WNDCG1_ = PND1_ * ( 1 - alphaND ) * CND1_ / LND1_;
tauLNDCG1_ = tauLa_ + tauLb_ * log( WNDCG1_ );
V1b_DIVIDEDU1b_ = ( ( 1 - beta1b_ ) * N1b_ ^ ( xi - 1 + sigma ) / ( 1 - beta1b_ * gV_ ^ ( 1 - sigma ) ) ) ^ ( 1 / ( 1 - sigma ) );
lambda_B1b_ = ( V1b_DIVIDEDU1b_ ) ^ sigma * ( 1 - beta1b_ ) * N1b_ ^ ( xi - 1 + sigma ) * kappaNDCG_ * ( LNDCG1b_ / N1b_ ) ^ nuNDCG * CBar1b_ / N1b_ / ( gCBar_ / GN_ ) / WNDCG1_ / ( 1 - tauLNDCG1_ );
V1l_DIVIDEDU1l_ = ( ( 1 - beta1l_ ) * N1l_ ^ ( xi - 1 + sigma ) / ( 1 - beta1l_ * gV_ ^ ( 1 - sigma ) ) ) ^ ( 1 / ( 1 - sigma ) );
lambda_B1l_ = ( V1l_DIVIDEDU1l_ ) ^ sigma * ( 1 - beta1l_ ) * N1l_ ^ ( xi - 1 + sigma ) * kappaNDCG_ * ( LNDCG1l_ / N1l_ ) ^ nuNDCG * CBar1l_ / N1l_ / ( gCBar_ / GN_ ) / WNDCG1_ / ( 1 - tauLNDCG1_ );
WDini1_ = (( ( 1 - tauLa_ ) ^ ( 1 / nuD ) * ( ( lambda_B1l_ / ( V1l_DIVIDEDU1l_ ) ^ sigma / ( 1 - beta1l_ ) / N1l_ ^ ( xi - 1 + sigma ) / ( CBar1l_ / gCBar_ / ( N1l_ / GN_ ) ) / kappaD_ ) ^ ( 1 / nuD ) * N1l_ + ( lambda_B1b_ / ( V1b_DIVIDEDU1b_ ) ^ sigma / ( 1 - beta1b_ ) / N1b_ ^ ( xi - 1 + sigma ) / ( CBar1b_ / gCBar_ / ( N1b_ / GN_ ) ) / kappaD_ ) ^ ( 1 / nuD ) * N1b_ ) * OmegaD_ / ID1_ / ( ( 1 - alphaD ) / alphaD ) ^ alphaD / P1_ ^ alphaD ) ^ ( -1 / ( alphaD + 1 / nuD ) ));
WDaux1_ = ( ( lambda_B1l_ / ( V1l_DIVIDEDU1l_ ) ^ sigma / ( 1 - beta1l_ ) / N1l_ ^ ( xi - 1 + sigma ) / ( CBar1l_ / gCBar_ / ( N1l_ / GN_ ) ) / kappaD_ ) ^ ( 1 / nuD ) * N1l_ + ( lambda_B1b_ / ( V1b_DIVIDEDU1b_ ) ^ sigma / ( 1 - beta1b_ ) / N1b_ ^ ( xi - 1 + sigma ) / ( CBar1b_ / gCBar_ / ( N1b_ / GN_ ) ) / kappaD_ ) ^ ( 1 / nuD ) * N1b_ ) * OmegaD_ / ID1_ / ( ( 1 - alphaD ) / alphaD ) ^ alphaD / P1_ ^ alphaD;
WD1_ = fzero( @(WD1_) real(WD1_ ^ ( -alphaD * nuD - 1 ) - ( 1 - tauLa_ - tauLb_ * log( WD1_ ) ) * WDaux1_ ^ nuD), WDini1_, optimset( 'display', 'off' ) );
WWini1_ = ( V1l_DIVIDEDU1l_ ) ^ sigma * ( 1 - beta1l_ ) * N1l_ ^ ( xi - 1 + sigma ) * kappaW_ * LW1l_ ^ nuW * CBar1l_ / N1l_ ^ ( 1 + nuW ) / ( gCBar_ / GN_ ) / lambda_B1l_ / ( 1 - tauLa_ );
WW1_ = fzero( @(WW1_) real(WW1_ - ( V1l_DIVIDEDU1l_ ) ^ sigma * ( 1 - beta1l_ ) * N1l_ ^ ( xi - 1 + sigma ) * kappaW_ * LW1l_ ^ nuW * CBar1l_ / N1l_ ^ ( 1 + nuW ) / ( gCBar_ / GN_ ) / lambda_B1l_ / ( 1 - tauLa_ - tauLb_ * log( WW1_ ) )), WWini1_, optimset( 'display', 'off' ) );
WTini1_ = ( V1l_DIVIDEDU1l_ ) ^ sigma * ( 1 - beta1l_ ) * N1l_ ^ ( xi - 1 + sigma ) * kappaT_ * LT1l_ ^ nuT * CBar1l_ / N1l_ ^ ( 1 + nuT ) / ( gCBar_ / GN_ ) / lambda_B1l_ / ( 1 - tauLa_ );
WT1_ = fzero( @(WT1_) real(WT1_ - ( V1l_DIVIDEDU1l_ ) ^ sigma * ( 1 - beta1l_ ) * N1l_ ^ ( xi - 1 + sigma ) * kappaT_ * LT1l_ ^ nuT * CBar1l_ / N1l_ ^ ( 1 + nuT ) / ( gCBar_ / GN_ ) / lambda_B1l_ / ( 1 - tauLa_ - tauLb_ * log( WT1_ ) )), WTini1_, optimset( 'display', 'off' ) );
WNTini1_ = ( V1l_DIVIDEDU1l_ ) ^ sigma * ( 1 - beta1l_ ) * N1l_ ^ ( xi - 1 + sigma ) * kappaNT_ * LNT1l_ ^ nuNT * CBar1l_ / N1l_ ^ ( 1 + nuNT ) / ( gCBar_ / GN_ ) / lambda_B1l_ / ( 1 - tauLa_ );
WNT1_ = fzero( @(WNT1_) real(WNT1_ - ( V1l_DIVIDEDU1l_ ) ^ sigma * ( 1 - beta1l_ ) * N1l_ ^ ( xi - 1 + sigma ) * kappaNT_ * LNT1l_ ^ nuNT * CBar1l_ / N1l_ ^ ( 1 + nuNT ) / ( gCBar_ / GN_ ) / lambda_B1l_ / ( 1 - tauLa_ - tauLb_ * log( WNT1_ ) )), WNTini1_, optimset( 'display', 'off' ) );
WSWini1_ = ( V1l_DIVIDEDU1l_ ) ^ sigma * ( 1 - beta1l_ ) * N1l_ ^ ( xi - 1 + sigma ) * kappaSW_ * LSW1l_ ^ nuSW * CBar1l_ / N1l_ ^ ( 1 + nuSW ) / ( gCBar_ / GN_ ) / lambda_B1l_ / ( 1 - tauLa_ );
WSW1_ = fzero( @(WSW1_) real(WSW1_ - ( V1l_DIVIDEDU1l_ ) ^ sigma * ( 1 - beta1l_ ) * N1l_ ^ ( xi - 1 + sigma ) * kappaSW_ * LSW1l_ ^ nuSW * CBar1l_ / N1l_ ^ ( 1 + nuSW ) / ( gCBar_ / GN_ ) / lambda_B1l_ / ( 1 - tauLa_ - tauLb_ * log( WSW1_ ) )), WSWini1_, optimset( 'display', 'off' ) );
WSTini1_ = ( V1l_DIVIDEDU1l_ ) ^ sigma * ( 1 - beta1l_ ) * N1l_ ^ ( xi - 1 + sigma ) * kappaST_ * LST1l_ ^ nuST * CBar1l_ / N1l_ ^ ( 1 + nuST ) / ( gCBar_ / GN_ ) / lambda_B1l_ / ( 1 - tauLa_ );
WST1_ = fzero( @(WST1_) real(WST1_ - ( V1l_DIVIDEDU1l_ ) ^ sigma * ( 1 - beta1l_ ) * N1l_ ^ ( xi - 1 + sigma ) * kappaST_ * LST1l_ ^ nuST * CBar1l_ / N1l_ ^ ( 1 + nuST ) / ( gCBar_ / GN_ ) / lambda_B1l_ / ( 1 - tauLa_ - tauLb_ * log( WST1_ ) )), WSTini1_, optimset( 'display', 'off' ) );
WSNTini1_ = ( V1l_DIVIDEDU1l_ ) ^ sigma * ( 1 - beta1l_ ) * N1l_ ^ ( xi - 1 + sigma ) * kappaSNT_ * LSNT1l_ ^ nuSNT * CBar1l_ / N1l_ ^ ( 1 + nuSNT ) / ( gCBar_ / GN_ ) / lambda_B1l_ / ( 1 - tauLa_ );
WSNT1_ = fzero( @(WSNT1_) real(WSNT1_ - ( V1l_DIVIDEDU1l_ ) ^ sigma * ( 1 - beta1l_ ) * N1l_ ^ ( xi - 1 + sigma ) * kappaSNT_ * LSNT1l_ ^ nuSNT * CBar1l_ / N1l_ ^ ( 1 + nuSNT ) / ( gCBar_ / GN_ ) / lambda_B1l_ / ( 1 - tauLa_ - tauLb_ * log( WSNT1_ ) )), WSNTini1_, optimset( 'display', 'off' ) );
end