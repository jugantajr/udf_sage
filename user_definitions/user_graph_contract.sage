def contract_perfect_matching(G):
    """
    Given a graph G, contract a perfect matching M in G and return G/M.
    
    INPUT:
    - G: A graph (assumed to have a perfect matching).
    
    OUTPUT:
    - The graph obtained by contracting a perfect matching in G.
    
    EXAMPLES:
        sage: G = graphs.CompleteGraph(4)
        sage: H = contract_perfect_matching(G)
        sage: H.edges()
        [(0, 2, None), (0, 3, None), (2, 3, None)]
    """
    if not G.has_perfect_matching():
        raise ValueError("The graph does not have a perfect matching.")
    
    # Find a perfect matching (using the first one found)
    M = list(G.perfect_matchings())[0]
    
    # Create a copy of G to modify
    H = G.copy()
    
    # Contract each edge in the perfect matching
    for u, v in M:
        H.merge_vertices([u, v])
    
    return H