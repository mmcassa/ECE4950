function xcp = real_motorxcp

xcp.events     =  repmat(struct('id',{}, 'sampletime', {}, 'offset', {}), getNumEvents, 1 );
xcp.parameters =  repmat(struct('symbol',{}, 'size', {}, 'dtname', {}, 'baseaddr', {}), getNumParameters, 1 );
xcp.signals    =  repmat(struct('symbol',{}), getNumSignals, 1 );
xcp.models     =  cell(1,getNumModels);
    
xcp.models{1} = 'real_motor';
   
   
         
xcp.events(1).id         = 0;
xcp.events(1).sampletime = 0.0002;
xcp.events(1).offset     = 0.0;
    
xcp.signals(1).symbol =  'real_motor_B.Constant_b';
    
xcp.signals(2).symbol =  'real_motor_B.Constant1_p';
    
xcp.signals(3).symbol =  'real_motor_B.Constant4';
    
xcp.signals(4).symbol =  'real_motor_B.zaxis';
    
xcp.signals(5).symbol =  'real_motor_B.Gain';
    
xcp.signals(6).symbol =  'real_motor_B.MultiportSwitch1_g';
    
xcp.signals(7).symbol =  'real_motor_B.Saturation';
    
xcp.signals(8).symbol =  'real_motor_B.Q4AD_o1';
    
xcp.signals(9).symbol =  'real_motor_B.Q4AD_o2';
    
xcp.signals(10).symbol =  'real_motor_B.Q4Enc';
    
xcp.signals(11).symbol =  'real_motor_B.Add';
    
xcp.signals(12).symbol =  'real_motor_B.Switch';
    
xcp.signals(13).symbol =  'real_motor_B.LowpassFilter';
    
xcp.signals(14).symbol =  'real_motor_B.Filter';
    
xcp.signals(15).symbol =  'real_motor_B.Integrator';
    
xcp.signals(16).symbol =  'real_motor_B.DerivativeGain';
    
xcp.signals(17).symbol =  'real_motor_B.FilterCoefficient';
    
xcp.signals(18).symbol =  'real_motor_B.IntegralGain';
    
xcp.signals(19).symbol =  'real_motor_B.ProportionalGain';
    
xcp.signals(20).symbol =  'real_motor_B.Sum';
    
xcp.signals(21).symbol =  'real_motor_B.SumD';
    
xcp.signals(22).symbol =  'real_motor_B.Constant';
    
xcp.signals(23).symbol =  'real_motor_B.Constant2';
    
xcp.signals(24).symbol =  'real_motor_B.Constant3';
    
xcp.signals(25).symbol =  'real_motor_B.MultiportSwitch1';
    
xcp.signals(26).symbol =  'real_motor_B.Constant_op';
    
xcp.signals(27).symbol =  'real_motor_B.Derivative_j';
    
xcp.signals(28).symbol =  'real_motor_B.MathFunction_a';
    
xcp.signals(29).symbol =  'real_motor_B.Counter_o1_m';
    
xcp.signals(30).symbol =  'real_motor_B.Counter_o2_g';
    
xcp.signals(31).symbol =  'real_motor_B.Add_d';
    
xcp.signals(32).symbol =  'real_motor_B.Switch_c';
    
xcp.signals(33).symbol =  'real_motor_B.Switch1_j';
    
xcp.signals(34).symbol =  'real_motor_B.FixPtGatewayIn_p';
    
xcp.signals(35).symbol =  'real_motor_B.FixPtSum1_a';
    
xcp.signals(36).symbol =  'real_motor_B.Clock';
    
xcp.signals(37).symbol =  'real_motor_B.Constant1';
    
xcp.signals(38).symbol =  'real_motor_B.DataTypeConversion';
    
xcp.signals(39).symbol =  'real_motor_B.mod';
    
xcp.signals(40).symbol =  'real_motor_B.Product';
    
xcp.signals(41).symbol =  'real_motor_B.Product1';
    
xcp.signals(42).symbol =  'real_motor_B.RelationalOperator';
    
