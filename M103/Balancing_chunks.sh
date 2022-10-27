
Balancer

# - Balancer responsible for evenly distributing chunks across the sharded cluster
# - Balancer runs on Primary member of config server replica set
# - Balancer is an automatic process and requires minimal user configuration

# Start the balancer:
sh.startBalancer(timeout, interval)

# Stop the balancer:
sh.stopBalancer(timeout, interval)

# Enable/disable the balancer:
sh.setBalancerState(boolean)