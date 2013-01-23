REDIS High Availability with Sentinel
=====================================

### Danny Gershman Principal Engineer @ Cinchcast (@dannygnj)

1. What is Redis? http://redis.io ![Redis Image](http://redis.io/images/redis.png)
2. Cluster?
3. Spec http://redis.io/topics/cluster-spec
4. Unstable Development Branch https://github.com/antirez/redis

![Unstable Mutation](http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=941&type=card)

5. Challenges
6. Sentinel (Monitoring - Notification - Auto Failover)
7. Starting Sentinel 

```
redis-server sentinel.conf --sentinel
```

8. Monitoring/Failover Demo
9. Notification Demo
10. [https://github.com/radius314/high-availability-demo/](https://github.com/radius314/high-availability-demo/)

