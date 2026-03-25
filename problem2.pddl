(define (problem simple-broken)
    (:domain EVR-broken)
    (:objects 
        
    )
    
    (:init
        (= (grid_max_x) 10)
        (= (grid_max_y) 10)
        
        (= (evr_x) 0)
        (= (evr_y) 0)
        (= (station_charge_x) 10)
        (= (station_charge_y) 10)
        (= (station_control_x) 1)
        (= (station_control_y) 1)
        (= (freelegs) 6)
        (= (energy) 20)
        
        ; (charging)
        ; (= (num_charged) 0)
        (not (charging))
        (not (control_access))
        (not (goal_reached))
        
        (broken5_5)
        (broken4_6)
        (broken7_7)
    )
    
    (:goal 
        (and
            (goal_reached)
        )
    )
    
)