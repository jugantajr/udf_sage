def corona_product(G, H):
    """
    Computes the corona product G ◊ H of two graphs G and H.
    """
    # Create a new graph
    result = Graph()
    
    # Get the number of vertices in G and H
    n = G.order()
    m = H.order()
    
    # Add all vertices of G (label them from 0 to n-1)
    result.add_vertices(range(n))
    
    # Add edges of G
    result.add_edges(G.edges())
    
    # For each vertex in G, add a copy of H and connect the vertex to all vertices in H
    for u in G.vertices():
        # Add vertices of the u-th copy of H (labels: n + u*m + v, where v is in H)
        H_vertices = [n + u * m + v for v in H.vertices()]
        result.add_vertices(H_vertices)
        
        # Add edges within this copy of H
        for (v1, v2) in H.edges():
            result.add_edge(n + u * m + v1, n + u * m + v2)
        
        # Connect vertex u to all vertices in its copy of H
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