xcp.signals(43).symbol =  'real_motor_B.Sum2';
    
xcp.signals(44).symbol =  'real_motor_B.PhaseDelaySwitch';
    
xcp.signals(45).symbol =  'real_motor_B.Constant_o';
    
xcp.signals(46).symbol =  'real_motor_B.Derivative';
    
xcp.signals(47).symbol =  'real_motor_B.MathFunction';
    
xcp.signals(48).symbol =  'real_motor_B.Counter_o1';
    
xcp.signals(49).symbol =  'real_motor_B.Counter_o2';
    
xcp.signals(50).symbol =  'real_motor_B.Add_h';
    
xcp.signals(51).symbol =  'real_motor_B.Switch_h';
    
xcp.signals(52).symbol =  'real_motor_B.Switch1';
    
xcp.signals(53).symbol =  'real_motor_B.FixPtGatewayIn';
    
xcp.signals(54).symbol =  'real_motor_B.FixPtSum1';
         
xcp.parameters(1).symbol = 'real_motor_P.PIDController_P';
xcp.parameters(1).size   =  1;       
xcp.parameters(1).dtname = 'real_T'; 
xcp.parameters(2).baseaddr = '&real_motor_P.PIDController_P';     
         
xcp.parameters(2).symbol = 'real_motor_P.PIDController_I';
xcp.parameters(2).size   =  1;       
xcp.parameters(2).dtname = 'real_T'; 
xcp.parameters(3).baseaddr = '&real_motor_P.PIDController_I';     
         
xcp.parameters(3).symbol = 'real_motor_P.PIDController_D';
xcp.parameters(3).size   =  1;       
xcp.parameters(3).dtname = 'real_T'; 
xcp.parameters(4).baseaddr = '&real_motor_P.PIDController_D';     
         
xcp.parameters(4).symbol = 'real_motor_P.PIDController_N';
xcp.parameters(4).size   =  1;       
xcp.parameters(4).dtname = 'real_T'; 
xcp.parameters(5).baseaddr = '&real_motor_P.PIDController_N';     
         
xcp.parameters(5).symbol = 'real_motor_P.Constant_Value_n';
xcp.parameters(5).size   =  1;       
xcp.parameters(5).dtname = 'real_T'; 
xcp.parameters(6).baseaddr = '&real_motor_P.Constant_Value_n';     
         
xcp.parameters(6).symbol = 'real_motor_P.Constant1_Value_i';
xcp.parameters(6).size   =  1;       
xcp.parameters(6).dtname = 'real_T'; 
xcp.parameters(7).baseaddr = '&real_motor_P.Constant1_Value_i';     
         
xcp.parameters(7).symbol = 'real_motor_P.Constant2_Value';
xcp.parameters(7).size   =  1;       
xcp.parameters(7).dtname = 'real_T'; 
xcp.parameters(8).baseaddr = '&real_motor_P.Constant2_Value';     
         
xcp.parameters(8).symbol = 'real_motor_P.Constant3_Value';
xcp.parameters(8).size   =  1;       
xcp.parameters(8).dtname = 'real_T'; 
xcp.parameters(9).baseaddr = '&real_motor_P.Constant3_Value';     
         
xcp.parameters(9).symbol = 'real_motor_P.Constant4_Value';
xcp.parameters(9).size   =  1;       
xcp.parameters(9).dtname = 'real_T'; 
xcp.parameters(10).baseaddr = '&real_motor_P.Constant4_Value';     
         
xcp.parameters(10).symbol = 'real_motor_P.Constant5_Value_f';
xcp.parameters(10).size   =  1;       
xcp.parameters(10).dtname = 'real_T'; 
xcp.parameters(11).baseaddr = '&real_motor_P.Constant5_Value_f';     
         
xcp.parameters(11).symbol = 'real_motor_P.Constant6_Value';
xcp.parameters(11).size   =  1;       
xcp.parameters(11).dtname = 'real_T'; 
xcp.parameters(12).baseaddr = '&real_motor_P.Constant6_Value';     
         
