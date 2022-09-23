# WCLvsSCL
Some simple code for computing the probabilistic zeta function of a poset lattice, as defined in [Shala22](https://arxiv.org/abs/2112.13766). 
There is also a function to look for lattices which are _weakly coset-like_ (WCL) but not _strongly coset-like_ (SCL). 

To install, simply copy the file and run `load("main.sage")` in the same directory. 
## Usage
```sage 
L = d_partition_lattice(2,3) 
prob_zeta_fn(L)
# Returns (30/15^s - 15/5^s + 1, True)

# Find counterexamples for the assertion WCL => SCL:
test_all(10,10)

```
## License
[GPL](https://www.gnu.org/licenses/gpl-3.0.en.html)
