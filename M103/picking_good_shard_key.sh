# High Cardinality: many posibles unique shard key values

# High frequency: low repetition of a given unique shard key value

# Non-monotonically: No linear change in values

# Unsharding a collection is hard, test in stg enviorements

# Read isolation, is fast if every query contains the shard key slow if not