xcp.parameters(12).symbol = 'real_motor_P.Constant7_Value';
xcp.parameters(12).size   =  1;       
xcp.parameters(12).dtname = 'real_T'; 
xcp.parameters(13).baseaddr = '&real_motor_P.Constant7_Value';     
         
xcp.parameters(13).symbol = 'real_motor_P.SW2High1_Value';
xcp.parameters(13).size   =  1;       
xcp.parameters(13).dtname = 'real_T'; 
xcp.parameters(14).baseaddr = '&real_motor_P.SW2High1_Value';     
         
xcp.parameters(14).symbol = 'real_motor_P.motor_angle_Value';
xcp.parameters(14).size   =  1;       
xcp.parameters(14).dtname = 'real_T'; 
xcp.parameters(15).baseaddr = '&real_motor_P.motor_angle_Value';     
         
xcp.parameters(15).symbol = 'real_motor_P.zaxis_Amp';
xcp.parameters(15).size   =  1;       
xcp.parameters(15).dtname = 'real_T'; 
xcp.parameters(16).baseaddr = '&real_motor_P.zaxis_Amp';     
         
xcp.parameters(16).symbol = 'real_motor_P.zaxis_Period';
xcp.parameters(16).size   =  1;       
xcp.parameters(16).dtname = 'real_T'; 
xcp.parameters(17).baseaddr = '&real_motor_P.zaxis_Period';     
         
xcp.parameters(17).symbol = 'real_motor_P.zaxis_Duty';
xcp.parameters(17).size   =  1;       
xcp.parameters(17).dtname = 'real_T'; 
xcp.parameters(18).baseaddr = '&real_motor_P.zaxis_Duty';     
         
xcp.parameters(18).symbol = 'real_motor_P.zaxis_PhaseDelay';
xcp.parameters(18).size   =  1;       
xcp.parameters(18).dtname = 'real_T'; 
xcp.parameters(19).baseaddr = '&real_motor_P.zaxis_PhaseDelay';     
         
xcp.parameters(19).symbol = 'real_motor_P.Gain_Gain';
xcp.parameters(19).size   =  1;       
xcp.parameters(19).dtname = 'real_T'; 
xcp.parameters(20).baseaddr = '&real_motor_P.Gain_Gain';     
         
xcp.parameters(20).symbol = 'real_motor_P.Saturation_UpperSat';
xcp.parameters(20).size   =  1;       
xcp.parameters(20).dtname = 'real_T'; 
xcp.parameters(21).baseaddr = '&real_motor_P.Saturation_UpperSat';     
         
xcp.parameters(21).symbol = 'real_motor_P.Saturation_LowerSat';
xcp.parameters(21).size   =  1;       
xcp.parameters(21).dtname = 'real_T'; 
xcp.parameters(22).baseaddr = '&real_motor_P.Saturation_LowerSat';     
         
xcp.parameters(22).symbol = 'real_motor_P.Q4AD_P1';
xcp.parameters(22).size   =  1;       
xcp.parameters(22).dtname = 'real_T'; 
xcp.parameters(23).baseaddr = '&real_motor_P.Q4AD_P1';     
         
xcp.parameters(23).symbol = 'real_motor_P.Q4AD_P2';
xcp.parameters(23).size   =  2;       
xcp.parameters(23).dtname = 'real_T'; 
xcp.parameters(24).baseaddr = '&real_motor_P.Q4AD_P2[0]';     
         
xcp.parameters(24).symbol = 'real_motor_P.Q4AD_P3';
xcp.parameters(24).size   =  2;       
xcp.parameters(24).dtname = 'real_T'; 
xcp.parameters(25).baseaddr = '&real_motor_P.Q4AD_P3[0]';     
         
xcp.parameters(25).symbol = 'real_motor_P.Q4AD_P5';
xcp.parameters(25).size   =  1;       
xcp.parameters(25).dtname = 'real_T'; 
xcp.parameters(26).baseaddr = '&real_motor_P.Q4AD_P5';     
         
