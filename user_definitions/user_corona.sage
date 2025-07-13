def corona_product(G, H):
    """
    Computes the corona product of two graphs G and H.
    """
    result = Graph()
    n = G.order()
    m = H.order()
    result.add_vertices(range(n))
    result.add_edges(G.edges())
    for u in G.vertices():
        H_vertices = [n + u * m + v for v in H.vertices()]
        result.add_vertices(H_vertices)
        for (v1, v2) in H.edges():
            result.add_edge(n + u * m + v1, n + u * m + v2)
        for v in H.vertices():
            result.add_edge(u, n + u * m + v)
    
    return result

def is_corona(g):
    n = g.order()
    if n % 2 != 0:
        return False
    deg1 = sum(1 for v in g.vertices() if g.degree(v) == 1)
    if deg1 != n // 2:
        return False
    for v in g.vertices():
        if g.degree(v) > 1:
            if sum(1 for u in g.neighbors(v) if g.degree(u) == 1) != 1:
                return False
    return True