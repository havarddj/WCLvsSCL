def d_partition_lattice(d, n):
    P = posets.SetPartitions(d * n)
    return LatticePoset(Poset(([x for x in P if [len(y) % d == 0 for y in x] == [true for y in x] or x == P.bottom()], lambda x, y: P.is_less_than(x, y) or x == y)))

def prob_zeta_fn(L):
    is_SCL = True  # set this to false if we find non-integer J/J_x
    var('s')

    J = L.join_irreducibles()
    P = 0
    for x in L:
        if x != L.bottom():
            b = QQ(len(J) / len([j for j in J if (L.is_less_than(j, x) or j == x)]))
            if not b in ZZ:
                is_SCL = False
            P += QQ(L.moebius_function(x, L.top())) * b ^ -s

    return P, is_SCL

def test_all(start,stop):
    found_cex = False
    for n in [start..stop]:
        print(f"Looping through posets on {n} elements")
        for P in Posets(n):
            if P.is_lattice():
                Q = LatticePoset(P)
                P, is_SCL = prob_zeta_fn(Q)
                is_WCL = not ("(" in str(P))
                if is_WCL != is_SCL:
                    #Q.plot()
                    print("Found counterexample!")
                    print("Zeta function:", P)
                    print("Cover relations:", Q.cover_relations())
                    print("Is_atomic?", Q.is_atomic())
                    found_cex = True

    return found_cex
 