xcp.parameters(26).symbol = 'real_motor_P.Q4AD_P6';
xcp.parameters(26).size   =  1;       
xcp.parameters(26).dtname = 'real_T'; 
xcp.parameters(27).baseaddr = '&real_motor_P.Q4AD_P6';     
         
xcp.parameters(27).symbol = 'real_motor_P.Q4AD_P7';
xcp.parameters(27).size   =  1;       
xcp.parameters(27).dtname = 'real_T'; 
xcp.parameters(28).baseaddr = '&real_motor_P.Q4AD_P7';     
         
xcp.parameters(28).symbol = 'real_motor_P.Q4DA_P1';
xcp.parameters(28).size   =  1;       
xcp.parameters(28).dtname = 'real_T'; 
xcp.parameters(29).baseaddr = '&real_motor_P.Q4DA_P1';     
         
xcp.parameters(29).symbol = 'real_motor_P.Q4DA_P2';
xcp.parameters(29).size   =  1;       
xcp.parameters(29).dtname = 'real_T'; 
xcp.parameters(30).baseaddr = '&real_motor_P.Q4DA_P2';     
         
xcp.parameters(30).symbol = 'real_motor_P.Q4DA_P3';
xcp.parameters(30).size   =  1;       
xcp.parameters(30).dtname = 'real_T'; 
xcp.parameters(31).baseaddr = '&real_motor_P.Q4DA_P3';     
         
xcp.parameters(31).symbol = 'real_motor_P.Q4DA_P4';
xcp.parameters(31).size   =  1;       
xcp.parameters(31).dtname = 'real_T'; 
xcp.parameters(32).baseaddr = '&real_motor_P.Q4DA_P4';     
         
xcp.parameters(32).symbol = 'real_motor_P.Q4DA_P5';
xcp.parameters(32).size   =  1;       
xcp.parameters(32).dtname = 'real_T'; 
xcp.parameters(33).baseaddr = '&real_motor_P.Q4DA_P5';     
         
xcp.parameters(33).symbol = 'real_motor_P.Q4DA_P6';
xcp.parameters(33).size   =  1;       
xcp.parameters(33).dtname = 'real_T'; 
xcp.parameters(34).baseaddr = '&real_motor_P.Q4DA_P6';     
         
xcp.parameters(34).symbol = 'real_motor_P.Q4DA_P7';
xcp.parameters(34).size   =  1;       
xcp.parameters(34).dtname = 'real_T'; 
xcp.parameters(35).baseaddr = '&real_motor_P.Q4DA_P7';     
         
xcp.parameters(35).symbol = 'real_motor_P.Q4DA_P8';
xcp.parameters(35).size   =  1;       
xcp.parameters(35).dtname = 'real_T'; 
xcp.parameters(36).baseaddr = '&real_motor_P.Q4DA_P8';     
         
xcp.parameters(36).symbol = 'real_motor_P.Q4DA_P9';
xcp.parameters(36).size   =  1;       
xcp.parameters(36).dtname = 'real_T'; 
xcp.parameters(37).baseaddr = '&real_motor_P.Q4DA_P9';     
         
xcp.parameters(37).symbol = 'real_motor_P.Q4DO_P1';
xcp.parameters(37).size   =  1;       
xcp.parameters(37).dtname = 'real_T'; 
xcp.parameters(38).baseaddr = '&real_motor_P.Q4DO_P1';     
         
xcp.parameters(38).symbol = 'real_motor_P.Q4DO_P2';
xcp.parameters(38).size   =  5;       
xcp.parameters(38).dtname = 'real_T'; 
xcp.parameters(39).baseaddr = '&real_motor_P.Q4DO_P2[0]';     
         
xcp.parameters(39).symbol = 'real_motor_P.Q4DO_P3';
xcp.parameters(39).size   =  1;       
xcp.parameters(39).dtname = 'real_T'; 
xcp.parameters(40).baseaddr = '&real_motor_P.Q4DO_P3';     
         
