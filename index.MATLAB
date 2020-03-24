%%%%%%%%figures out relative responses to different stimuli
simpleeffects=[]; c1=1; c2=1; cols=[]; newindices=[];notindices=[];
for stim=1:2
    for c=1:size(effectsall,1)
        r=mean(effectsall(c,BEGINo:ENDo,redundantnumber+1,stim));
        cn=mean(effectsall(c,BEGINo:ENDo,1,stim));
        d=mean(effectsall(c,BEGINo:ENDo,10,stim));
        if and(or(or(r>include_cutoff,cn>include_cutoff),d>include_cutoff),and(and(r<exclude_outlier,cn<exclude_outlier),d<exclude_outlier))
        simpleeffects(c1,1)=(cn);    
        simpleeffects(c1,2)=(r);                
        simpleeffects(c1,3)=(d);    
        newindices(c1,1)=c;
        newindices(c1,2)=stim;
        c1=1+c1;
        else
            notindices(c2,1)=c;
            notindices(c2,2)=stim;
            c2=1+c2;
        end
    end
end
for makingcolors=1;
    for c=1:(c1-1)
        s=simpleeffects(c,1)./max(simpleeffects(c,:));
        cols(c,2)=s;
        s=simpleeffects(c,3)./max(simpleeffects(c,:));
        cols(c,1)=s;
        s=simpleeffects(c,2)./max(simpleeffects(c,:));
        cols(c,3)=s;
    end
    for c=1:(c1-1);
        a=cols(c,:)-min(cols(c,:));
        cols(c,:)=cols(c,:)./max(cols(c,:));
    end
end