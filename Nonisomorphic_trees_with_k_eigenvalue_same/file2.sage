def count_common_with_multiplicities(a, b):
    # Make copies to avoid modifying original lists
    a = list(a)
    b = list(b)
    c_list=[]
    count = 0
    for x in a:
        if x in b:
            count += 1
            c_list.append(x)
            b.remove(x)  # Remove the matched element       
    return count, c_list

for g in graphs.trees(5):
    for h in graphs.trees(5):
        if g.is_isomorphic(h)==0:
            s_g=g.spectrum()
            s_h=h.spectrum()
            n=count_common_with_multiplicities(s_g, s_h)
            if n[0]==2:
                show(g+h,figsize=[2,2])
                show(n[1])