xcp.parameters(40).symbol = 'real_motor_P.Q4DO_P4';
xcp.parameters(40).size   =  5;       
xcp.parameters(40).dtname = 'real_T'; 
xcp.parameters(41).baseaddr = '&real_motor_P.Q4DO_P4[0]';     
         
xcp.parameters(41).symbol = 'real_motor_P.Q4DO_P5';
xcp.parameters(41).size   =  5;       
xcp.parameters(41).dtname = 'real_T'; 
xcp.parameters(42).baseaddr = '&real_motor_P.Q4DO_P5[0]';     
         
xcp.parameters(42).symbol = 'real_motor_P.Q4DO_P6';
xcp.parameters(42).size   =  1;       
xcp.parameters(42).dtname = 'real_T'; 
xcp.parameters(43).baseaddr = '&real_motor_P.Q4DO_P6';     
         
xcp.parameters(43).symbol = 'real_motor_P.Q4DO_P7';
xcp.parameters(43).size   =  1;       
xcp.parameters(43).dtname = 'real_T'; 
xcp.parameters(44).baseaddr = '&real_motor_P.Q4DO_P7';     
         
xcp.parameters(44).symbol = 'real_motor_P.Q4DO_P8';
xcp.parameters(44).size   =  1;       
xcp.parameters(44).dtname = 'real_T'; 
xcp.parameters(45).baseaddr = '&real_motor_P.Q4DO_P8';     
         
xcp.parameters(45).symbol = 'real_motor_P.Q4Enc_P1';
xcp.parameters(45).size   =  1;       
xcp.parameters(45).dtname = 'real_T'; 
xcp.parameters(46).baseaddr = '&real_motor_P.Q4Enc_P1';     
         
xcp.parameters(46).symbol = 'real_motor_P.Q4Enc_P2';
xcp.parameters(46).size   =  1;       
xcp.parameters(46).dtname = 'real_T'; 
xcp.parameters(47).baseaddr = '&real_motor_P.Q4Enc_P2';     
         
xcp.parameters(47).symbol = 'real_motor_P.Q4Enc_P3';
xcp.parameters(47).size   =  1;       
xcp.parameters(47).dtname = 'real_T'; 
xcp.parameters(48).baseaddr = '&real_motor_P.Q4Enc_P3';     
         
xcp.parameters(48).symbol = 'real_motor_P.Q4Enc_P4';
xcp.parameters(48).size   =  1;       
xcp.parameters(48).dtname = 'real_T'; 
xcp.parameters(49).baseaddr = '&real_motor_P.Q4Enc_P4';     
         
xcp.parameters(49).symbol = 'real_motor_P.Q4Enc_P5';
xcp.parameters(49).size   =  1;       
xcp.parameters(49).dtname = 'real_T'; 
xcp.parameters(50).baseaddr = '&real_motor_P.Q4Enc_P5';     
         
xcp.parameters(50).symbol = 'real_motor_P.Q4Enc_P6';
xcp.parameters(50).size   =  1;       
xcp.parameters(50).dtname = 'real_T'; 
xcp.parameters(51).baseaddr = '&real_motor_P.Q4Enc_P6';     
         
xcp.parameters(51).symbol = 'real_motor_P.Q4Enc_P7';
xcp.parameters(51).size   =  1;       
xcp.parameters(51).dtname = 'real_T'; 
xcp.parameters(52).baseaddr = '&real_motor_P.Q4Enc_P7';     
         
xcp.parameters(52).symbol = 'real_motor_P.Q4Enc_P8';
xcp.parameters(52).size   =  1;       
xcp.parameters(52).dtname = 'real_T'; 
xcp.parameters(53).baseaddr = '&real_motor_P.Q4Enc_P8';     
         
xcp.parameters(53).symbol = 'real_motor_P.Q4Enc_P9';
xcp.parameters(53).size   =  1;       
xcp.parameters(53).dtname = 'real_T'; 
xcp.parameters(54).baseaddr = '&real_motor_P.Q4Enc_P9';     
         
xcp.parameters(54).symbol = 'real_motor_P.Q4Enc_P10';
xcp.parameters(54).size   =  1;       
xcp.parameters(54).dtname = 'real_T'; 
xcp.parameters(55).baseaddr = '&real_motor_P.Q4Enc_P10';     
         
