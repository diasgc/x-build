#!/bin/bash

lib='c-plus-plus'
dsc='Collection of various algorithms in mathematics, machine learning, computer science and physics implemented in C++ for educational purposes.'
lic='MIT'
url='thealgorithms.github.io/c-plus-plus'
src='https://github.com/TheAlgorithms/C-Plus-Plus.git'
cfg='cmake'
eta='0'

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE'
lst_pc=''

dev_bra='master'
dev_vrs=''
stb_bra=''
stb_vrs=''

. xbuilder.sh && start

# cpu av8 av7 x86 x64
# NDK   +  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# share/doc/c-plus-plus/LICENSE
# bin/graph/connected_components_with_dsu
# bin/graph/depth_first_search_with_stack
# bin/graph/max_flow_with_ford_fulkerson_and_edmond_karp_algo
# bin/graph/kosaraju
# bin/graph/is_graph_bipartite
# bin/graph/lowest_common_ancestor
# bin/graph/dijkstra
# bin/graph/bridge_finding_with_tarjan_algorithm
# bin/graph/topological_sort
# bin/graph/bidirectional_dijkstra
# bin/graph/connected_components
# bin/graph/topological_sort_by_kahns_algo
# bin/graph/travelling_salesman_problem
# bin/graph/kruskal
# bin/graph/prim
# bin/graph/cycle_check_directed_graph
# bin/graph/depth_first_search
# bin/graph/breadth_first_search
# bin/graph/hopcroft_karp
# bin/graph/hamiltons_cycle
# bin/graph/is_graph_bipartite2
# bin/probability/poisson_dist
# bin/probability/binomial_dist
# bin/probability/windowed_median
# bin/probability/addition_rule
# bin/probability/bayes_theorem
# bin/probability/geometric_dist
# bin/numerical_methods/bisection_method
# bin/numerical_methods/golden_search_extrema
# bin/numerical_methods/qr_eigen_values
# bin/numerical_methods/lu_decompose
# bin/numerical_methods/babylonian_method
# bin/numerical_methods/qr_decomposition
# bin/numerical_methods/newton_raphson_method
# bin/numerical_methods/brent_method_extrema
# bin/numerical_methods/composite_simpson_rule
# bin/numerical_methods/midpoint_integral_method
# bin/numerical_methods/inverse_fast_fourier_transform
# bin/numerical_methods/ode_forward_euler
# bin/numerical_methods/gaussian_elimination
# bin/numerical_methods/fast_fourier_transform
# bin/numerical_methods/rungekutta
# bin/numerical_methods/ode_semi_implicit_euler
# bin/numerical_methods/false_position
# bin/numerical_methods/durand_kerner_roots
# bin/numerical_methods/successive_approximation
# bin/numerical_methods/ode_midpoint_euler
# bin/data_structures/skip_list
# bin/data_structures/tree
# bin/data_structures/test_stack_students
# bin/data_structures/queue_using_linked_list
# bin/data_structures/cll
# bin/data_structures/queue_using_array2
# bin/data_structures/linkedlist_implentation_usingarray
# bin/data_structures/test_stack
# bin/data_structures/avltree
# bin/data_structures/trie_modern
# bin/data_structures/dsu_union_rank
# bin/data_structures/trie_using_hashmap
# bin/data_structures/queue_using_two_stacks
# bin/data_structures/morrisinorder
# bin/data_structures/trie_tree
# bin/data_structures/sparse_table
# bin/data_structures/binaryheap
# bin/data_structures/binary_search_tree
# bin/data_structures/doubly_linked_list
# bin/data_structures/test_queue
# bin/data_structures/rb_tree
# bin/data_structures/queue_using_array
# bin/data_structures/tree_234
# bin/data_structures/stack_using_queue
# bin/data_structures/circular_queue_using_linked_list
# bin/data_structures/stack_using_linked_list
# bin/data_structures/disjoint_set
# bin/data_structures/stack_using_array
# bin/data_structures/linked_list
# bin/data_structures/reverse_a_linked_list
# bin/data_structures/list_array
# bin/data_structures/queue_using_linkedlist
# bin/data_structures/dsu_path_compression
# bin/data_structures/binary_search_tree2
# bin/backtracking/subarray_sum
# bin/backtracking/nqueen_print_all_solutions
# bin/backtracking/minimax
# bin/backtracking/magic_sequence
# bin/backtracking/graph_coloringg
# bin/backtracking/knight_tour
# bin/backtracking/wildcard_matching
# bin/backtracking/rat_maze
# bin/backtracking/sudoku_solve
# bin/backtracking/subset_sum
# bin/backtracking/n_queens
# bin/backtracking/n_queens_all_solution_optimised
# bin/sorting/shell_sort
# bin/sorting/recursive_bubble_sort
# bin/sorting/tim_sort
# bin/sorting/strand_sort
# bin/sorting/selection_sort_recursive
# bin/sorting/bubble_sort
# bin/sorting/count_inversions
# bin/sorting/dnf_sort
# bin/sorting/pancake_sort
# bin/sorting/binary_insertion_sort
# bin/sorting/slow_sort
# bin/sorting/radix_sort
# bin/sorting/counting_sort
# bin/sorting/library_sort
# bin/sorting/heap_sort
# bin/sorting/bead_sort
# bin/sorting/non_recursive_merge_sort
# bin/sorting/radix_sort2
# bin/sorting/quick_sort
# bin/sorting/wiggle_sort
# bin/sorting/swap_sort
# bin/sorting/shell_sort2
# bin/sorting/insertion_sort
# bin/sorting/bitonic_sort
# bin/sorting/counting_sort_string
# bin/sorting/merge_insertion_sort
# bin/sorting/merge_sort
# bin/sorting/gnome_sort
# bin/sorting/random_pivot_quick_sort
# bin/sorting/bucket_sort
# bin/sorting/quick_sort_3
# bin/sorting/bogo_sort
# bin/sorting/selection_sort_iterative
# bin/sorting/odd_even_sort
# bin/sorting/comb_sort
# bin/sorting/pigeonhole_sort
# bin/sorting/cycle_sort
# bin/sorting/wave_sort
# bin/sorting/numeric_string_sort
# bin/sorting/cocktail_selection_sort
# bin/others/tower_of_hanoi
# bin/others/sparse_matrix
# bin/others/vector_important_functions
# bin/others/palindrome_of_number
# bin/others/primality_test
# bin/others/iterative_tree_traversals
# bin/others/buzz_number
# bin/others/decimal_to_roman_numeral
# bin/others/postfix_evaluation
# bin/others/matrix_exponentiation
# bin/others/fast_integer_input
# bin/others/easter
# bin/others/happy_number
# bin/others/smallest_circle
# bin/others/spiral_print
# bin/others/paranthesis_matching
# bin/others/lru_cache
# bin/others/recursive_tree_traversal
# bin/others/decimal_to_hexadecimal
# bin/others/pascal_triangle
# bin/others/stairs_pattern
# bin/others/kadanes3
# bin/others/decimal_to_binary
# bin/strings/manacher_algorithm
# bin/strings/rabin_karp
# bin/strings/horspool
# bin/strings/knuth_morris_pratt
# bin/strings/brute_force_string_searching
# bin/strings/z_function
# bin/ciphers/elliptic_curve_key_exchange
# bin/ciphers/base64_encoding
# bin/ciphers/caesar_cipher
# bin/ciphers/atbash_cipher
# bin/ciphers/vigenere_cipher
# bin/ciphers/a1z26_cipher
# bin/ciphers/hill_cipher
# bin/ciphers/morse_code
# bin/ciphers/xor_cipher
# bin/hash/linear_probing_hash_table
# bin/hash/quadratic_probing_hash_table
# bin/hash/double_hash_hash_table
# bin/hash/sha1
# bin/hash/chaining
# bin/hash/md5
# bin/geometry/line_segment_intersection
# bin/geometry/graham_scan_algorithm
# bin/geometry/jarvis_algorithm
# bin/machine_learning/kohonen_som_topology
# bin/machine_learning/ordinary_least_squares_regressor
# bin/machine_learning/a_star_search
# bin/machine_learning/kohonen_som_trace
# bin/machine_learning/neural_network
# bin/machine_learning/adaline_learning
# bin/math/eulers_totient_function
# bin/math/power_of_two
# bin/math/approximate_pi
# bin/math/n_choose_r
# bin/math/fibonacci_fast
# bin/math/prime_numbers
# bin/math/double_factorial
# bin/math/inv_sqrt
# bin/math/binary_exponent
# bin/math/sum_of_binomial_coefficient
# bin/math/least_common_multiple
# bin/math/complex_numbers
# bin/math/largest_power
# bin/math/area
# bin/math/n_bonacci
# bin/math/lcm_sum
# bin/math/binomial_calculate
# bin/math/volume
# bin/math/perimeter
# bin/math/factorial
# bin/math/modular_exponentiation
# bin/math/power_for_huge_numbers
# bin/math/fibonacci_sum
# bin/math/ncr_modulo_p
# bin/math/fast_power
# bin/math/modular_division
# bin/math/number_of_positive_divisors
# bin/math/fibonacci_matrix_exponentiation
# bin/math/integral_approximation2
# bin/math/sieve_of_eratosthenes
# bin/math/large_factorial
# bin/math/extended_euclid_algorithm
# bin/math/integral_approximation
# bin/math/magic_number
# bin/math/primes_up_to_billion
# bin/math/armstrong_number
# bin/math/gcd_of_n_numbers
# bin/math/sqrt_double
# bin/math/linear_recurrence_matrix
# bin/math/finding_number_of_digits_in_a_number
# bin/math/fibonacci_large
# bin/math/check_amicable_pair
# bin/math/modular_inverse_fermat_little_theorem
# bin/math/miller_rabin
# bin/math/check_factorial
# bin/math/check_prime
# bin/math/gcd_iterative_euclidean
# bin/math/realtime_stats
# bin/math/gcd_recursive_euclidean
# bin/math/fibonacci
# bin/math/vector_cross_product
# bin/math/sum_of_digits
# bin/math/prime_factorization
# bin/math/string_fibonacci
# bin/graphics/spirograph
# bin/search/median_search
# bin/search/ternary_search
# bin/search/jump_search
# bin/search/hash_search
# bin/search/interpolation_search2
# bin/search/linear_search
# bin/search/floyd_cycle_detection_algo
# bin/search/interpolation_search
# bin/search/sublist_search
# bin/search/binary_search
# bin/search/saddleback_search
# bin/search/exponential_search
# bin/search/fibonacci_search
# bin/search/text_search
