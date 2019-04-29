function move_motors(x,y,z,m_en,y_pos) 
    tg = xpc;

    % motor constants
    J = 3.2284E-6;	    % Moment of inertia of the rotorc     [kg.m"2]
    b   =  3.5077E-6;	% Motor viscous friction constant     [N.m.s]
    Ke =  0.0274;           % Electromotive force constant        [V/rad/sec]
    %Kt =  0.0274 ;	        % Torque constant                     [N.m/Arnp]
    R =	4;	                % Resistance	[ Ohm]
    L = 0.01;	            % Inductance	[H]

    % rtwbuild('real_motor');
    % load(tg,'real_motor');
    %tg.start;
    motor_angle = tg.getparamid('motor_angle', 'Value');
    PWM_en = tg.getparamid('Constant', 'Value');
    PWM_dir = tg.getparamid('Constant1', 'Value');
    servo = tg.getparamid('zaxis','PulseWidth');
    %servo = tg.getparamid('Constant8','Value');
    s_en = tg.getparamid('Constant5', 'Value');
    emag = tg.getparamid('Constant4', 'Value');
    steps = tg.getparamid('Constant7', 'Value');
    y_control = y - y_pos;
    start_ma = tg.getparam(motor_angle);
    ma = 311.*x;
    % Calculate pause times
    y_pause = .73./2.*abs(y_control);
    x_pause = abs(start_ma-ma)./820;
    
    tg.setparam(motor_angle, ma);
    
    %tg.setparam(PWM_dir, y_dir);
    if y_control ~= 0
        if y_control > 0
            tg.setparam(PWM_dir,1);
        elseif y_control < 0
            tg.setparam(PWM_dir,0);
        end
        tg.setparam(steps, 168 .* abs(y_control));
        %tg.setparam(PWM_en, 0);
        %pause(0.01);
        tg.setparam(PWM_en, 1);
        %tg.setparam(PWM_en, 1);
        %tg.setparam(PWM_en, 0);
    end
    if x_pause > y_pause
        pause(x_pause);
    else
        pause(y_pause);
    end
    tg.setparam(PWM_en, 0);
%     t_ang = motor_angle;
%     pause(.3);
%     while tg.getparamid('motor_angle','Value') ~= t_ang && abs(t_ang -x) < 2
%         t_ang = tg.getparamid('motor_angle','Value');
%         t_ang
%         pause(.3);
%         t_ang
%     end
    
    if z ~= tg.getparam(servo)
        tg.setparam(servo, z);
        tg.setparam(s_en,1);
        pause(.3);
    end
    tg.setparam(s_en,0);
    if tg.getparam(emag) ~= m_en
        pause(.4);
        tg.setparam(emag,m_en);
    end
    tg.setparam(emag,m_en);
end