xcp.parameters(55).symbol = 'real_motor_P.Q4Enc_P11';
xcp.parameters(55).size   =  1;       
xcp.parameters(55).dtname = 'real_T'; 
xcp.parameters(56).baseaddr = '&real_motor_P.Q4Enc_P11';     
         
xcp.parameters(56).symbol = 'real_motor_P.Q4Enc_P12';
xcp.parameters(56).size   =  1;       
xcp.parameters(56).dtname = 'real_T'; 
xcp.parameters(57).baseaddr = '&real_motor_P.Q4Enc_P12';     
         
xcp.parameters(57).symbol = 'real_motor_P.Switch_Threshold';
xcp.parameters(57).size   =  1;       
xcp.parameters(57).dtname = 'real_T'; 
xcp.parameters(58).baseaddr = '&real_motor_P.Switch_Threshold';     
         
xcp.parameters(58).symbol = 'real_motor_P.Filter_gainval';
xcp.parameters(58).size   =  1;       
xcp.parameters(58).dtname = 'real_T'; 
xcp.parameters(59).baseaddr = '&real_motor_P.Filter_gainval';     
         
xcp.parameters(59).symbol = 'real_motor_P.Filter_IC';
xcp.parameters(59).size   =  1;       
xcp.parameters(59).dtname = 'real_T'; 
xcp.parameters(60).baseaddr = '&real_motor_P.Filter_IC';     
         
xcp.parameters(60).symbol = 'real_motor_P.Integrator_gainval';
xcp.parameters(60).size   =  1;       
xcp.parameters(60).dtname = 'real_T'; 
xcp.parameters(61).baseaddr = '&real_motor_P.Integrator_gainval';     
         
xcp.parameters(61).symbol = 'real_motor_P.Integrator_IC';
xcp.parameters(61).size   =  1;       
xcp.parameters(61).dtname = 'real_T'; 
xcp.parameters(62).baseaddr = '&real_motor_P.Integrator_IC';     
         
xcp.parameters(62).symbol = 'real_motor_P.Constant_Value';
xcp.parameters(62).size   =  1;       
xcp.parameters(62).dtname = 'real_T'; 
xcp.parameters(63).baseaddr = '&real_motor_P.Constant_Value';     
         
xcp.parameters(63).symbol = 'real_motor_P.Constant2_Value_b';
xcp.parameters(63).size   =  1;       
xcp.parameters(63).dtname = 'real_T'; 
xcp.parameters(64).baseaddr = '&real_motor_P.Constant2_Value_b';     
         
xcp.parameters(64).symbol = 'real_motor_P.Constant3_Value_m';
xcp.parameters(64).size   =  1;       
xcp.parameters(64).dtname = 'real_T'; 
xcp.parameters(65).baseaddr = '&real_motor_P.Constant3_Value_m';     
         
xcp.parameters(65).symbol = 'real_motor_P.Constant5_Value';
xcp.parameters(65).size   =  1;       
xcp.parameters(65).dtname = 'real_T'; 
xcp.parameters(66).baseaddr = '&real_motor_P.Constant5_Value';     
         
xcp.parameters(66).symbol = 'real_motor_P.SW2High1_Value_o';
xcp.parameters(66).size   =  1;       
xcp.parameters(66).dtname = 'real_T'; 
xcp.parameters(67).baseaddr = '&real_motor_P.SW2High1_Value_o';     
         
xcp.parameters(67).symbol = 'real_motor_P.Constant_Value_b';
xcp.parameters(67).size   =  1;       
xcp.parameters(67).dtname = 'real32_T'; 
xcp.parameters(68).baseaddr = '&real_motor_P.Constant_Value_b';     
         
xcp.parameters(68).symbol = 'real_motor_P.Counter_InitialCount_b';
xcp.parameters(68).size   =  1;       
xcp.parameters(68).dtname = 'uint32_T'; 
xcp.parameters(69).baseaddr = '&real_motor_P.Counter_InitialCount_b';     
         
