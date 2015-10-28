# Lybica

`Lybica` is platform designed for large software testing and delivery.

## Application Architecture

The application architecture is illustrated as below:

![architecture](assets/lybica_app_structure.png)

1. The website is the only interface for the user until now.
1. The website communicate with backend services via RESTful API.
1. Agents running on execution nodes will communicate with backend services, and execute the tasks.
1. Agent will start `runner` to execute the task, and the runner will communicate with the `SUT` (system under testing).
1. `MongoDB` is used as the primary database.
1. Unified lock services is optional.
1. The huge logs generated during tasks will be saved with `File Service`, it may provide HDFS backed to store, the `File Service` will communicate with Hadoop clusters.
