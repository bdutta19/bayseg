function MC_simulated=SimulateMRF(Element,MC_ini,Mset,Chain_length,beta)
C=4.615;
n=length(MC_ini);
%===== config the scan oder ====
[para_scanorder,num_of_color]=chromaticClassification(Element);
%===== pre-allocation ==========
MC_simulated(n,Chain_length)=0;
%===== assign known info =======
MC_simulated(:,1) = MC_ini;
%===== generate the chain ======
for i=2:Chain_length
    if i<=100
        T=C/log(1+i);
    else
        T=C/log(101);
    end    
    MC_simulated(:,i)=Gibbs_samplling(Element,MC_simulated(:,i-1),Mset,T,para_scanorder,num_of_color,beta);    
    display(i);    
end
end