xcp.parameters(69).symbol = 'real_motor_P.Counter_HitValue_g';
xcp.parameters(69).size   =  1;       
xcp.parameters(69).dtname = 'uint32_T'; 
xcp.parameters(70).baseaddr = '&real_motor_P.Counter_HitValue_g';     
         
xcp.parameters(70).symbol = 'real_motor_P.Switch_Threshold_j';
xcp.parameters(70).size   =  1;       
xcp.parameters(70).dtname = 'real_T'; 
xcp.parameters(71).baseaddr = '&real_motor_P.Switch_Threshold_j';     
         
xcp.parameters(71).symbol = 'real_motor_P.Switch1_Threshold_f';
xcp.parameters(71).size   =  1;       
xcp.parameters(71).dtname = 'real_T'; 
xcp.parameters(72).baseaddr = '&real_motor_P.Switch1_Threshold_f';     
         
xcp.parameters(72).symbol = 'real_motor_P.FixPtConstant_Value_e';
xcp.parameters(72).size   =  1;       
xcp.parameters(72).dtname = 'real_T'; 
xcp.parameters(73).baseaddr = '&real_motor_P.FixPtConstant_Value_e';     
         
xcp.parameters(73).symbol = 'real_motor_P.Constant_Value_d';
xcp.parameters(73).size   =  1;       
xcp.parameters(73).dtname = 'real_T'; 
xcp.parameters(74).baseaddr = '&real_motor_P.Constant_Value_d';     
         
xcp.parameters(74).symbol = 'real_motor_P.Constant1_Value';
xcp.parameters(74).size   =  1;       
xcp.parameters(74).dtname = 'real_T'; 
xcp.parameters(75).baseaddr = '&real_motor_P.Constant1_Value';     
         
xcp.parameters(75).symbol = 'real_motor_P.PhaseDelaySwitch_Threshold';
xcp.parameters(75).size   =  1;       
xcp.parameters(75).dtname = 'real_T'; 
xcp.parameters(76).baseaddr = '&real_motor_P.PhaseDelaySwitch_Threshold';     
         
xcp.parameters(76).symbol = 'real_motor_P.Constant_Value_k';
xcp.parameters(76).size   =  1;       
xcp.parameters(76).dtname = 'real32_T'; 
xcp.parameters(77).baseaddr = '&real_motor_P.Constant_Value_k';     
         
xcp.parameters(77).symbol = 'real_motor_P.Counter_InitialCount';
xcp.parameters(77).size   =  1;       
xcp.parameters(77).dtname = 'uint32_T'; 
xcp.parameters(78).baseaddr = '&real_motor_P.Counter_InitialCount';     
         
xcp.parameters(78).symbol = 'real_motor_P.Counter_HitValue';
xcp.parameters(78).size   =  1;       
xcp.parameters(78).dtname = 'uint32_T'; 
xcp.parameters(79).baseaddr = '&real_motor_P.Counter_HitValue';     
         
xcp.parameters(79).symbol = 'real_motor_P.Switch_Threshold_c';
xcp.parameters(79).size   =  1;       
xcp.parameters(79).dtname = 'real_T'; 
xcp.parameters(80).baseaddr = '&real_motor_P.Switch_Threshold_c';     
         
xcp.parameters(80).symbol = 'real_motor_P.Switch1_Threshold';
xcp.parameters(80).size   =  1;       
xcp.parameters(80).dtname = 'real_T'; 
xcp.parameters(81).baseaddr = '&real_motor_P.Switch1_Threshold';     
         
xcp.parameters(81).symbol = 'real_motor_P.FixPtConstant_Value';
xcp.parameters(81).size   =  1;       
xcp.parameters(81).dtname = 'real_T'; 
xcp.parameters(82).baseaddr = '&real_motor_P.FixPtConstant_Value';     

function n = getNumParameters
n = 81;

function n = getNumSignals
n = 54;

function n = getNumEvents
n = 1;

function n = getNumModels
n = 1;

