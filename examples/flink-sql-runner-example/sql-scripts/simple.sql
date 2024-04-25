-- -------------------------------------------
-- IBM Event Automation
-- exportedDate: 2024-04-25T05:31:50.060+0000
-- flowId: 17bc5c44-63a8-45b7-b77d-feb2cc3f7d31
-- flowName: New EMEA Orders
--
-- Important
--  *) Sensitive credential values are removed from exported SQL.
--  *) Before you deploy this SQL, update the Kafka connector properties and values
--     with the required configuration for the target environment.
-- -------------------------------------------
CREATE TABLE `New Orders`
(
    `id`                           STRING,
    `customer`                     STRING,
    `customerid`                   STRING,
    `description`                  STRING,
    `price`                        DOUBLE,
    `quantity`                     BIGINT,
    `region`                       STRING,
    `ordertime`                    STRING,
    `event_time`                   TIMESTAMP(3) METADATA FROM 'timestamp',
    WATERMARK FOR `event_time` AS `event_time` - INTERVAL '1' MINUTE
)
WITH (
    'connector' = 'kafka',
    'topic' = 'ORDERS.NEW',
    'properties.bootstrap.servers' = 'my-kafka-cluster-kafka-bootstrap.event-automation.svc:9095',
    'scan.startup.mode' = 'earliest-offset',
    'format' = 'json',
    'json.ignore-parse-errors' = 'true',
    'properties.security.protocol' = 'SASL_SSL',
    'properties.sasl.mechanism' = 'SCRAM-SHA-512',
    'properties.ssl.truststore.type' = 'PEM',
    'properties.tls.pemChainIncluded' = 'false',
    'properties.ssl.endpoint.identification.algorithm' = '',
    'properties.ssl.truststore.certificates' = '-----BEGIN CERTIFICATE-----
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
-----END CERTIFICATE-----
,-----BEGIN CERTIFICATE-----
MIIFLTCCAxWgAwIBAgIUIumdfWgU1pcOFp23wHeo4TkUr4owDQYJKoZIhvcNAQENBQAwLTETMBEGA1UECgwKaW8uc3RyaW16aTEWMBQGA1UEAwwNY2x1c3Rlci1jYSB2MDAeFw0yNDA0MTQwMzA2NDFaFw0yNDA3MTMwMzA2NDFaMC0xEzARBgNVBAoMCmlvLnN0cmltemkxFjAUBgNVBAMMDWNsdXN0ZXItY2EgdjAwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDXJndZqRCxHmt8ygn21abcDUK8H1y/GyN5t1JsPgK5Enya6vdnCibSFct5QZemQvDkPk01YEEolXzqid+nIjtpPzDwhMDI30H7sRYzhRFSuuLCpVjBZ7kJQm7QiO7yGw2ALFJZ/vrFrpQ4eXaQFVgpcShn6fLlyLH7Co1qaXEyagPvxYoCarfHgB4gQCzsisDEY0YfKiKuCtoiEdgutWIbbQKAbSb9SGzZ5B0m8SA74IbAnLavUVnFv7WbBPRJT/2CHZLKRVaunBekJDlh25PKmRWxY9R7ZKY1xHq55EFV9yeKM7fsPqR5KCEDe4/UK13WAU9Bp8hWKj5o/6AuFWUH2smhtlbsrcqNNhIzKpGCZGJPJlWxVsrBs9P7fZ2YHEVyi3TizCpS8bFPn7v03nvBmexk96Jv/8NjpTvQMTAbCxBsHzUkLmKMrC80+ZusxshoYmAGnFfTVwV0pqwUHABoyEs2qqTN5nzH18IH5kJQD2zp1P6OnwY2CKCNMjYi2wXSmKgSZ/+x8d74kMT2xi9JiQdDAgZ//wyATWHdj0eotrHIUJknkkxPHKlxPNffI8gq505shPdqpFIFbvbCQOELjR6ndD22ptY9ElJEKpBx803Z9ktb1TGA9uH1wtlFZ3NxtojJZoR7sM9KevDH7xCM5y9FweiQlyODQ2SldnDXHQIDAQABo0UwQzAdBgNVHQ4EFgQUfcGqsXuoCupRNq6tGyRkzscouYMwEgYDVR0TAQH/BAgwBgEB/wIBADAOBgNVHQ8BAf8EBAMCAQYwDQYJKoZIhvcNAQENBQADggIBACdrJ5+D0RbQK/ui6BeQbuDKL2m49Edt9uy+Xffw7HzZnG5HrPsnzNBPsKDbp7abBBL3keEoohbo5gJ930LetSc+NBnDvKbJvfcxqiWZ9lZZAsf9+gbwdB7tt4+SXdYeqQAfuQhFi9LHfo/O7AFHAoU3Ufbbh+n1075EQekGmo7EgwVDa2cGIyAGB7D+aYXJqZKuGHuoVdFH+6FAIvpJD38KHK9jCEWYwHn4ISEJkW2XoQEOk51B3OnyPvYGy6cMHH7WBJCXF6oExWZvx2Ind3JcRYtM7olZBN0h33ukiZZ1/MFqIbYo6cMcvim/8267n7RniLOZRawHeuN1xJ2hdo+NCNGbCFyJ8JDURxTp/MlwRFl4YaDRYQqhp57C+7kQJyl7+u6uDpLiC8dEnG3RA4EfI1Md4zX9p8Ku/wdmMIi9VuyLLgYnCOW4qjenelr5hkq1qeV66b8gBYAjNB80k/ksMA/8fylBFiOyQxp1KxSR2y2KKIzdRy3O0wC7UhiDlhuEGPtQ3FQovsMck91D45CxrB8JbKtfzy9RVAM/0j+43gzd0eTc+2HqifAc2S23bQC5g5utHvOL5s5WiHvQFfgF0Z16tXzNvUa9QhNX2BLDeU9e5ndiqPE6eAbEq+aa2JK52eAoWik4ivhI/Dnj4NHyGVUDid1+DcOKvEd0F86Q
-----END CERTIFICATE-----
',
    'properties.sasl.jaas.config' = 'org.apache.kafka.common.security.scram.ScramLoginModule required username="orderuser" password="n4G3rb3NamljFQhsAa853gRORAMhvEmo";'
);

