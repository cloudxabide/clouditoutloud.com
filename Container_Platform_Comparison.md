# Container Platform Comparison

Disclaimer:  I work @AWS.  That said, these are my own opinions.  
And that ^^^^ said...

* I am trying to remain objective as I had previously worked at Red Hat (as a Delivery Architect helping customers learn and deploy OpenShift in different locales (on-prem, Pub Cloud (AWS and GovCloud))
* I still firmly believe in OpenSource and related ideals (avoiding "vendor lock-in" where possible, etc..)
* If I am wrong, feel free to call me on it.  I have limited exposure to some of these approaches or offerings and can only base my opinion on what I find.


## Simple high-level comparison

| Function                  | AWS          | Red Hat                    | Other |
|:--------------------------|:-------------|:---------------------------|:------|
| IDE                       | Cloud9       | Dev Spaces (FKA CodeReady) | |
| Container Builds          | *            | S2I                        | ? | 
| Customer Hardware Install | EKS Anywhere | OCP (native)               | Rancher <BR> K3s <BR> MiniKube |
| Container-Optimized OS    | Bottlerocket | CoreOS                     | |


