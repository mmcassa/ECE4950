function ins_set = qr_scan(cam)
    javaaddpath('core-3.3.3.jar');
    javaaddpath('javase-3.3.3.jar');
    
    str = [];
    while (isempty(str)) 
        snap = snapshot(cam);
        str = decode_qr(snap);
    end

    s=1;
    ins_set = {};
    temp_ins = '';
    for i=1 : length(str)
        if str(i) == ',' || str(i) == '.'
            ins_set{s} = temp_ins;
            s=s+1;
            i = i+1;
            temp_ins = '';
        else
            temp_ins = strcat(temp_ins, str(i));
        end
    end
    