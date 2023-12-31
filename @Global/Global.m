classdef Global < handle
    %GLOBAL Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        fltvec_pin %Pin [X Y]
        fltvec_roller %Roller [X Y]
        fltvec_load %Load [X Y dir]
        int_heat %Increases likelihood to change
        int_count %Num gens in a row w/o improvement
    end
    
    methods
        function obj = Global(pin, roller, load)
            obj.fltvec_pin = pin;
            obj.fltvec_roller = roller;
            obj.fltvec_load = load;
            obj.int_heat = 4;
            obj.int_count = 4;
        end
        function addHeat(obj) % Add heat. Add more heat over time. 
            obj.int_heat = obj.int_heat + obj.int_count;
        end
        function resetHeat(obj) % Resets heat generation.
            obj.int_heat = 4;
        end
    end
end

