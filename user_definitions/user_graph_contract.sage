def contract_perfect_matching(G):
    """
    Given a graph G, contract a perfect matching M in G and return G/M.
    
    INPUT:
    - G: A graph (assumed to have a perfect matching).
    
    OUTPUT:
    - The graph obtained by contracting a perfect matching in G.
    """
    if not G.has_perfect_matching():
        raise ValueError("The graph does not have a perfect matching.")
    M = list(G.perfect_matchings())[0]
    H = G.copy()
    for u, v in M:
        H.merge_vertices([u, v])
    return H