def contract_perfect_matching(G):
    """
    Given a graph G, contract a perfect matching M in G and return G/M.
    
    INPUT:
    - G: A graph (assumed to have a perfect matching).
    
    OUTPUT:
    - The graph obtained by contracting a perfect matching in G.
    """
    if not G.has_perfect_matching():
        print("No perfect matching found. Returning original graph.")
        return G
    
    print("Perfect matching found.The original graph and the contracted graph is:.")
    M = list(G.perfect_matchings())[0]
    H = G.copy()
    
    for u, v in M:
        H.merge_vertices([u, v])
    return G+H