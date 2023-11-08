### Syslog Service Detailed Design for XYZ Corp

---

#### Overview

Designed to offer a centralized Syslog service tailored for XYZ Corp's multi-state operations. The architecture provides custom configurations for three distinct environments: Production (Prod), Testing (Test), and Development (Dev).

---

#### Options to Consume Service

## Option 1
This has now changed!

###### Prod Environment

##### Direct Syslog Feed (Port 514 UDP/TCP)

- **Architecture**
  - Dual primary syslog servers for high availability
  - ElasticSearch cluster for data storage
  
- **Security**
  - Log data encrypted at rest
  - Access Control through Windows AD

- **Retention and Backup**
  - Log retention: 90 days
  - Off-site backup every 24 hours

<center>

| Parameter          | Value                  |
|--------------------|------------------------|
| Syslog Servers     | 2                      |
| Data Storage       | ElasticSearch Cluster  |
| Log Retention      | 90 days                |
| Backup Frequency   | Off-site every 24 hours|

</center>

###### Test Environment

- **Architecture**
  - Single primary syslog server
  - ElasticSearch for data storage
  
- **Security**
  - Access Control through Windows AD

- **Retention and Backup**
  - Log retention: 30 days
  - No off-site backup

| Parameter          | Value                  |
|--------------------|------------------------|
| Syslog Server      | 1                      |
| Data Storage       | ElasticSearch          |
| Log Retention      | 30 days                |
| Backup Frequency   | None                   |

###### Dev Environment

- **Architecture**
  - Single primary syslog server
  - ElasticSearch for data storage

- **Security**
  - Rate-limiting on API

- **Retention and Backup**
  - Log retention: 7 days
  - No backup

| Parameter          | Value                  |
|--------------------|------------------------|
| Syslog Server      | 1                      |
| Data Storage       | ElasticSearch          |
| Log Retention      | 7 days                 |
| Backup Frequency   | None                   |

##### 2. RESTful API

###### Prod Environment

- **Auth**
  - API keys or OAuth2 tokens

###### Test Environment

- **Auth**
  - API keys

###### Dev Environment

- **Auth**
  - OAuth2 tokens

---

