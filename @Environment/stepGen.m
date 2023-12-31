function stepGen(obj,num)
%STEPGEN All the steps necessary to go to a new generation
for k = 1:num
    %Based on the scores, make new generation.
    %An initaial score and rank was already done. 
    
    %Deal with heat
    %{
    if(obj.flt_lastHighScore == obj.population(1).flt_score)
        obj.global_glob.addHeat();
    else
        obj.global_glob.resetHeat();
        obj.flt_lastHighScore = obj.population(1).flt_score;
    end
    %}
    %FIXME - Parallelize
    index = ceil(obj.popsize/4);
    for i = 1:floor(obj.popsize/4)
        for j = 1:3
            obj.population(index) = obj.population(i).mkChild;
            index = index + 1;
        end
    end
    obj.scorePop;
    obj.rankPop;
    if(mod(k,100) == 0)
        fprintf("Step %i\n", k)
    end
    obj.stepNum = obj.stepNum + 1;
end
obj.graphRank
end