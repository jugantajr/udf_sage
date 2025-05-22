from collections import Counter
for a in graphs.trees(5):
    for b in graphs.trees(5):
        if g.is_isomorphic(h)==0:
            #show(g + h, figsize=[1.5,1.5])
            s_g=g.spectrum()
            s_h=h.spectrum()
            show(s_g)
            show(s_h)
            count1 = Counter(s_g)
            count2 = Counter(s_h)
            common_count = sum((count1 & count2).values())
            show(common_count)
