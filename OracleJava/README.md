Oracle Java on Docker
=====
This repository contains a sample Docker configuration to facilitate installation and environment setup for DevOps users. This project includes a Dockerfile for Server JRE 8 and for JDK 11 based on Oracle Linux.

Oracle Java Server JRE provides the features from Oracle Java JDK commonly required for server-side applications (i.e. Running a Java EE application server). For more information about Server JRE, visit the [Understanding the Server JRE blog entry](https://blogs.oracle.com/java-platform-group/understanding-the-server-jre) from the Java Product Management team.

## Building the Java 11 (JDK) base image
[Download JDK 11](https://www.oracle.com/technetwork/java/javase/downloads/jdk11-downloads-5066655.html) `.tar.gz` file and drop it inside the folder `../OracleJava/java-11`.

Build it using:

```
$ cd ../OracleJava/java-11
$ docker build -t oracle/jdk:11 .
```


## Building the Java 8 (Server JRE) base image
[Download Server JRE 8](https://www.oracle.com/technetwork/java/javase/downloads/server-jre8-downloads-2133154.html) `.tar.gz` file and drop it inside the folder `../OracleJava/java-8`.

Build it using:

```
$ cd ../OracleJava/java-8
$ docker build -t oracle/serverjre:8 .
```

## License
To download and run the Oracle JDK, regardless of inside or outside a Docker container, you must download the binary from the Oracle website and accept the license indicated on that page.

All scripts and files hosted in this project and GitHub [`docker/OracleJava`](./) repository, required to build the Docker images are, unless otherwise noted, released under the [UPL 1.0](https://oss.oracle.com/licenses/upl/) license.

## Customer Support
We support JDK 8 (Server JRE) and JDK 11 when running on certified operating systems in a Docker container. For additional details on the JDK Certified System Configurations, please refer to the [Oracle Java SE Certified System Configuration Pages](https://www.oracle.com/technetwork/java/javaseproducts/documentation/index.html#sysconfig).
