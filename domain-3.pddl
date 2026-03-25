(define (domain EVR)
    (:requirements :strips :typing :fluents)
    ; (:types)

    (:predicates
        (control_access)
        (goal_reached)
        (charging)
    )
    
    (:functions 
        (grid_max_x)
        (grid_max_y)
        (evr_x)
        (evr_y)
        (station_charge_x)
        (station_charge_y)
        (station_control_x)
        (station_control_y)
        (freelegs)
        (energy)
    )
    
    (:action increase_x
        :parameters ()
        :precondition (and (not (goal_reached)) (> (freelegs) 3) (not (charging)) (< (evr_x) grid_max_x) (> (energy) 1))
        :effect (and (increase (evr_x) 1) (decrease (energy) 1))
    )
    
    (:action increase_y
        :parameters ()
        :precondition (and (not (goal_reached)) (> (freelegs) 3) (not (charging)) (< (evr_y) grid_max_y) (> (energy) 1))
        :effect (and (increase (evr_y) 1) (decrease (energy) 1))
    )
    
    (:action decrease_x
        :parameters ()
        :precondition (and (not (goal_reached)) (> (freelegs) 3) (not (charging)) (> (evr_x) 0) (> (energy) 1))
        :effect (and (decrease (evr_x) 1) (decrease (energy) 1))
    )
    
    (:action decrease_y
        :parameters ()
        :precondition (and (not (goal_reached)) (> (freelegs) 3) (not (charging)) (> (evr_y) 0) (> (energy) 1))
        :effect (and (decrease (evr_y) 1) (decrease (energy) 1))
    )
    
    (:action control_open
        :parameters ()
        :precondition (and (= (evr_y) station_control_y) (= (evr_x) station_control_x) (> (freelegs) 1) (not (goal_reached)) (not (control_access)) (> (energy) 1))
        :effect (and
            (control_access) (decrease (energy) 1)
        )
    )
    
    (:action control_manuever
        :parameters ()
        :precondition (and (= (evr_y) station_control_y) (= (evr_x) station_control_x) (> (freelegs) 1) (not (goal_reached)) (control_access) (> (energy) 1))
        :effect (and (goal_reached) (decrease (energy) 1))
    )
    
    (:action dock
        :parameters ()
        :precondition (and (= (evr_y) station_charge_y) (= (evr_x) station_charge_x) (not (charging)))
        :effect (and
            (charging)
            (assign (energy) 100)
        )
    )
    
    (:action undock
        :parameters ()
        :precondition (and (= (evr_y) station_charge_y) (= (evr_x) station_charge_x) (charging))
        :effect (and
            (not (charging))
        )
    )


)
