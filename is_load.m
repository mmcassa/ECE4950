%% 
function ready = is_load()
    rto_out = get_param('real_motor/load_cell','RuntimeObject');
    curr_pos = rto_out.InputPort(1).Data;
    pause(0.005);
    
    if curr_pos >= 2.3 && curr_pos <= 2.9
        ready = 1;
    else
        ready = 1;
    end
