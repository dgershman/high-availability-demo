REDIS High Availability with Sentinel
=====================================

### Danny Gershman Principal Engineer @ Cinchcast (@dannygnj)

* What is Redis? http://redis.io ![Redis Image](http://redis.io/images/redis.png)
* Cluster?
* Spec http://redis.io/topics/cluster-spec
* Unstable Development Branch https://github.com/antirez/redis

![Unstable Mutation](http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=941&type=card)

* Challenges
* Sentinel (Monitoring - Notification - Auto Failover)
* Starting Sentinel 

```
redis-server sentinel.conf --sentinel
```

* Monitoring/Failover Demo
* Notification Demo
* [https://github.com/radius314/high-availability-demo/](https://github.com/radius314/high-availability-demo/)

