function fact = myFact(n)
    if n == 0 | n == 1 then
        fact = 1;
    else
        fact = n * myFact(n - 1);
    end
endfunction

function comb = myCombin(n, k)
    comb = myFact(n) / (myFact(k) * myFact(n - k));
endfunction

function cpb = CPB(n, k, p)
    sig = 0;
    for i = 0:k
        sig = sig + myCombin(n, i) * p^i * (1 - p)^(n - i);
    end
    cpb = sig;
endfunction

p_value = CPB(46,12,0.5)*2
disp(p_value)

alpha = 0.05

// Step 4: Conclusion based on p-value
if p_value < alpha then
    disp("Reject the null hypothesis.");
else
    disp("Failed to reject the null hypothesis: no evidence.");
end

