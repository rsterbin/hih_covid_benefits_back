--
-- There was a bug that caused my answers table to get deleted on dev, so here's a rebuild from prod as of yesterday.
--

TRUNCATE TABLE responses CASCADE;

INSERT INTO responses (visitor_id, submitted) VALUES
    ('a439c9fe-181c-41c4-891f-6d60d4969453', '2020-06-14T19:38:54.531Z'),
    ('0bbbdc71-250d-4292-aa8f-2032deb776f3', '2020-07-16T22:31:46.102Z'),
    ('11613119-a6ec-45e4-b23c-7c4bd0bc1913', '2020-07-18T01:09:29.642Z'),
    ('e3a79208-c6e6-41dd-a17d-6028780f35eb', '2020-07-20T13:21:01.421Z'),
    ('ef034b64-84db-4f64-9cc7-556d6ced8871', '2020-07-20T17:00:45.559Z'),
    ('e58d430d-783b-4807-b021-b0cc9d450033', '2020-07-20T20:21:45.668Z'),
    ('c43a6773-0c6e-49db-9601-f71118642ff1', '2020-07-20T20:26:25.180Z'),
    ('126939b2-4a1d-4697-bf81-c2244af28d8a', '2020-07-20T20:50:51.236Z'),
    ('492b7b5c-17d0-4ee5-a283-d0c70813b863', '2020-07-24T21:04:14.606Z'),
    ('db182006-5d0f-4724-a22f-5cb9f1cf1efd', '2020-07-27T15:17:36.396Z'),
    ('75abc97e-d39f-42b5-95b4-8f075c92b662', '2020-07-28T16:40:45.597Z'),
    ('17f1672b-6066-4435-9d84-21e46c520a4a', '2020-06-17T20:21:03.452Z'),
    ('afa06c94-3e43-4b5e-9529-11d603525113', '2020-07-28T17:46:14.969Z'),
    ('a614646e-d299-4789-9c00-02de5e3b701b', '2020-07-28T17:49:34.224Z'),
    ('8f478e95-32e1-4b5d-a008-718fa5787a01', '2020-07-28T19:19:21.705Z'),
    ('91f5bd86-e9da-406e-8ee6-b0cb6d79b057', '2020-07-28T19:20:34.406Z'),
    ('0c49a9ca-b066-4a0e-982e-694396b5acc9', '2020-08-04T13:18:32.154Z'),
    ('61c41dc7-b185-417b-8a0f-ca36cb903aff', '2020-08-04T13:29:13.854Z'),
    ('2edc11b7-ca9c-45a5-81d2-8f236d53b9e4', '2020-08-04T13:32:57.061Z'),
    ('b68e72ad-7dfd-4bc0-a252-791c463cc3d3', '2020-08-04T13:49:51.306Z'),
    ('6f4142fa-5f68-4bc4-87c9-adbe9844679d', '2020-08-04T14:06:34.196Z'),
    ('96646d3f-daee-4ff4-80d8-1ed58edb5fb9', '2020-08-04T14:34:03.286Z'),
    ('f94bb048-571d-42ea-9137-2d29bc14985b', '2020-07-08T04:46:29.197Z'),
    ('a14fc72e-decf-4a40-8ca7-0f916cddaa73', '2020-08-04T14:47:10.855Z'),
    ('40857a47-ff40-4e3c-a4bc-613a416faa9a', '2020-08-04T15:14:34.447Z'),
    ('6ff3d6d7-ac3f-4ca1-b4da-f270fc2c0dc5', '2020-08-04T16:06:59.146Z'),
    ('7aa8d34f-398f-40a4-84ee-8c94287a62f9', '2020-08-04T16:10:17.780Z'),
    ('4ab0f022-beaf-406f-868a-66d5cdd75e98', '2020-08-05T00:20:24.975Z'),
    ('ef4adeb1-2ecd-4e1b-b78a-b4a62bfb4bbd', '2020-08-05T15:54:14.017Z'),
    ('81263dc0-b5bd-4a25-9344-53bffcea6597', '2020-08-05T16:38:48.181Z'),
    ('b2d2b209-dcac-4c15-8a0d-3b4a485bd7c6', '2020-08-05T16:54:05.900Z'),
    ('94030fde-bd9c-44bd-90eb-ebf373121441', '2020-08-05T17:36:43.222Z'),
    ('00a7f32a-953a-44f4-aeb4-7df438723f57', '2020-08-05T19:06:39.316Z'),
    ('168492f2-e402-4c00-8826-68a795cec409', '2020-07-08T16:50:00.333Z'),
    ('d076734b-35e4-436e-88e1-af049df33caa', '2020-08-05T19:33:52.661Z'),
    ('e211f643-986e-4e93-924c-076ffd2ad977', '2020-08-05T20:47:01.371Z'),
    ('930e5072-1732-45eb-a2d5-aacd5cc756b5', '2020-08-05T21:06:16.997Z'),
    ('59a06cef-e06b-4750-9765-4cc32ffc2e3d', '2020-08-05T21:25:33.622Z'),
    ('4ac23d86-03ef-4d50-83a6-19cb60fba87b', '2020-08-05T21:42:32.717Z'),
    ('ee07ebee-149f-4ce0-bb42-f79863a79f5a', '2020-08-05T22:36:50.175Z'),
    ('7823af03-6117-465c-9830-1ff33f0f3977', '2020-08-06T01:34:56.599Z'),
    ('00715d4d-7001-4b0c-8bdb-920cacd1bc76', '2020-08-06T04:41:28.617Z'),
    ('eb04b2e1-c49b-4780-b5b0-a6367ff2147b', '2020-08-06T14:04:38.275Z'),
    ('99e1d86f-e7ec-4e81-b038-06bc6fa3b367', '2020-08-06T15:39:26.947Z'),
    ('802c8a49-058e-4be8-99ef-11087b50a70e', '2020-07-08T16:51:19.068Z'),
    ('fea8561b-98f3-4008-9925-061aae71875b', '2020-08-07T02:15:25.448Z'),
    ('3c879b27-7050-427e-ae92-bd91bf8e0ad9', '2020-08-10T19:01:54.140Z'),
    ('453e284c-c242-4f8c-b755-506e16334cb0', '2020-08-10T19:15:16.596Z'),
    ('d7c3765c-f399-4a2a-9fb2-d90538df869a', '2020-08-11T20:51:24.123Z'),
    ('a11e46f1-79bc-4c5a-ae9b-258ba794d2ca', '2020-08-15T21:44:35.632Z'),
    ('18925e33-d3b4-48ac-aa9b-63fede5f51df', '2020-08-15T21:47:02.577Z'),
    ('a6cd809e-0d95-4ec3-b7b5-7d427b66e946', '2020-08-15T21:48:52.498Z'),
    ('c53778f1-0869-416a-861d-c6164b1f2493', '2020-08-15T21:49:44.632Z'),
    ('80fef390-dddf-4ebb-9740-1deeadd11fda', '2020-09-04T00:57:17.997Z'),
    ('1e0f7b81-1982-4019-a096-39dc3ebc1bb4', '2020-09-04T00:58:11.497Z'),
    ('e1d54a96-b3f8-423e-888d-894f704996d5', '2020-07-08T23:17:29.917Z'),
    ('1eb89f13-f812-4c4c-ba3e-9dd270ea3c45', '2020-09-04T01:00:20.095Z'),
    ('34944229-238e-475e-8f30-ab59298f3944', '2020-09-08T19:50:12.014Z'),
    ('472bd2b6-8275-49ef-9c74-a1ca0dcd2577', '2020-09-08T21:46:47.778Z'),
    ('a3956458-ee7f-417d-af62-7422fd3d74b5', '2020-09-09T01:21:25.896Z'),
    ('e7f3798e-19e4-4e83-a4f1-f3804804d710', '2020-09-10T15:04:51.650Z'),
    ('ca277054-b3b9-4f97-9a66-4a425be7b372', '2020-09-10T15:05:15.009Z'),
    ('f691aef9-cad7-4737-9890-8a5ec1d9ace9', '2020-09-11T16:27:53.410Z'),
    ('d7e94c3e-3d0b-4d01-b987-966e16c86e29', '2020-07-10T03:02:17.628Z'),
    ('39dac787-f4d3-4515-8658-bdf2473be3a3', '2020-07-10T05:46:35.222Z'),
    ('11b8b0dd-c061-4f2e-bee2-475be1d2257e', '2020-07-16T22:30:54.874Z');

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'NANNY' FROM responses WHERE visitor_id = 'a439c9fe-181c-41c4-891f-6d60d4969453';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = 'a439c9fe-181c-41c4-891f-6d60d4969453';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'NO' FROM responses WHERE visitor_id = 'a439c9fe-181c-41c4-891f-6d60d4969453';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', '40 OR MORE' FROM responses WHERE visitor_id = 'a439c9fe-181c-41c4-891f-6d60d4969453';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'LESS THAN ONE YEAR' FROM responses WHERE visitor_id = 'a439c9fe-181c-41c4-891f-6d60d4969453';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = 'a439c9fe-181c-41c4-891f-6d60d4969453';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'YES' FROM responses WHERE visitor_id = 'a439c9fe-181c-41c4-891f-6d60d4969453';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'YES' FROM responses WHERE visitor_id = 'a439c9fe-181c-41c4-891f-6d60d4969453';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'YES' FROM responses WHERE visitor_id = 'a439c9fe-181c-41c4-891f-6d60d4969453';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'YES' FROM responses WHERE visitor_id = 'a439c9fe-181c-41c4-891f-6d60d4969453';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'HOME ATTENDANT' FROM responses WHERE visitor_id = '0bbbdc71-250d-4292-aa8f-2032deb776f3';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = '0bbbdc71-250d-4292-aa8f-2032deb776f3';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, IN COMPLIANCE' FROM responses WHERE visitor_id = '0bbbdc71-250d-4292-aa8f-2032deb776f3';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', '40 OR MORE' FROM responses WHERE visitor_id = '0bbbdc71-250d-4292-aa8f-2032deb776f3';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'ONE YEAR OR MORE' FROM responses WHERE visitor_id = '0bbbdc71-250d-4292-aa8f-2032deb776f3';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = '0bbbdc71-250d-4292-aa8f-2032deb776f3';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'YES' FROM responses WHERE visitor_id = '0bbbdc71-250d-4292-aa8f-2032deb776f3';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'YES' FROM responses WHERE visitor_id = '0bbbdc71-250d-4292-aa8f-2032deb776f3';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'YES' FROM responses WHERE visitor_id = '0bbbdc71-250d-4292-aa8f-2032deb776f3';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'YES'
FROM responses WHERE visitor_id = '0bbbdc71-250d-4292-aa8f-2032deb776f3';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'NANNY' FROM responses WHERE visitor_id = '11613119-a6ec-45e4-b23c-7c4bd0bc1913';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = '11613119-a6ec-45e4-b23c-7c4bd0bc1913';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, IN COMPLIANCE' FROM responses WHERE visitor_id = '11613119-a6ec-45e4-b23c-7c4bd0bc1913';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', '40 OR MORE' FROM responses WHERE visitor_id = '11613119-a6ec-45e4-b23c-7c4bd0bc1913';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'ONE YEAR OR MORE' FROM responses WHERE visitor_id = '11613119-a6ec-45e4-b23c-7c4bd0bc1913';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = '11613119-a6ec-45e4-b23c-7c4bd0bc1913';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'YES' FROM responses WHERE visitor_id = '11613119-a6ec-45e4-b23c-7c4bd0bc1913';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = '11613119-a6ec-45e4-b23c-7c4bd0bc1913';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'YES' FROM responses WHERE visitor_id = '11613119-a6ec-45e4-b23c-7c4bd0bc1913';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'YES' FROM responses WHERE visitor_id = '11613119-a6ec-45e4-b23c-7c4bd0bc1913';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'NANNY' FROM responses WHERE visitor_id = 'e3a79208-c6e6-41dd-a17d-6028780f35eb';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = 'e3a79208-c6e6-41dd-a17d-6028780f35eb';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, IN COMPLIANCE' FROM responses WHERE visitor_id = 'e3a79208-c6e6-41dd-a17d-6028780f35eb';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', '40 OR MORE' FROM responses WHERE visitor_id = 'e3a79208-c6e6-41dd-a17d-6028780f35eb';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'ONE YEAR OR MORE' FROM responses WHERE visitor_id = 'e3a79208-c6e6-41dd-a17d-6028780f35eb';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = 'e3a79208-c6e6-41dd-a17d-6028780f35eb';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'NO' FROM responses WHERE visitor_id = 'e3a79208-c6e6-41dd-a17d-6028780f35eb';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'YES' FROM responses WHERE visitor_id = 'e3a79208-c6e6-41dd-a17d-6028780f35eb';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'YES' FROM responses WHERE visitor_id = 'e3a79208-c6e6-41dd-a17d-6028780f35eb';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'YES' FROM responses WHERE visitor_id = 'e3a79208-c6e6-41dd-a17d-6028780f35eb';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'NANNY' FROM responses WHERE visitor_id = 'ef034b64-84db-4f64-9cc7-556d6ced8871';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = 'ef034b64-84db-4f64-9cc7-556d6ced8871';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, IN COMPLIANCE' FROM responses WHERE visitor_id = 'ef034b64-84db-4f64-9cc7-556d6ced8871';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', '40 OR MORE' FROM responses WHERE visitor_id = 'ef034b64-84db-4f64-9cc7-556d6ced8871';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'ONE YEAR OR MORE' FROM responses WHERE visitor_id = 'ef034b64-84db-4f64-9cc7-556d6ced8871';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = 'ef034b64-84db-4f64-9cc7-556d6ced8871';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'YES' FROM responses WHERE visitor_id = 'ef034b64-84db-4f64-9cc7-556d6ced8871';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'YES' FROM responses WHERE visitor_id = 'ef034b64-84db-4f64-9cc7-556d6ced8871';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'YES' FROM responses WHERE visitor_id = 'ef034b64-84db-4f64-9cc7-556d6ced8871';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'YES' FROM responses WHERE visitor_id = 'ef034b64-84db-4f64-9cc7-556d6ced8871';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'NANNY' FROM responses WHERE visitor_id = 'e58d430d-783b-4807-b021-b0cc9d450033';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'YES' FROM responses WHERE visitor_id = 'e58d430d-783b-4807-b021-b0cc9d450033';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, IN COMPLIANCE' FROM responses WHERE visitor_id = 'e58d430d-783b-4807-b021-b0cc9d450033';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', 'UNDER 40' FROM responses WHERE visitor_id = 'e58d430d-783b-4807-b021-b0cc9d450033';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'LESS THAN ONE YEAR' FROM responses WHERE visitor_id = 'e58d430d-783b-4807-b021-b0cc9d450033';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', 'UNDER 80' FROM responses WHERE visitor_id = 'e58d430d-783b-4807-b021-b0cc9d450033';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'YES' FROM responses WHERE visitor_id = 'e58d430d-783b-4807-b021-b0cc9d450033';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'YES' FROM responses WHERE visitor_id = 'e58d430d-783b-4807-b021-b0cc9d450033';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'YES' FROM responses WHERE visitor_id = 'e58d430d-783b-4807-b021-b0cc9d450033';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'YES'
FROM responses WHERE visitor_id = 'e58d430d-783b-4807-b021-b0cc9d450033';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'NANNY' FROM responses WHERE visitor_id = 'c43a6773-0c6e-49db-9601-f71118642ff1';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = 'c43a6773-0c6e-49db-9601-f71118642ff1';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, IN COMPLIANCE' FROM responses WHERE visitor_id = 'c43a6773-0c6e-49db-9601-f71118642ff1';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', '40 OR MORE' FROM responses WHERE visitor_id = 'c43a6773-0c6e-49db-9601-f71118642ff1';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'ONE YEAR OR MORE' FROM responses WHERE visitor_id = 'c43a6773-0c6e-49db-9601-f71118642ff1';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = 'c43a6773-0c6e-49db-9601-f71118642ff1';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'YES' FROM responses WHERE visitor_id = 'c43a6773-0c6e-49db-9601-f71118642ff1';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'YES' FROM responses WHERE visitor_id = 'c43a6773-0c6e-49db-9601-f71118642ff1';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'YES' FROM responses WHERE visitor_id = 'c43a6773-0c6e-49db-9601-f71118642ff1';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'YES'
FROM responses WHERE visitor_id = 'c43a6773-0c6e-49db-9601-f71118642ff1';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'NANNY' FROM responses WHERE visitor_id = '126939b2-4a1d-4697-bf81-c2244af28d8a';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = '126939b2-4a1d-4697-bf81-c2244af28d8a';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, IN COMPLIANCE' FROM responses WHERE visitor_id = '126939b2-4a1d-4697-bf81-c2244af28d8a';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', '40 OR MORE' FROM responses WHERE visitor_id = '126939b2-4a1d-4697-bf81-c2244af28d8a';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'ONE YEAR OR MORE' FROM responses WHERE visitor_id = '126939b2-4a1d-4697-bf81-c2244af28d8a';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = '126939b2-4a1d-4697-bf81-c2244af28d8a';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'YES' FROM responses WHERE visitor_id = '126939b2-4a1d-4697-bf81-c2244af28d8a';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'YES' FROM responses WHERE visitor_id = '126939b2-4a1d-4697-bf81-c2244af28d8a';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'YES' FROM responses WHERE visitor_id = '126939b2-4a1d-4697-bf81-c2244af28d8a';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'YES'
FROM responses WHERE visitor_id = '126939b2-4a1d-4697-bf81-c2244af28d8a';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'NANNY' FROM responses WHERE visitor_id = '492b7b5c-17d0-4ee5-a283-d0c70813b863';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'YES' FROM responses WHERE visitor_id = '492b7b5c-17d0-4ee5-a283-d0c70813b863';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, IN COMPLIANCE' FROM responses WHERE visitor_id = '492b7b5c-17d0-4ee5-a283-d0c70813b863';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', 'UNDER 40' FROM responses WHERE visitor_id = '492b7b5c-17d0-4ee5-a283-d0c70813b863';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'LESS THAN ONE YEAR' FROM responses WHERE visitor_id = '492b7b5c-17d0-4ee5-a283-d0c70813b863';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = '492b7b5c-17d0-4ee5-a283-d0c70813b863';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'YES' FROM responses WHERE visitor_id = '492b7b5c-17d0-4ee5-a283-d0c70813b863';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'YES' FROM responses WHERE visitor_id = '492b7b5c-17d0-4ee5-a283-d0c70813b863';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'NO' FROM responses WHERE visitor_id = '492b7b5c-17d0-4ee5-a283-d0c70813b863';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'YES'
FROM responses WHERE visitor_id = '492b7b5c-17d0-4ee5-a283-d0c70813b863';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'NANNY' FROM responses WHERE visitor_id = 'db182006-5d0f-4724-a22f-5cb9f1cf1efd';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = 'db182006-5d0f-4724-a22f-5cb9f1cf1efd';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, IN COMPLIANCE' FROM responses WHERE visitor_id = 'db182006-5d0f-4724-a22f-5cb9f1cf1efd';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', 'UNDER 40' FROM responses WHERE visitor_id = 'db182006-5d0f-4724-a22f-5cb9f1cf1efd';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'ONE YEAR OR MORE' FROM responses WHERE visitor_id = 'db182006-5d0f-4724-a22f-5cb9f1cf1efd';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = 'db182006-5d0f-4724-a22f-5cb9f1cf1efd';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'YES' FROM responses WHERE visitor_id = 'db182006-5d0f-4724-a22f-5cb9f1cf1efd';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = 'db182006-5d0f-4724-a22f-5cb9f1cf1efd';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'YES' FROM responses WHERE visitor_id = 'db182006-5d0f-4724-a22f-5cb9f1cf1efd';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'YES'
FROM responses WHERE visitor_id = 'db182006-5d0f-4724-a22f-5cb9f1cf1efd';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'NANNY' FROM responses WHERE visitor_id = '75abc97e-d39f-42b5-95b4-8f075c92b662';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = '75abc97e-d39f-42b5-95b4-8f075c92b662';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, IN COMPLIANCE' FROM responses WHERE visitor_id = '75abc97e-d39f-42b5-95b4-8f075c92b662';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', '40 OR MORE' FROM responses WHERE visitor_id = '75abc97e-d39f-42b5-95b4-8f075c92b662';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'ONE YEAR OR MORE' FROM responses WHERE visitor_id = '75abc97e-d39f-42b5-95b4-8f075c92b662';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = '75abc97e-d39f-42b5-95b4-8f075c92b662';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'NO' FROM responses WHERE visitor_id = '75abc97e-d39f-42b5-95b4-8f075c92b662';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = '75abc97e-d39f-42b5-95b4-8f075c92b662';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'YES' FROM responses WHERE visitor_id = '75abc97e-d39f-42b5-95b4-8f075c92b662';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'YES'
FROM responses WHERE visitor_id = '75abc97e-d39f-42b5-95b4-8f075c92b662';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'NANNY' FROM responses WHERE visitor_id = '17f1672b-6066-4435-9d84-21e46c520a4a';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = '17f1672b-6066-4435-9d84-21e46c520a4a';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, IN COMPLIANCE' FROM responses WHERE visitor_id = '17f1672b-6066-4435-9d84-21e46c520a4a';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', 'UNDER 40' FROM responses WHERE visitor_id = '17f1672b-6066-4435-9d84-21e46c520a4a';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'LESS THAN ONE YEAR' FROM responses WHERE visitor_id = '17f1672b-6066-4435-9d84-21e46c520a4a';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = '17f1672b-6066-4435-9d84-21e46c520a4a';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'NO' FROM responses WHERE visitor_id = '17f1672b-6066-4435-9d84-21e46c520a4a';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = '17f1672b-6066-4435-9d84-21e46c520a4a';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'YES' FROM responses WHERE visitor_id = '17f1672b-6066-4435-9d84-21e46c520a4a';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'YES' FROM responses WHERE visitor_id = '17f1672b-6066-4435-9d84-21e46c520a4a';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'NANNY' FROM responses WHERE visitor_id = 'afa06c94-3e43-4b5e-9529-11d603525113';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'YES' FROM responses WHERE visitor_id = 'afa06c94-3e43-4b5e-9529-11d603525113';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, IN COMPLIANCE' FROM responses WHERE visitor_id = 'afa06c94-3e43-4b5e-9529-11d603525113';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', 'UNDER 40' FROM responses WHERE visitor_id = 'afa06c94-3e43-4b5e-9529-11d603525113';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'LESS THAN SIX MONTHS' FROM responses WHERE visitor_id = 'afa06c94-3e43-4b5e-9529-11d603525113';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', 'UNDER 80' FROM responses WHERE visitor_id = 'afa06c94-3e43-4b5e-9529-11d603525113';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'YES' FROM responses WHERE visitor_id = 'afa06c94-3e43-4b5e-9529-11d603525113';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'YES' FROM responses WHERE visitor_id = 'afa06c94-3e43-4b5e-9529-11d603525113';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'YES' FROM responses WHERE visitor_id = 'afa06c94-3e43-4b5e-9529-11d603525113';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'YES' FROM responses WHERE visitor_id = 'afa06c94-3e43-4b5e-9529-11d603525113';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'HOME HEALTH CARE WORKER' FROM responses WHERE visitor_id = 'a614646e-d299-4789-9c00-02de5e3b701b';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = 'a614646e-d299-4789-9c00-02de5e3b701b';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, IN COMPLIANCE' FROM responses WHERE visitor_id = 'a614646e-d299-4789-9c00-02de5e3b701b';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', 'UNDER 40' FROM responses WHERE visitor_id = 'a614646e-d299-4789-9c00-02de5e3b701b';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'LESS THAN ONE YEAR' FROM responses WHERE visitor_id = 'a614646e-d299-4789-9c00-02de5e3b701b';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = 'a614646e-d299-4789-9c00-02de5e3b701b';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'NO' FROM responses WHERE visitor_id = 'a614646e-d299-4789-9c00-02de5e3b701b';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'YES' FROM responses WHERE visitor_id = 'a614646e-d299-4789-9c00-02de5e3b701b';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'YES' FROM responses WHERE visitor_id = 'a614646e-d299-4789-9c00-02de5e3b701b';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'NO' FROM responses WHERE visitor_id = 'a614646e-d299-4789-9c00-02de5e3b701b';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'NANNY' FROM responses WHERE visitor_id = '8f478e95-32e1-4b5d-a008-718fa5787a01';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'YES' FROM responses WHERE visitor_id = '8f478e95-32e1-4b5d-a008-718fa5787a01';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, PARTIALLY' FROM responses WHERE visitor_id = '8f478e95-32e1-4b5d-a008-718fa5787a01';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', '40 OR MORE' FROM responses WHERE visitor_id = '8f478e95-32e1-4b5d-a008-718fa5787a01';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'LESS THAN ONE YEAR' FROM responses WHERE visitor_id = '8f478e95-32e1-4b5d-a008-718fa5787a01';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = '8f478e95-32e1-4b5d-a008-718fa5787a01';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'NO' FROM responses WHERE visitor_id = '8f478e95-32e1-4b5d-a008-718fa5787a01';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = '8f478e95-32e1-4b5d-a008-718fa5787a01';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'NO' FROM responses WHERE visitor_id = '8f478e95-32e1-4b5d-a008-718fa5787a01';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'YES' FROM responses WHERE visitor_id = '8f478e95-32e1-4b5d-a008-718fa5787a01';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'NANNY' FROM responses WHERE visitor_id = '91f5bd86-e9da-406e-8ee6-b0cb6d79b057';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = '91f5bd86-e9da-406e-8ee6-b0cb6d79b057';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'NO' FROM responses WHERE visitor_id = '91f5bd86-e9da-406e-8ee6-b0cb6d79b057';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', 'UNDER 40' FROM responses WHERE visitor_id = '91f5bd86-e9da-406e-8ee6-b0cb6d79b057';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'ONE YEAR OR MORE' FROM responses WHERE visitor_id = '91f5bd86-e9da-406e-8ee6-b0cb6d79b057';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', 'UNDER 80' FROM responses WHERE visitor_id = '91f5bd86-e9da-406e-8ee6-b0cb6d79b057';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'NO' FROM responses WHERE visitor_id = '91f5bd86-e9da-406e-8ee6-b0cb6d79b057';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = '91f5bd86-e9da-406e-8ee6-b0cb6d79b057';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'YES' FROM responses WHERE visitor_id = '91f5bd86-e9da-406e-8ee6-b0cb6d79b057';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'YES' FROM responses WHERE visitor_id = '91f5bd86-e9da-406e-8ee6-b0cb6d79b057';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'NANNY' FROM responses WHERE visitor_id = '0c49a9ca-b066-4a0e-982e-694396b5acc9';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = '0c49a9ca-b066-4a0e-982e-694396b5acc9';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'NO' FROM responses WHERE visitor_id = '0c49a9ca-b066-4a0e-982e-694396b5acc9';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', 'UNDER 40' FROM responses WHERE visitor_id = '0c49a9ca-b066-4a0e-982e-694396b5acc9';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'LESS THAN SIX MONTHS' FROM responses WHERE visitor_id = '0c49a9ca-b066-4a0e-982e-694396b5acc9';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', 'UNDER 80' FROM responses WHERE visitor_id = '0c49a9ca-b066-4a0e-982e-694396b5acc9';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'NO' FROM responses WHERE visitor_id = '0c49a9ca-b066-4a0e-982e-694396b5acc9';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = '0c49a9ca-b066-4a0e-982e-694396b5acc9';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'NO' FROM responses WHERE visitor_id = '0c49a9ca-b066-4a0e-982e-694396b5acc9';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'YES' FROM responses WHERE visitor_id = '0c49a9ca-b066-4a0e-982e-694396b5acc9';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'HOME ATTENDANT' FROM responses WHERE visitor_id = '61c41dc7-b185-417b-8a0f-ca36cb903aff';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'YES' FROM responses WHERE visitor_id = '61c41dc7-b185-417b-8a0f-ca36cb903aff';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'NO' FROM responses WHERE visitor_id = '61c41dc7-b185-417b-8a0f-ca36cb903aff';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', 'UNDER 40' FROM responses WHERE visitor_id = '61c41dc7-b185-417b-8a0f-ca36cb903aff';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'ONE YEAR OR MORE' FROM responses WHERE visitor_id = '61c41dc7-b185-417b-8a0f-ca36cb903aff';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = '61c41dc7-b185-417b-8a0f-ca36cb903aff';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'YES' FROM responses WHERE visitor_id = '61c41dc7-b185-417b-8a0f-ca36cb903aff';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = '61c41dc7-b185-417b-8a0f-ca36cb903aff';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'YES' FROM responses WHERE visitor_id = '61c41dc7-b185-417b-8a0f-ca36cb903aff';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'YES' FROM responses WHERE visitor_id = '61c41dc7-b185-417b-8a0f-ca36cb903aff';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'NANNY' FROM responses WHERE visitor_id = '2edc11b7-ca9c-45a5-81d2-8f236d53b9e4';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = '2edc11b7-ca9c-45a5-81d2-8f236d53b9e4';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, IN COMPLIANCE' FROM responses WHERE visitor_id = '2edc11b7-ca9c-45a5-81d2-8f236d53b9e4';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', 'UNDER 40' FROM responses WHERE visitor_id = '2edc11b7-ca9c-45a5-81d2-8f236d53b9e4';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'ONE YEAR OR MORE' FROM responses WHERE visitor_id = '2edc11b7-ca9c-45a5-81d2-8f236d53b9e4';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = '2edc11b7-ca9c-45a5-81d2-8f236d53b9e4';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'NO' FROM responses WHERE visitor_id = '2edc11b7-ca9c-45a5-81d2-8f236d53b9e4';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = '2edc11b7-ca9c-45a5-81d2-8f236d53b9e4';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'YES' FROM responses WHERE visitor_id = '2edc11b7-ca9c-45a5-81d2-8f236d53b9e4';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'NO' FROM responses WHERE visitor_id = '2edc11b7-ca9c-45a5-81d2-8f236d53b9e4';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'NANNY' FROM responses WHERE visitor_id = 'b68e72ad-7dfd-4bc0-a252-791c463cc3d3';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = 'b68e72ad-7dfd-4bc0-a252-791c463cc3d3';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, IN COMPLIANCE' FROM responses WHERE visitor_id = 'b68e72ad-7dfd-4bc0-a252-791c463cc3d3';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', 'UNDER 40' FROM responses WHERE visitor_id = 'b68e72ad-7dfd-4bc0-a252-791c463cc3d3';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'ONE YEAR OR MORE' FROM responses WHERE visitor_id = 'b68e72ad-7dfd-4bc0-a252-791c463cc3d3';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = 'b68e72ad-7dfd-4bc0-a252-791c463cc3d3';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'NO' FROM responses WHERE visitor_id = 'b68e72ad-7dfd-4bc0-a252-791c463cc3d3';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = 'b68e72ad-7dfd-4bc0-a252-791c463cc3d3';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'NO' FROM responses WHERE visitor_id = 'b68e72ad-7dfd-4bc0-a252-791c463cc3d3';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'NO' FROM responses WHERE visitor_id = 'b68e72ad-7dfd-4bc0-a252-791c463cc3d3';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'HOME HEALTH CARE WORKER' FROM responses WHERE visitor_id = '6f4142fa-5f68-4bc4-87c9-adbe9844679d';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = '6f4142fa-5f68-4bc4-87c9-adbe9844679d';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, IN COMPLIANCE' FROM responses WHERE visitor_id = '6f4142fa-5f68-4bc4-87c9-adbe9844679d';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', 'UNDER 40' FROM responses WHERE visitor_id = '6f4142fa-5f68-4bc4-87c9-adbe9844679d';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'LESS THAN SIX MONTHS' FROM responses WHERE visitor_id = '6f4142fa-5f68-4bc4-87c9-adbe9844679d';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = '6f4142fa-5f68-4bc4-87c9-adbe9844679d';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'NO' FROM responses WHERE visitor_id = '6f4142fa-5f68-4bc4-87c9-adbe9844679d';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = '6f4142fa-5f68-4bc4-87c9-adbe9844679d';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'YES' FROM responses WHERE visitor_id = '6f4142fa-5f68-4bc4-87c9-adbe9844679d';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'NO' FROM responses WHERE visitor_id = '6f4142fa-5f68-4bc4-87c9-adbe9844679d';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'HOUSE CLEANER' FROM responses WHERE visitor_id = '96646d3f-daee-4ff4-80d8-1ed58edb5fb9';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = '96646d3f-daee-4ff4-80d8-1ed58edb5fb9';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'NO' FROM responses WHERE visitor_id = '96646d3f-daee-4ff4-80d8-1ed58edb5fb9';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', 'UNDER 40' FROM responses WHERE visitor_id = '96646d3f-daee-4ff4-80d8-1ed58edb5fb9';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'ONE YEAR OR MORE' FROM responses WHERE visitor_id = '96646d3f-daee-4ff4-80d8-1ed58edb5fb9';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', 'UNDER 80' FROM responses WHERE visitor_id = '96646d3f-daee-4ff4-80d8-1ed58edb5fb9';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'NO' FROM responses WHERE visitor_id = '96646d3f-daee-4ff4-80d8-1ed58edb5fb9';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'YES' FROM responses WHERE visitor_id = '96646d3f-daee-4ff4-80d8-1ed58edb5fb9';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'NO' FROM responses WHERE visitor_id = '96646d3f-daee-4ff4-80d8-1ed58edb5fb9';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'YES' FROM responses WHERE visitor_id = '96646d3f-daee-4ff4-80d8-1ed58edb5fb9';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'NANNY' FROM responses WHERE visitor_id = 'f94bb048-571d-42ea-9137-2d29bc14985b';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = 'f94bb048-571d-42ea-9137-2d29bc14985b';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, IN COMPLIANCE' FROM responses WHERE visitor_id = 'f94bb048-571d-42ea-9137-2d29bc14985b';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', '40 OR MORE' FROM responses WHERE visitor_id = 'f94bb048-571d-42ea-9137-2d29bc14985b';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'LESS THAN ONE YEAR' FROM responses WHERE visitor_id = 'f94bb048-571d-42ea-9137-2d29bc14985b';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = 'f94bb048-571d-42ea-9137-2d29bc14985b';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'YES' FROM responses WHERE visitor_id = 'f94bb048-571d-42ea-9137-2d29bc14985b';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = 'f94bb048-571d-42ea-9137-2d29bc14985b';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'NO' FROM responses WHERE visitor_id = 'f94bb048-571d-42ea-9137-2d29bc14985b';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'YES' FROM responses WHERE visitor_id = 'f94bb048-571d-42ea-9137-2d29bc14985b';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'NANNY' FROM responses WHERE visitor_id = 'a14fc72e-decf-4a40-8ca7-0f916cddaa73';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = 'a14fc72e-decf-4a40-8ca7-0f916cddaa73';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, IN COMPLIANCE' FROM responses WHERE visitor_id = 'a14fc72e-decf-4a40-8ca7-0f916cddaa73';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', 'UNDER 40' FROM responses WHERE visitor_id = 'a14fc72e-decf-4a40-8ca7-0f916cddaa73';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'LESS THAN ONE YEAR' FROM responses WHERE visitor_id = 'a14fc72e-decf-4a40-8ca7-0f916cddaa73';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', 'UNDER 80' FROM responses WHERE visitor_id = 'a14fc72e-decf-4a40-8ca7-0f916cddaa73';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'NO' FROM responses WHERE visitor_id = 'a14fc72e-decf-4a40-8ca7-0f916cddaa73';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'YES' FROM responses WHERE visitor_id = 'a14fc72e-decf-4a40-8ca7-0f916cddaa73';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'YES' FROM responses WHERE visitor_id = 'a14fc72e-decf-4a40-8ca7-0f916cddaa73';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'NO' FROM responses WHERE visitor_id = 'a14fc72e-decf-4a40-8ca7-0f916cddaa73';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'NANNY' FROM responses WHERE visitor_id = '40857a47-ff40-4e3c-a4bc-613a416faa9a';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = '40857a47-ff40-4e3c-a4bc-613a416faa9a';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, PARTIALLY' FROM responses WHERE visitor_id = '40857a47-ff40-4e3c-a4bc-613a416faa9a';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', '40 OR MORE' FROM responses WHERE visitor_id = '40857a47-ff40-4e3c-a4bc-613a416faa9a';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'ONE YEAR OR MORE' FROM responses WHERE visitor_id = '40857a47-ff40-4e3c-a4bc-613a416faa9a';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = '40857a47-ff40-4e3c-a4bc-613a416faa9a';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'NO' FROM responses WHERE visitor_id = '40857a47-ff40-4e3c-a4bc-613a416faa9a';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = '40857a47-ff40-4e3c-a4bc-613a416faa9a';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'YES' FROM responses WHERE visitor_id = '40857a47-ff40-4e3c-a4bc-613a416faa9a';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'NO' FROM responses WHERE visitor_id = '40857a47-ff40-4e3c-a4bc-613a416faa9a';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'NANNY' FROM responses WHERE visitor_id = '6ff3d6d7-ac3f-4ca1-b4da-f270fc2c0dc5';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = '6ff3d6d7-ac3f-4ca1-b4da-f270fc2c0dc5';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, PARTIALLY' FROM responses WHERE visitor_id = '6ff3d6d7-ac3f-4ca1-b4da-f270fc2c0dc5';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', '40 OR MORE' FROM responses WHERE visitor_id = '6ff3d6d7-ac3f-4ca1-b4da-f270fc2c0dc5';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'ONE YEAR OR MORE' FROM responses WHERE visitor_id = '6ff3d6d7-ac3f-4ca1-b4da-f270fc2c0dc5';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', 'UNDER 80' FROM responses WHERE visitor_id = '6ff3d6d7-ac3f-4ca1-b4da-f270fc2c0dc5';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'NO' FROM responses WHERE visitor_id = '6ff3d6d7-ac3f-4ca1-b4da-f270fc2c0dc5';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = '6ff3d6d7-ac3f-4ca1-b4da-f270fc2c0dc5';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'NO' FROM responses WHERE visitor_id = '6ff3d6d7-ac3f-4ca1-b4da-f270fc2c0dc5';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'NO' FROM responses WHERE visitor_id = '6ff3d6d7-ac3f-4ca1-b4da-f270fc2c0dc5';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'NANNY' FROM responses WHERE visitor_id = '7aa8d34f-398f-40a4-84ee-8c94287a62f9';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = '7aa8d34f-398f-40a4-84ee-8c94287a62f9';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, PARTIALLY' FROM responses WHERE visitor_id = '7aa8d34f-398f-40a4-84ee-8c94287a62f9';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', '40 OR MORE' FROM responses WHERE visitor_id = '7aa8d34f-398f-40a4-84ee-8c94287a62f9';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'ONE YEAR OR MORE' FROM responses WHERE visitor_id = '7aa8d34f-398f-40a4-84ee-8c94287a62f9';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', 'UNDER 80' FROM responses WHERE visitor_id = '7aa8d34f-398f-40a4-84ee-8c94287a62f9';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'NO' FROM responses WHERE visitor_id = '7aa8d34f-398f-40a4-84ee-8c94287a62f9';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = '7aa8d34f-398f-40a4-84ee-8c94287a62f9';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'NO' FROM responses WHERE visitor_id = '7aa8d34f-398f-40a4-84ee-8c94287a62f9';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'NO' FROM responses WHERE visitor_id = '7aa8d34f-398f-40a4-84ee-8c94287a62f9';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'NANNY' FROM responses WHERE visitor_id = '4ab0f022-beaf-406f-868a-66d5cdd75e98';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'YES' FROM responses WHERE visitor_id = '4ab0f022-beaf-406f-868a-66d5cdd75e98';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, PARTIALLY' FROM responses WHERE visitor_id = '4ab0f022-beaf-406f-868a-66d5cdd75e98';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', 'UNDER 40' FROM responses WHERE visitor_id = '4ab0f022-beaf-406f-868a-66d5cdd75e98';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'LESS THAN ONE YEAR' FROM responses WHERE visitor_id = '4ab0f022-beaf-406f-868a-66d5cdd75e98';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = '4ab0f022-beaf-406f-868a-66d5cdd75e98';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'NO' FROM responses WHERE visitor_id = '4ab0f022-beaf-406f-868a-66d5cdd75e98';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = '4ab0f022-beaf-406f-868a-66d5cdd75e98';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'YES' FROM responses WHERE visitor_id = '4ab0f022-beaf-406f-868a-66d5cdd75e98';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'NO' FROM responses WHERE visitor_id = '4ab0f022-beaf-406f-868a-66d5cdd75e98';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'HOUSE CLEANER' FROM responses WHERE visitor_id = 'ef4adeb1-2ecd-4e1b-b78a-b4a62bfb4bbd';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = 'ef4adeb1-2ecd-4e1b-b78a-b4a62bfb4bbd';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, PARTIALLY' FROM responses WHERE visitor_id = 'ef4adeb1-2ecd-4e1b-b78a-b4a62bfb4bbd';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', 'UNDER 40' FROM responses WHERE visitor_id = 'ef4adeb1-2ecd-4e1b-b78a-b4a62bfb4bbd';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'LESS THAN SIX MONTHS' FROM responses WHERE visitor_id = 'ef4adeb1-2ecd-4e1b-b78a-b4a62bfb4bbd';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', 'UNDER 80' FROM responses WHERE visitor_id = 'ef4adeb1-2ecd-4e1b-b78a-b4a62bfb4bbd';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'NO' FROM responses WHERE visitor_id = 'ef4adeb1-2ecd-4e1b-b78a-b4a62bfb4bbd';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = 'ef4adeb1-2ecd-4e1b-b78a-b4a62bfb4bbd';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'NO' FROM responses WHERE visitor_id = 'ef4adeb1-2ecd-4e1b-b78a-b4a62bfb4bbd';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'NO' FROM responses WHERE visitor_id = 'ef4adeb1-2ecd-4e1b-b78a-b4a62bfb4bbd';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'NANNY' FROM responses WHERE visitor_id = '81263dc0-b5bd-4a25-9344-53bffcea6597';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = '81263dc0-b5bd-4a25-9344-53bffcea6597';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, IN COMPLIANCE' FROM responses WHERE visitor_id = '81263dc0-b5bd-4a25-9344-53bffcea6597';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', '40 OR MORE' FROM responses WHERE visitor_id = '81263dc0-b5bd-4a25-9344-53bffcea6597';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'ONE YEAR OR MORE' FROM responses WHERE visitor_id = '81263dc0-b5bd-4a25-9344-53bffcea6597';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = '81263dc0-b5bd-4a25-9344-53bffcea6597';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'NO' FROM responses WHERE visitor_id = '81263dc0-b5bd-4a25-9344-53bffcea6597';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = '81263dc0-b5bd-4a25-9344-53bffcea6597';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'YES' FROM responses WHERE visitor_id = '81263dc0-b5bd-4a25-9344-53bffcea6597';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'YES' FROM responses WHERE visitor_id = '81263dc0-b5bd-4a25-9344-53bffcea6597';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'HOUSE CLEANER' FROM responses WHERE visitor_id = 'b2d2b209-dcac-4c15-8a0d-3b4a485bd7c6';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = 'b2d2b209-dcac-4c15-8a0d-3b4a485bd7c6';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, PARTIALLY' FROM responses WHERE visitor_id = 'b2d2b209-dcac-4c15-8a0d-3b4a485bd7c6';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', 'UNDER 40' FROM responses WHERE visitor_id = 'b2d2b209-dcac-4c15-8a0d-3b4a485bd7c6';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'ONE YEAR OR MORE' FROM responses WHERE visitor_id = 'b2d2b209-dcac-4c15-8a0d-3b4a485bd7c6';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', 'UNDER 80' FROM responses WHERE visitor_id = 'b2d2b209-dcac-4c15-8a0d-3b4a485bd7c6';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'YES' FROM responses WHERE visitor_id = 'b2d2b209-dcac-4c15-8a0d-3b4a485bd7c6';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'YES' FROM responses WHERE visitor_id = 'b2d2b209-dcac-4c15-8a0d-3b4a485bd7c6';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'NO' FROM responses WHERE visitor_id = 'b2d2b209-dcac-4c15-8a0d-3b4a485bd7c6';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'NO' FROM responses WHERE visitor_id = 'b2d2b209-dcac-4c15-8a0d-3b4a485bd7c6';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'HOUSE CLEANER' FROM responses WHERE visitor_id = '94030fde-bd9c-44bd-90eb-ebf373121441';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'YES' FROM responses WHERE visitor_id = '94030fde-bd9c-44bd-90eb-ebf373121441';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, IN COMPLIANCE' FROM responses WHERE visitor_id = '94030fde-bd9c-44bd-90eb-ebf373121441';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', 'UNDER 40' FROM responses WHERE visitor_id = '94030fde-bd9c-44bd-90eb-ebf373121441';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'LESS THAN ONE YEAR' FROM responses WHERE visitor_id = '94030fde-bd9c-44bd-90eb-ebf373121441';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', 'UNDER 80' FROM responses WHERE visitor_id = '94030fde-bd9c-44bd-90eb-ebf373121441';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'NO' FROM responses WHERE visitor_id = '94030fde-bd9c-44bd-90eb-ebf373121441';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = '94030fde-bd9c-44bd-90eb-ebf373121441';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'YES' FROM responses WHERE visitor_id = '94030fde-bd9c-44bd-90eb-ebf373121441';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'YES' FROM responses WHERE visitor_id = '94030fde-bd9c-44bd-90eb-ebf373121441';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'NANNY' FROM responses WHERE visitor_id = '00a7f32a-953a-44f4-aeb4-7df438723f57';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = '00a7f32a-953a-44f4-aeb4-7df438723f57';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'NO' FROM responses WHERE visitor_id = '00a7f32a-953a-44f4-aeb4-7df438723f57';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', 'UNDER 40' FROM responses WHERE visitor_id = '00a7f32a-953a-44f4-aeb4-7df438723f57';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'LESS THAN SIX MONTHS' FROM responses WHERE visitor_id = '00a7f32a-953a-44f4-aeb4-7df438723f57';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = '00a7f32a-953a-44f4-aeb4-7df438723f57';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'NO' FROM responses WHERE visitor_id = '00a7f32a-953a-44f4-aeb4-7df438723f57';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = '00a7f32a-953a-44f4-aeb4-7df438723f57';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'NO' FROM responses WHERE visitor_id = '00a7f32a-953a-44f4-aeb4-7df438723f57';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'YES' FROM responses WHERE visitor_id = '00a7f32a-953a-44f4-aeb4-7df438723f57';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'NANNY' FROM responses WHERE visitor_id = '168492f2-e402-4c00-8826-68a795cec409';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'YES' FROM responses WHERE visitor_id = '168492f2-e402-4c00-8826-68a795cec409';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, IN COMPLIANCE' FROM responses WHERE visitor_id = '168492f2-e402-4c00-8826-68a795cec409';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', '40 OR MORE' FROM responses WHERE visitor_id = '168492f2-e402-4c00-8826-68a795cec409';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'LESS THAN ONE YEAR' FROM responses WHERE visitor_id = '168492f2-e402-4c00-8826-68a795cec409';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = '168492f2-e402-4c00-8826-68a795cec409';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'YES' FROM responses WHERE visitor_id = '168492f2-e402-4c00-8826-68a795cec409';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = '168492f2-e402-4c00-8826-68a795cec409';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'NO' FROM responses WHERE visitor_id = '168492f2-e402-4c00-8826-68a795cec409';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'NO' FROM responses WHERE visitor_id = '168492f2-e402-4c00-8826-68a795cec409';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'HOUSE CLEANER' FROM responses WHERE visitor_id = 'd076734b-35e4-436e-88e1-af049df33caa';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = 'd076734b-35e4-436e-88e1-af049df33caa';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'NO' FROM responses WHERE visitor_id = 'd076734b-35e4-436e-88e1-af049df33caa';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', 'UNDER 40' FROM responses WHERE visitor_id = 'd076734b-35e4-436e-88e1-af049df33caa';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'LESS THAN SIX MONTHS' FROM responses WHERE visitor_id = 'd076734b-35e4-436e-88e1-af049df33caa';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', 'UNDER 80' FROM responses WHERE visitor_id = 'd076734b-35e4-436e-88e1-af049df33caa';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'NO' FROM responses WHERE visitor_id = 'd076734b-35e4-436e-88e1-af049df33caa';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = 'd076734b-35e4-436e-88e1-af049df33caa';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'NO' FROM responses WHERE visitor_id = 'd076734b-35e4-436e-88e1-af049df33caa';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'NO' FROM responses WHERE visitor_id = 'd076734b-35e4-436e-88e1-af049df33caa';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'HOUSE CLEANER' FROM responses WHERE visitor_id = 'e211f643-986e-4e93-924c-076ffd2ad977';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = 'e211f643-986e-4e93-924c-076ffd2ad977';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'NO' FROM responses WHERE visitor_id = 'e211f643-986e-4e93-924c-076ffd2ad977';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', 'UNDER 40' FROM responses WHERE visitor_id = 'e211f643-986e-4e93-924c-076ffd2ad977';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'ONE YEAR OR MORE' FROM responses WHERE visitor_id = 'e211f643-986e-4e93-924c-076ffd2ad977';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', 'UNDER 80' FROM responses WHERE visitor_id = 'e211f643-986e-4e93-924c-076ffd2ad977';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'NO' FROM responses WHERE visitor_id = 'e211f643-986e-4e93-924c-076ffd2ad977';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = 'e211f643-986e-4e93-924c-076ffd2ad977';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'YES' FROM responses WHERE visitor_id = 'e211f643-986e-4e93-924c-076ffd2ad977';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'NO' FROM responses WHERE visitor_id = 'e211f643-986e-4e93-924c-076ffd2ad977';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'NANNY' FROM responses WHERE visitor_id = '930e5072-1732-45eb-a2d5-aacd5cc756b5';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = '930e5072-1732-45eb-a2d5-aacd5cc756b5';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, IN COMPLIANCE' FROM responses WHERE visitor_id = '930e5072-1732-45eb-a2d5-aacd5cc756b5';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', 'UNDER 40' FROM responses WHERE visitor_id = '930e5072-1732-45eb-a2d5-aacd5cc756b5';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'ONE YEAR OR MORE' FROM responses WHERE visitor_id = '930e5072-1732-45eb-a2d5-aacd5cc756b5';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = '930e5072-1732-45eb-a2d5-aacd5cc756b5';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'NO' FROM responses WHERE visitor_id = '930e5072-1732-45eb-a2d5-aacd5cc756b5';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = '930e5072-1732-45eb-a2d5-aacd5cc756b5';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'YES' FROM responses WHERE visitor_id = '930e5072-1732-45eb-a2d5-aacd5cc756b5';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'NO' FROM responses WHERE visitor_id = '930e5072-1732-45eb-a2d5-aacd5cc756b5';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'HOUSE CLEANER' FROM responses WHERE visitor_id = '59a06cef-e06b-4750-9765-4cc32ffc2e3d';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = '59a06cef-e06b-4750-9765-4cc32ffc2e3d';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'NO' FROM responses WHERE visitor_id = '59a06cef-e06b-4750-9765-4cc32ffc2e3d';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', 'UNDER 40' FROM responses WHERE visitor_id = '59a06cef-e06b-4750-9765-4cc32ffc2e3d';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'ONE YEAR OR MORE' FROM responses WHERE visitor_id = '59a06cef-e06b-4750-9765-4cc32ffc2e3d';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', 'UNDER 80' FROM responses WHERE visitor_id = '59a06cef-e06b-4750-9765-4cc32ffc2e3d';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'NO' FROM responses WHERE visitor_id = '59a06cef-e06b-4750-9765-4cc32ffc2e3d';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = '59a06cef-e06b-4750-9765-4cc32ffc2e3d';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'YES' FROM responses WHERE visitor_id = '59a06cef-e06b-4750-9765-4cc32ffc2e3d';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'YES' FROM responses WHERE visitor_id = '59a06cef-e06b-4750-9765-4cc32ffc2e3d';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'NANNY' FROM responses WHERE visitor_id = '4ac23d86-03ef-4d50-83a6-19cb60fba87b';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = '4ac23d86-03ef-4d50-83a6-19cb60fba87b';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'NO' FROM responses WHERE visitor_id = '4ac23d86-03ef-4d50-83a6-19cb60fba87b';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', '40 OR MORE' FROM responses WHERE visitor_id = '4ac23d86-03ef-4d50-83a6-19cb60fba87b';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'LESS THAN ONE YEAR' FROM responses WHERE visitor_id = '4ac23d86-03ef-4d50-83a6-19cb60fba87b';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = '4ac23d86-03ef-4d50-83a6-19cb60fba87b';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'NO' FROM responses WHERE visitor_id = '4ac23d86-03ef-4d50-83a6-19cb60fba87b';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = '4ac23d86-03ef-4d50-83a6-19cb60fba87b';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'NO' FROM responses WHERE visitor_id = '4ac23d86-03ef-4d50-83a6-19cb60fba87b';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'NO' FROM responses WHERE visitor_id = '4ac23d86-03ef-4d50-83a6-19cb60fba87b';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'NANNY' FROM responses WHERE visitor_id = 'ee07ebee-149f-4ce0-bb42-f79863a79f5a';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = 'ee07ebee-149f-4ce0-bb42-f79863a79f5a';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'NO' FROM responses WHERE visitor_id = 'ee07ebee-149f-4ce0-bb42-f79863a79f5a';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', 'UNDER 40' FROM responses WHERE visitor_id = 'ee07ebee-149f-4ce0-bb42-f79863a79f5a';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'ONE YEAR OR MORE' FROM responses WHERE visitor_id = 'ee07ebee-149f-4ce0-bb42-f79863a79f5a';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = 'ee07ebee-149f-4ce0-bb42-f79863a79f5a';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'NO' FROM responses WHERE visitor_id = 'ee07ebee-149f-4ce0-bb42-f79863a79f5a';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = 'ee07ebee-149f-4ce0-bb42-f79863a79f5a';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'NO' FROM responses WHERE visitor_id = 'ee07ebee-149f-4ce0-bb42-f79863a79f5a';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'NO' FROM responses WHERE visitor_id = 'ee07ebee-149f-4ce0-bb42-f79863a79f5a';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'HOUSE CLEANER' FROM responses WHERE visitor_id = '7823af03-6117-465c-9830-1ff33f0f3977';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = '7823af03-6117-465c-9830-1ff33f0f3977';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'NO' FROM responses WHERE visitor_id = '7823af03-6117-465c-9830-1ff33f0f3977';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', 'UNDER 40' FROM responses WHERE visitor_id = '7823af03-6117-465c-9830-1ff33f0f3977';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'ONE YEAR OR MORE' FROM responses WHERE visitor_id = '7823af03-6117-465c-9830-1ff33f0f3977';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', 'UNDER 80' FROM responses WHERE visitor_id = '7823af03-6117-465c-9830-1ff33f0f3977';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'NO' FROM responses WHERE visitor_id = '7823af03-6117-465c-9830-1ff33f0f3977';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = '7823af03-6117-465c-9830-1ff33f0f3977';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'YES' FROM responses WHERE visitor_id = '7823af03-6117-465c-9830-1ff33f0f3977';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'NO' FROM responses WHERE visitor_id = '7823af03-6117-465c-9830-1ff33f0f3977';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'HOUSE CLEANER' FROM responses WHERE visitor_id = '00715d4d-7001-4b0c-8bdb-920cacd1bc76';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = '00715d4d-7001-4b0c-8bdb-920cacd1bc76';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'NO' FROM responses WHERE visitor_id = '00715d4d-7001-4b0c-8bdb-920cacd1bc76';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', 'UNDER 40' FROM responses WHERE visitor_id = '00715d4d-7001-4b0c-8bdb-920cacd1bc76';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'ONE YEAR OR MORE' FROM responses WHERE visitor_id = '00715d4d-7001-4b0c-8bdb-920cacd1bc76';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = '00715d4d-7001-4b0c-8bdb-920cacd1bc76';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'NO' FROM responses WHERE visitor_id = '00715d4d-7001-4b0c-8bdb-920cacd1bc76';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = '00715d4d-7001-4b0c-8bdb-920cacd1bc76';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'NO' FROM responses WHERE visitor_id = '00715d4d-7001-4b0c-8bdb-920cacd1bc76';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'YES' FROM responses WHERE visitor_id = '00715d4d-7001-4b0c-8bdb-920cacd1bc76';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'NANNY' FROM responses WHERE visitor_id = 'eb04b2e1-c49b-4780-b5b0-a6367ff2147b';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = 'eb04b2e1-c49b-4780-b5b0-a6367ff2147b';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, PARTIALLY' FROM responses WHERE visitor_id = 'eb04b2e1-c49b-4780-b5b0-a6367ff2147b';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', 'UNDER 40' FROM responses WHERE visitor_id = 'eb04b2e1-c49b-4780-b5b0-a6367ff2147b';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'LESS THAN ONE YEAR' FROM responses WHERE visitor_id = 'eb04b2e1-c49b-4780-b5b0-a6367ff2147b';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = 'eb04b2e1-c49b-4780-b5b0-a6367ff2147b';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'NO' FROM responses WHERE visitor_id = 'eb04b2e1-c49b-4780-b5b0-a6367ff2147b';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = 'eb04b2e1-c49b-4780-b5b0-a6367ff2147b';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'YES' FROM responses WHERE visitor_id = 'eb04b2e1-c49b-4780-b5b0-a6367ff2147b';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'YES' FROM responses WHERE visitor_id = 'eb04b2e1-c49b-4780-b5b0-a6367ff2147b';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'HOME HEALTH CARE WORKER' FROM responses WHERE visitor_id = '99e1d86f-e7ec-4e81-b038-06bc6fa3b367';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'YES' FROM responses WHERE visitor_id = '99e1d86f-e7ec-4e81-b038-06bc6fa3b367';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, IN COMPLIANCE' FROM responses WHERE visitor_id = '99e1d86f-e7ec-4e81-b038-06bc6fa3b367';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', 'UNDER 40' FROM responses WHERE visitor_id = '99e1d86f-e7ec-4e81-b038-06bc6fa3b367';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'ONE YEAR OR MORE' FROM responses WHERE visitor_id = '99e1d86f-e7ec-4e81-b038-06bc6fa3b367';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = '99e1d86f-e7ec-4e81-b038-06bc6fa3b367';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'NO' FROM responses WHERE visitor_id = '99e1d86f-e7ec-4e81-b038-06bc6fa3b367';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = '99e1d86f-e7ec-4e81-b038-06bc6fa3b367';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'NO' FROM responses WHERE visitor_id = '99e1d86f-e7ec-4e81-b038-06bc6fa3b367';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'YES' FROM responses WHERE visitor_id = '99e1d86f-e7ec-4e81-b038-06bc6fa3b367';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'NANNY' FROM responses WHERE visitor_id = '802c8a49-058e-4be8-99ef-11087b50a70e';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'YES' FROM responses WHERE visitor_id = '802c8a49-058e-4be8-99ef-11087b50a70e';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, IN COMPLIANCE' FROM responses WHERE visitor_id = '802c8a49-058e-4be8-99ef-11087b50a70e';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', '40 OR MORE' FROM responses WHERE visitor_id = '802c8a49-058e-4be8-99ef-11087b50a70e';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'LESS THAN ONE YEAR' FROM responses WHERE visitor_id = '802c8a49-058e-4be8-99ef-11087b50a70e';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = '802c8a49-058e-4be8-99ef-11087b50a70e';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'YES' FROM responses WHERE visitor_id = '802c8a49-058e-4be8-99ef-11087b50a70e';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = '802c8a49-058e-4be8-99ef-11087b50a70e';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'NO' FROM responses WHERE visitor_id = '802c8a49-058e-4be8-99ef-11087b50a70e';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'NO' FROM responses WHERE visitor_id = '802c8a49-058e-4be8-99ef-11087b50a70e';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'NANNY' FROM responses WHERE visitor_id = 'fea8561b-98f3-4008-9925-061aae71875b';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = 'fea8561b-98f3-4008-9925-061aae71875b';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, IN COMPLIANCE' FROM responses WHERE visitor_id = 'fea8561b-98f3-4008-9925-061aae71875b';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', 'UNDER 40' FROM responses WHERE visitor_id = 'fea8561b-98f3-4008-9925-061aae71875b';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'ONE YEAR OR MORE' FROM responses WHERE visitor_id = 'fea8561b-98f3-4008-9925-061aae71875b';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = 'fea8561b-98f3-4008-9925-061aae71875b';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'NO' FROM responses WHERE visitor_id = 'fea8561b-98f3-4008-9925-061aae71875b';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = 'fea8561b-98f3-4008-9925-061aae71875b';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'NO' FROM responses WHERE visitor_id = 'fea8561b-98f3-4008-9925-061aae71875b';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'NO' FROM responses WHERE visitor_id = 'fea8561b-98f3-4008-9925-061aae71875b';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'HOME ATTENDANT' FROM responses WHERE visitor_id = '3c879b27-7050-427e-ae92-bd91bf8e0ad9';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'YES' FROM responses WHERE visitor_id = '3c879b27-7050-427e-ae92-bd91bf8e0ad9';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, IN COMPLIANCE' FROM responses WHERE visitor_id = '3c879b27-7050-427e-ae92-bd91bf8e0ad9';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', 'UNDER 40' FROM responses WHERE visitor_id = '3c879b27-7050-427e-ae92-bd91bf8e0ad9';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'ONE YEAR OR MORE' FROM responses WHERE visitor_id = '3c879b27-7050-427e-ae92-bd91bf8e0ad9';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = '3c879b27-7050-427e-ae92-bd91bf8e0ad9';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'NO' FROM responses WHERE visitor_id = '3c879b27-7050-427e-ae92-bd91bf8e0ad9';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = '3c879b27-7050-427e-ae92-bd91bf8e0ad9';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'NO' FROM responses WHERE visitor_id = '3c879b27-7050-427e-ae92-bd91bf8e0ad9';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'NO' FROM responses WHERE visitor_id = '3c879b27-7050-427e-ae92-bd91bf8e0ad9';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'HOME HEALTH CARE WORKER' FROM responses WHERE visitor_id = '453e284c-c242-4f8c-b755-506e16334cb0';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = '453e284c-c242-4f8c-b755-506e16334cb0';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, IN COMPLIANCE' FROM responses WHERE visitor_id = '453e284c-c242-4f8c-b755-506e16334cb0';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', '40 OR MORE' FROM responses WHERE visitor_id = '453e284c-c242-4f8c-b755-506e16334cb0';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'ONE YEAR OR MORE' FROM responses WHERE visitor_id = '453e284c-c242-4f8c-b755-506e16334cb0';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = '453e284c-c242-4f8c-b755-506e16334cb0';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'NO' FROM responses WHERE visitor_id = '453e284c-c242-4f8c-b755-506e16334cb0';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = '453e284c-c242-4f8c-b755-506e16334cb0';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'NO' FROM responses WHERE visitor_id = '453e284c-c242-4f8c-b755-506e16334cb0';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'NO' FROM responses WHERE visitor_id = '453e284c-c242-4f8c-b755-506e16334cb0';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'HOUSE CLEANER' FROM responses WHERE visitor_id = 'd7c3765c-f399-4a2a-9fb2-d90538df869a';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'YES' FROM responses WHERE visitor_id = 'd7c3765c-f399-4a2a-9fb2-d90538df869a';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, IN COMPLIANCE' FROM responses WHERE visitor_id = 'd7c3765c-f399-4a2a-9fb2-d90538df869a';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', 'UNDER 40' FROM responses WHERE visitor_id = 'd7c3765c-f399-4a2a-9fb2-d90538df869a';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'ONE YEAR OR MORE' FROM responses WHERE visitor_id = 'd7c3765c-f399-4a2a-9fb2-d90538df869a';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', 'UNDER 80' FROM responses WHERE visitor_id = 'd7c3765c-f399-4a2a-9fb2-d90538df869a';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'NO' FROM responses WHERE visitor_id = 'd7c3765c-f399-4a2a-9fb2-d90538df869a';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'YES' FROM responses WHERE visitor_id = 'd7c3765c-f399-4a2a-9fb2-d90538df869a';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'YES' FROM responses WHERE visitor_id = 'd7c3765c-f399-4a2a-9fb2-d90538df869a';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'YES' FROM responses WHERE visitor_id = 'd7c3765c-f399-4a2a-9fb2-d90538df869a';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'HOME HEALTH CARE WORKER' FROM responses WHERE visitor_id = 'a11e46f1-79bc-4c5a-ae9b-258ba794d2ca';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = 'a11e46f1-79bc-4c5a-ae9b-258ba794d2ca';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, PARTIALLY' FROM responses WHERE visitor_id = 'a11e46f1-79bc-4c5a-ae9b-258ba794d2ca';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', 'UNDER 40' FROM responses WHERE visitor_id = 'a11e46f1-79bc-4c5a-ae9b-258ba794d2ca';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'LESS THAN ONE YEAR' FROM responses WHERE visitor_id = 'a11e46f1-79bc-4c5a-ae9b-258ba794d2ca';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = 'a11e46f1-79bc-4c5a-ae9b-258ba794d2ca';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'NO' FROM responses WHERE visitor_id = 'a11e46f1-79bc-4c5a-ae9b-258ba794d2ca';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = 'a11e46f1-79bc-4c5a-ae9b-258ba794d2ca';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'YES' FROM responses WHERE visitor_id = 'a11e46f1-79bc-4c5a-ae9b-258ba794d2ca';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'YES' FROM responses WHERE visitor_id = 'a11e46f1-79bc-4c5a-ae9b-258ba794d2ca';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'NANNY' FROM responses WHERE visitor_id = '18925e33-d3b4-48ac-aa9b-63fede5f51df';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = '18925e33-d3b4-48ac-aa9b-63fede5f51df';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'NO' FROM responses WHERE visitor_id = '18925e33-d3b4-48ac-aa9b-63fede5f51df';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', '40 OR MORE' FROM responses WHERE visitor_id = '18925e33-d3b4-48ac-aa9b-63fede5f51df';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'ONE YEAR OR MORE' FROM responses WHERE visitor_id = '18925e33-d3b4-48ac-aa9b-63fede5f51df';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = '18925e33-d3b4-48ac-aa9b-63fede5f51df';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'NO' FROM responses WHERE visitor_id = '18925e33-d3b4-48ac-aa9b-63fede5f51df';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = '18925e33-d3b4-48ac-aa9b-63fede5f51df';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'NO' FROM responses WHERE visitor_id = '18925e33-d3b4-48ac-aa9b-63fede5f51df';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'NO' FROM responses WHERE visitor_id = '18925e33-d3b4-48ac-aa9b-63fede5f51df';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'HOUSE CLEANER' FROM responses WHERE visitor_id = 'a6cd809e-0d95-4ec3-b7b5-7d427b66e946';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = 'a6cd809e-0d95-4ec3-b7b5-7d427b66e946';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'NO' FROM responses WHERE visitor_id = 'a6cd809e-0d95-4ec3-b7b5-7d427b66e946';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', 'UNDER 40' FROM responses WHERE visitor_id = 'a6cd809e-0d95-4ec3-b7b5-7d427b66e946';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'ONE YEAR OR MORE' FROM responses WHERE visitor_id = 'a6cd809e-0d95-4ec3-b7b5-7d427b66e946';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = 'a6cd809e-0d95-4ec3-b7b5-7d427b66e946';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'NO' FROM responses WHERE visitor_id = 'a6cd809e-0d95-4ec3-b7b5-7d427b66e946';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = 'a6cd809e-0d95-4ec3-b7b5-7d427b66e946';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'YES' FROM responses WHERE visitor_id = 'a6cd809e-0d95-4ec3-b7b5-7d427b66e946';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'NO' FROM responses WHERE visitor_id = 'a6cd809e-0d95-4ec3-b7b5-7d427b66e946';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'HOME HEALTH CARE WORKER' FROM responses WHERE visitor_id = 'c53778f1-0869-416a-861d-c6164b1f2493';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'YES' FROM responses WHERE visitor_id = 'c53778f1-0869-416a-861d-c6164b1f2493';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, IN COMPLIANCE' FROM responses WHERE visitor_id = 'c53778f1-0869-416a-861d-c6164b1f2493';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', 'UNDER 40' FROM responses WHERE visitor_id = 'c53778f1-0869-416a-861d-c6164b1f2493';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'LESS THAN ONE YEAR' FROM responses WHERE visitor_id = 'c53778f1-0869-416a-861d-c6164b1f2493';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = 'c53778f1-0869-416a-861d-c6164b1f2493';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'NO' FROM responses WHERE visitor_id = 'c53778f1-0869-416a-861d-c6164b1f2493';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = 'c53778f1-0869-416a-861d-c6164b1f2493';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'NO' FROM responses WHERE visitor_id = 'c53778f1-0869-416a-861d-c6164b1f2493';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'NO' FROM responses WHERE visitor_id = 'c53778f1-0869-416a-861d-c6164b1f2493';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'NANNY' FROM responses WHERE visitor_id = '80fef390-dddf-4ebb-9740-1deeadd11fda';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = '80fef390-dddf-4ebb-9740-1deeadd11fda';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, PARTIALLY' FROM responses WHERE visitor_id = '80fef390-dddf-4ebb-9740-1deeadd11fda';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', '40 OR MORE' FROM responses WHERE visitor_id = '80fef390-dddf-4ebb-9740-1deeadd11fda';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'ONE YEAR OR MORE' FROM responses WHERE visitor_id = '80fef390-dddf-4ebb-9740-1deeadd11fda';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = '80fef390-dddf-4ebb-9740-1deeadd11fda';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'YES' FROM responses WHERE visitor_id = '80fef390-dddf-4ebb-9740-1deeadd11fda';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = '80fef390-dddf-4ebb-9740-1deeadd11fda';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'NO' FROM responses WHERE visitor_id = '80fef390-dddf-4ebb-9740-1deeadd11fda';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'NO' FROM responses WHERE visitor_id = '80fef390-dddf-4ebb-9740-1deeadd11fda';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'NANNY' FROM responses WHERE visitor_id = '1e0f7b81-1982-4019-a096-39dc3ebc1bb4';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = '1e0f7b81-1982-4019-a096-39dc3ebc1bb4';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'NO' FROM responses WHERE visitor_id = '1e0f7b81-1982-4019-a096-39dc3ebc1bb4';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', '40 OR MORE' FROM responses WHERE visitor_id = '1e0f7b81-1982-4019-a096-39dc3ebc1bb4';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'ONE YEAR OR MORE' FROM responses WHERE visitor_id = '1e0f7b81-1982-4019-a096-39dc3ebc1bb4';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = '1e0f7b81-1982-4019-a096-39dc3ebc1bb4';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'YES' FROM responses WHERE visitor_id = '1e0f7b81-1982-4019-a096-39dc3ebc1bb4';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = '1e0f7b81-1982-4019-a096-39dc3ebc1bb4';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'NO' FROM responses WHERE visitor_id = '1e0f7b81-1982-4019-a096-39dc3ebc1bb4';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'NO' FROM responses WHERE visitor_id = '1e0f7b81-1982-4019-a096-39dc3ebc1bb4';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'NANNY' FROM responses WHERE visitor_id = 'e1d54a96-b3f8-423e-888d-894f704996d5';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = 'e1d54a96-b3f8-423e-888d-894f704996d5';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, IN COMPLIANCE' FROM responses WHERE visitor_id = 'e1d54a96-b3f8-423e-888d-894f704996d5';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', '40 OR MORE' FROM responses WHERE visitor_id = 'e1d54a96-b3f8-423e-888d-894f704996d5';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'LESS THAN ONE YEAR' FROM responses WHERE visitor_id = 'e1d54a96-b3f8-423e-888d-894f704996d5';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = 'e1d54a96-b3f8-423e-888d-894f704996d5';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'NO' FROM responses WHERE visitor_id = 'e1d54a96-b3f8-423e-888d-894f704996d5';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'YES' FROM responses WHERE visitor_id = 'e1d54a96-b3f8-423e-888d-894f704996d5';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'YES' FROM responses WHERE visitor_id = 'e1d54a96-b3f8-423e-888d-894f704996d5';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'NO' FROM responses WHERE visitor_id = 'e1d54a96-b3f8-423e-888d-894f704996d5';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'NANNY' FROM responses WHERE visitor_id = '1eb89f13-f812-4c4c-ba3e-9dd270ea3c45';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = '1eb89f13-f812-4c4c-ba3e-9dd270ea3c45';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'NO' FROM responses WHERE visitor_id = '1eb89f13-f812-4c4c-ba3e-9dd270ea3c45';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', '40 OR MORE' FROM responses WHERE visitor_id = '1eb89f13-f812-4c4c-ba3e-9dd270ea3c45';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'LESS THAN SIX MONTHS' FROM responses WHERE visitor_id = '1eb89f13-f812-4c4c-ba3e-9dd270ea3c45';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = '1eb89f13-f812-4c4c-ba3e-9dd270ea3c45';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'YES' FROM responses WHERE visitor_id = '1eb89f13-f812-4c4c-ba3e-9dd270ea3c45';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = '1eb89f13-f812-4c4c-ba3e-9dd270ea3c45';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'NO' FROM responses WHERE visitor_id = '1eb89f13-f812-4c4c-ba3e-9dd270ea3c45';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'NO' FROM responses WHERE visitor_id = '1eb89f13-f812-4c4c-ba3e-9dd270ea3c45';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'HOUSE CLEANER' FROM responses WHERE visitor_id = '34944229-238e-475e-8f30-ab59298f3944';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = '34944229-238e-475e-8f30-ab59298f3944';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'NO' FROM responses WHERE visitor_id = '34944229-238e-475e-8f30-ab59298f3944';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', 'UNDER 40' FROM responses WHERE visitor_id = '34944229-238e-475e-8f30-ab59298f3944';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'LESS THAN SIX MONTHS' FROM responses WHERE visitor_id = '34944229-238e-475e-8f30-ab59298f3944';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', 'UNDER 80' FROM responses WHERE visitor_id = '34944229-238e-475e-8f30-ab59298f3944';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'YES' FROM responses WHERE visitor_id = '34944229-238e-475e-8f30-ab59298f3944';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = '34944229-238e-475e-8f30-ab59298f3944';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'YES' FROM responses WHERE visitor_id = '34944229-238e-475e-8f30-ab59298f3944';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'YES' FROM responses WHERE visitor_id = '34944229-238e-475e-8f30-ab59298f3944';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'NANNY' FROM responses WHERE visitor_id = '472bd2b6-8275-49ef-9c74-a1ca0dcd2577';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = '472bd2b6-8275-49ef-9c74-a1ca0dcd2577';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'NO' FROM responses WHERE visitor_id = '472bd2b6-8275-49ef-9c74-a1ca0dcd2577';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', 'UNDER 40' FROM responses WHERE visitor_id = '472bd2b6-8275-49ef-9c74-a1ca0dcd2577';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'LESS THAN SIX MONTHS' FROM responses WHERE visitor_id = '472bd2b6-8275-49ef-9c74-a1ca0dcd2577';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = '472bd2b6-8275-49ef-9c74-a1ca0dcd2577';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'NO' FROM responses WHERE visitor_id = '472bd2b6-8275-49ef-9c74-a1ca0dcd2577';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = '472bd2b6-8275-49ef-9c74-a1ca0dcd2577';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'NO' FROM responses WHERE visitor_id = '472bd2b6-8275-49ef-9c74-a1ca0dcd2577';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'NO' FROM responses WHERE visitor_id = '472bd2b6-8275-49ef-9c74-a1ca0dcd2577';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'NANNY' FROM responses WHERE visitor_id = 'a3956458-ee7f-417d-af62-7422fd3d74b5';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = 'a3956458-ee7f-417d-af62-7422fd3d74b5';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, IN COMPLIANCE' FROM responses WHERE visitor_id = 'a3956458-ee7f-417d-af62-7422fd3d74b5';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', '40 OR MORE' FROM responses WHERE visitor_id = 'a3956458-ee7f-417d-af62-7422fd3d74b5';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'ONE YEAR OR MORE' FROM responses WHERE visitor_id = 'a3956458-ee7f-417d-af62-7422fd3d74b5';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = 'a3956458-ee7f-417d-af62-7422fd3d74b5';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'NO' FROM responses WHERE visitor_id = 'a3956458-ee7f-417d-af62-7422fd3d74b5';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = 'a3956458-ee7f-417d-af62-7422fd3d74b5';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'NO' FROM responses WHERE visitor_id = 'a3956458-ee7f-417d-af62-7422fd3d74b5';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'YES' FROM responses WHERE visitor_id = 'a3956458-ee7f-417d-af62-7422fd3d74b5';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'NANNY' FROM responses WHERE visitor_id = 'e7f3798e-19e4-4e83-a4f1-f3804804d710';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = 'e7f3798e-19e4-4e83-a4f1-f3804804d710';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, IN COMPLIANCE' FROM responses WHERE visitor_id = 'e7f3798e-19e4-4e83-a4f1-f3804804d710';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', 'UNDER 40' FROM responses WHERE visitor_id = 'e7f3798e-19e4-4e83-a4f1-f3804804d710';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'ONE YEAR OR MORE' FROM responses WHERE visitor_id = 'e7f3798e-19e4-4e83-a4f1-f3804804d710';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = 'e7f3798e-19e4-4e83-a4f1-f3804804d710';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'NO' FROM responses WHERE visitor_id = 'e7f3798e-19e4-4e83-a4f1-f3804804d710';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = 'e7f3798e-19e4-4e83-a4f1-f3804804d710';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'NO' FROM responses WHERE visitor_id = 'e7f3798e-19e4-4e83-a4f1-f3804804d710';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'NO' FROM responses WHERE visitor_id = 'e7f3798e-19e4-4e83-a4f1-f3804804d710';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'NANNY' FROM responses WHERE visitor_id = 'ca277054-b3b9-4f97-9a66-4a425be7b372';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = 'ca277054-b3b9-4f97-9a66-4a425be7b372';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, IN COMPLIANCE' FROM responses WHERE visitor_id = 'ca277054-b3b9-4f97-9a66-4a425be7b372';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', 'UNDER 40' FROM responses WHERE visitor_id = 'ca277054-b3b9-4f97-9a66-4a425be7b372';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'ONE YEAR OR MORE' FROM responses WHERE visitor_id = 'ca277054-b3b9-4f97-9a66-4a425be7b372';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = 'ca277054-b3b9-4f97-9a66-4a425be7b372';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'YES' FROM responses WHERE visitor_id = 'ca277054-b3b9-4f97-9a66-4a425be7b372';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = 'ca277054-b3b9-4f97-9a66-4a425be7b372';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'NO' FROM responses WHERE visitor_id = 'ca277054-b3b9-4f97-9a66-4a425be7b372';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'NO' FROM responses WHERE visitor_id = 'ca277054-b3b9-4f97-9a66-4a425be7b372';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'NANNY' FROM responses WHERE visitor_id = 'f691aef9-cad7-4737-9890-8a5ec1d9ace9';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = 'f691aef9-cad7-4737-9890-8a5ec1d9ace9';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'NO' FROM responses WHERE visitor_id = 'f691aef9-cad7-4737-9890-8a5ec1d9ace9';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', 'UNDER 40' FROM responses WHERE visitor_id = 'f691aef9-cad7-4737-9890-8a5ec1d9ace9';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'LESS THAN ONE YEAR' FROM responses WHERE visitor_id = 'f691aef9-cad7-4737-9890-8a5ec1d9ace9';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', 'UNDER 80' FROM responses WHERE visitor_id = 'f691aef9-cad7-4737-9890-8a5ec1d9ace9';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'YES' FROM responses WHERE visitor_id = 'f691aef9-cad7-4737-9890-8a5ec1d9ace9';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = 'f691aef9-cad7-4737-9890-8a5ec1d9ace9';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'YES' FROM responses WHERE visitor_id = 'f691aef9-cad7-4737-9890-8a5ec1d9ace9';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'YES' FROM responses WHERE visitor_id = 'f691aef9-cad7-4737-9890-8a5ec1d9ace9';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'NANNY' FROM responses WHERE visitor_id = 'd7e94c3e-3d0b-4d01-b987-966e16c86e29';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'YES' FROM responses WHERE visitor_id = 'd7e94c3e-3d0b-4d01-b987-966e16c86e29';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, IN COMPLIANCE' FROM responses WHERE visitor_id = 'd7e94c3e-3d0b-4d01-b987-966e16c86e29';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', '40 OR MORE' FROM responses WHERE visitor_id = 'd7e94c3e-3d0b-4d01-b987-966e16c86e29';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'ONE YEAR OR MORE' FROM responses WHERE visitor_id = 'd7e94c3e-3d0b-4d01-b987-966e16c86e29';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = 'd7e94c3e-3d0b-4d01-b987-966e16c86e29';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'NO' FROM responses WHERE visitor_id = 'd7e94c3e-3d0b-4d01-b987-966e16c86e29';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'YES' FROM responses WHERE visitor_id = 'd7e94c3e-3d0b-4d01-b987-966e16c86e29';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'NO' FROM responses WHERE visitor_id = 'd7e94c3e-3d0b-4d01-b987-966e16c86e29';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'NO' FROM responses WHERE visitor_id = 'd7e94c3e-3d0b-4d01-b987-966e16c86e29';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'HOME ATTENDANT' FROM responses WHERE visitor_id = '39dac787-f4d3-4515-8658-bdf2473be3a3';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'YES' FROM responses WHERE visitor_id = '39dac787-f4d3-4515-8658-bdf2473be3a3';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, IN COMPLIANCE' FROM responses WHERE visitor_id = '39dac787-f4d3-4515-8658-bdf2473be3a3';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', '40 OR MORE' FROM responses WHERE visitor_id = '39dac787-f4d3-4515-8658-bdf2473be3a3';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'ONE YEAR OR MORE' FROM responses WHERE visitor_id = '39dac787-f4d3-4515-8658-bdf2473be3a3';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = '39dac787-f4d3-4515-8658-bdf2473be3a3';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'YES' FROM responses WHERE visitor_id = '39dac787-f4d3-4515-8658-bdf2473be3a3';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'YES' FROM responses WHERE visitor_id = '39dac787-f4d3-4515-8658-bdf2473be3a3';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'YES' FROM responses WHERE visitor_id = '39dac787-f4d3-4515-8658-bdf2473be3a3';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'YES' FROM responses WHERE visitor_id = '39dac787-f4d3-4515-8658-bdf2473be3a3';

INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'type', 'NANNY' FROM responses WHERE visitor_id = '11b8b0dd-c061-4f2e-bee2-475be1d2257e';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'agency', 'NO' FROM responses WHERE visitor_id = '11b8b0dd-c061-4f2e-bee2-475be1d2257e';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'books', 'YES, IN COMPLIANCE' FROM responses WHERE visitor_id = '11b8b0dd-c061-4f2e-bee2-475be1d2257e';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per week', '40 OR MORE' FROM responses WHERE visitor_id = '11b8b0dd-c061-4f2e-bee2-475be1d2257e';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'length of employment', 'LESS THAN ONE YEAR' FROM responses WHERE visitor_id = '11b8b0dd-c061-4f2e-bee2-475be1d2257e';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'hours per year', '80 OR MORE' FROM responses WHERE visitor_id = '11b8b0dd-c061-4f2e-bee2-475be1d2257e';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'self-quarantine', 'NO' FROM responses WHERE visitor_id = '11b8b0dd-c061-4f2e-bee2-475be1d2257e';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'family quarantine', 'NO' FROM responses WHERE visitor_id = '11b8b0dd-c061-4f2e-bee2-475be1d2257e';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'stay at home', 'YES' FROM responses WHERE visitor_id = '11b8b0dd-c061-4f2e-bee2-475be1d2257e';
INSERT INTO answers (response_id, question_code, answer) SELECT response_id, 'school closed', 'NO' FROM responses WHERE visitor_id = '11b8b0dd-c061-4f2e-bee2-475be1d2257e';