CREATE TEMPORARY VIEW `EMEA Orders` AS
SELECT * FROM `New Orders`
WHERE `region` LIKE 'EMEA';

CREATE TABLE `Publish EMEA Orders`
(
    `id`                           STRING,
    `customer`                     STRING,
    `customerid`                   STRING,
    `description`                  STRING,
    `price`                        DOUBLE,
    `quantity`                     BIGINT,
    `region`                       STRING,
    `ordertime`                    STRING,
    `event_time`                   TIMESTAMP(6)
)
WITH (
    'connector' = 'kafka',
    'topic' = 'ORDERS.NEW.EMEA',
    'properties.bootstrap.servers' = 'my-kafka-cluster-kafka-bootstrap.event-automation.svc:9095',
    'scan.startup.mode' = 'earliest-offset',
    'format' = 'json',
    'properties.security.protocol' = 'SASL_SSL',
    'properties.sasl.mechanism' = 'SCRAM-SHA-512',
    'properties.ssl.truststore.type' = 'PEM',
    'properties.tls.pemChainIncluded' = 'false',
    'properties.ssl.endpoint.identification.algorithm' = '',
    'properties.ssl.truststore.certificates' = '-----BEGIN CERTIFICATE-----
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
-----END CERTIFICATE-----
,-----BEGIN CERTIFICATE-----
MIIFLTCCAxWgAwIBAgIUIumdfWgU1pcOFp23wHeo4TkUr4owDQYJKoZIhvcNAQENBQAwLTETMBEGA1UECgwKaW8uc3RyaW16aTEWMBQGA1UEAwwNY2x1c3Rlci1jYSB2MDAeFw0yNDA0MTQwMzA2NDFaFw0yNDA3MTMwMzA2NDFaMC0xEzARBgNVBAoMCmlvLnN0cmltemkxFjAUBgNVBAMMDWNsdXN0ZXItY2EgdjAwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDXJndZqRCxHmt8ygn21abcDUK8H1y/GyN5t1JsPgK5Enya6vdnCibSFct5QZemQvDkPk01YEEolXzqid+nIjtpPzDwhMDI30H7sRYzhRFSuuLCpVjBZ7kJQm7QiO7yGw2ALFJZ/vrFrpQ4eXaQFVgpcShn6fLlyLH7Co1qaXEyagPvxYoCarfHgB4gQCzsisDEY0YfKiKuCtoiEdgutWIbbQKAbSb9SGzZ5B0m8SA74IbAnLavUVnFv7WbBPRJT/2CHZLKRVaunBekJDlh25PKmRWxY9R7ZKY1xHq55EFV9yeKM7fsPqR5KCEDe4/UK13WAU9Bp8hWKj5o/6AuFWUH2smhtlbsrcqNNhIzKpGCZGJPJlWxVsrBs9P7fZ2YHEVyi3TizCpS8bFPn7v03nvBmexk96Jv/8NjpTvQMTAbCxBsHzUkLmKMrC80+ZusxshoYmAGnFfTVwV0pqwUHABoyEs2qqTN5nzH18IH5kJQD2zp1P6OnwY2CKCNMjYi2wXSmKgSZ/+x8d74kMT2xi9JiQdDAgZ//wyATWHdj0eotrHIUJknkkxPHKlxPNffI8gq505shPdqpFIFbvbCQOELjR6ndD22ptY9ElJEKpBx803Z9ktb1TGA9uH1wtlFZ3NxtojJZoR7sM9KevDH7xCM5y9FweiQlyODQ2SldnDXHQIDAQABo0UwQzAdBgNVHQ4EFgQUfcGqsXuoCupRNq6tGyRkzscouYMwEgYDVR0TAQH/BAgwBgEB/wIBADAOBgNVHQ8BAf8EBAMCAQYwDQYJKoZIhvcNAQENBQADggIBACdrJ5+D0RbQK/ui6BeQbuDKL2m49Edt9uy+Xffw7HzZnG5HrPsnzNBPsKDbp7abBBL3keEoohbo5gJ930LetSc+NBnDvKbJvfcxqiWZ9lZZAsf9+gbwdB7tt4+SXdYeqQAfuQhFi9LHfo/O7AFHAoU3Ufbbh+n1075EQekGmo7EgwVDa2cGIyAGB7D+aYXJqZKuGHuoVdFH+6FAIvpJD38KHK9jCEWYwHn4ISEJkW2XoQEOk51B3OnyPvYGy6cMHH7WBJCXF6oExWZvx2Ind3JcRYtM7olZBN0h33ukiZZ1/MFqIbYo6cMcvim/8267n7RniLOZRawHeuN1xJ2hdo+NCNGbCFyJ8JDURxTp/MlwRFl4YaDRYQqhp57C+7kQJyl7+u6uDpLiC8dEnG3RA4EfI1Md4zX9p8Ku/wdmMIi9VuyLLgYnCOW4qjenelr5hkq1qeV66b8gBYAjNB80k/ksMA/8fylBFiOyQxp1KxSR2y2KKIzdRy3O0wC7UhiDlhuEGPtQ3FQovsMck91D45CxrB8JbKtfzy9RVAM/0j+43gzd0eTc+2HqifAc2S23bQC5g5utHvOL5s5WiHvQFfgF0Z16tXzNvUa9QhNX2BLDeU9e5ndiqPE6eAbEq+aa2JK52eAoWik4ivhI/Dnj4NHyGVUDid1+DcOKvEd0F86Q
-----END CERTIFICATE-----
',
    'properties.sasl.jaas.config' = 'org.apache.kafka.common.security.scram.ScramLoginModule required username="orderuser" password="n4G3rb3NamljFQhsAa853gRORAMhvEmo";'
);

INSERT INTO `Publish EMEA Orders` SELECT * FROM `EMEA Orders`;
-- -------------------------------------------