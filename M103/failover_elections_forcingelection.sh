# Lecture Instructions

# Storing replica set configuration as a variable cfg:
cfg = rs.conf()


# Setting the priority of a node to 0, so it cannot become primary (making the node "passive"):
cfg.members[2].priority = 0


# Updating our replica set to use the new configuration cfg:
rs.reconfig(cfg)


# Checking the new topology of our set:
rs.isMaster()

# Forcing an election in this replica set (although in this case, we rigged the election so only one node could become primary):
rs.stepDown()

# Checking the topology of our set after the election:
rs.isMaster()

wri