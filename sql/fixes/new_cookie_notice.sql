--
-- Sets up the language for the new cookie notice and privacy policy page
--

-- Changes to help text and English
UPDATE language_keys SET help = 'Main text for the notice popup, used when only the accept/reject buttons are showing' WHERE key = 'cookie_notice_message';

UPDATE translations t SET translation = 'Cookies and similar technologies are used on this site as detailed in the [privacy policy](/privacy-policy).

You can consent to the use of such technologies by clikcing "Accept" below, or by closing this notice.'
FROM language_keys k
WHERE t.key_id = k.key_id
    AND k.key = 'cookie_notice_message';

UPDATE language_keys SET help = 'Text for the button to accept all cookies' WHERE key = 'cookie_notice_accept_button_text';

UPDATE translations t SET translation = 'Accept'
FROM language_keys k
WHERE t.key_id = k.key_id
    AND k.key = 'cookie_notice_accept_button_text';

-- Changes to English only
UPDATE translations t SET translation = 'Throughout the pandemic, Hand in Hand has acted as a rapid responder to address challenges and questions from our members and other employers about how to support domestic workers they employ during this crisis. Join our list to get updates and resources for employers.'
FROM language_keys k
WHERE t.key_id = k.key_id
    AND k.key = 'confirm_contact_invitation';

-- New keys
INSERT INTO language_keys (key, section, help, markdown_allowed) VALUES ('cookie_notice_configure_link_text', 'cookie_notice', 'Text for the link that allows you to configure your cookie preferences', FALSE);
INSERT INTO translations (key_id, language, translation) SELECT key_id, 'en', 'Learn more and customize' FROM language_keys WHERE key = 'cookie_notice_configure_link_text';

INSERT INTO language_keys (key, section, help, markdown_allowed) VALUES ('cookie_notice_reject_button_text', 'cookie_notice', 'Text for the button to reject all nonessential cookies', FALSE);
INSERT INTO translations (key_id, language, translation) SELECT key_id, 'en', 'Reject' FROM language_keys WHERE key = 'cookie_notice_reject_button_text';

INSERT INTO language_keys (key, section, help, markdown_allowed) VALUES ('cookie_notice_message_detailed', 'cookie_notice', 'Main text for the notice popup, used when the full configuration display is showing', TRUE);
INSERT INTO translations (key_id, language, translation) SELECT key_id, 'en', 'The following options allow you to customize your consent preferences for any tracking technology used to help us achieve the features described below.

To learn more about how these trackers help us and how they work, refer to the [privacy policy](/privacy-policy)' FROM language_keys WHERE key = 'cookie_notice_message_detailed';

INSERT INTO language_keys (key, section, help, markdown_allowed) VALUES ('cookie_notice_save_button_text', 'cookie_notice', 'Text for the button to save the currently selected cookie preferences', FALSE);
INSERT INTO translations (key_id, language, translation) SELECT key_id, 'en', 'Save and Close' FROM language_keys WHERE key = 'cookie_notice_save_button_text';

INSERT INTO language_keys (key, section, help, markdown_allowed) VALUES ('cookie_notice_option_self_title', 'cookie_notice', 'Title for the "self" cookie option', FALSE);
INSERT INTO translations (key_id, language, translation) SELECT key_id, 'en', 'Essential Cookies' FROM language_keys WHERE key = 'cookie_notice_option_self_title';

INSERT INTO language_keys (key, section, help, markdown_allowed) VALUES ('cookie_notice_option_self_description', 'cookie_notice', 'Description for the "self" cookie option', TRUE);
INSERT INTO translations (key_id, language, translation) SELECT key_id, 'en', 'We use cookies to keep your place in the flow of the benefit tool, and to collect answers as we go. We store this data for research purposes, but it is fully anonymized. When you give us your contact information, that is always stored separately from your answers and cannot be linked to them.  The tool is not usable without these cookies, so you cannot reject them.' FROM language_keys WHERE key = 'cookie_notice_option_self_description';

INSERT INTO language_keys (key, section, help, markdown_allowed) VALUES ('cookie_notice_option_thirdparty_title', 'cookie_notice', 'Title for the "third party" cookie option', FALSE);
INSERT INTO translations (key_id, language, translation) SELECT key_id, 'en', 'Partner Cookies' FROM language_keys WHERE key = 'cookie_notice_option_thirdparty_title';

INSERT INTO language_keys (key, section, help, markdown_allowed) VALUES ('cookie_notice_option_thirdparty_desc', 'cookie_notice', 'Description for the "third party" cookie option', TRUE);
INSERT INTO translations (key_id, language, translation) SELECT key_id, 'en', 'We sometimes partner with third-party tracking tools to gather statistics about how visitors are arriving at our site.  We do not track any personal data using these tools; however, accepting these cookies constitutes approval of the cookie policies of any partners.  Please see our [privacy policy](/privacy-policy) for a complete list.' FROM language_keys WHERE key = 'cookie_notice_option_thirdparty_desc';

INSERT INTO language_keys (key, section, help, markdown_allowed) VALUES ('privacy_policy_header', 'privacy_policy', 'Title for the privacy policy page', FALSE);
INSERT INTO translations (key_id, language, translation) SELECT key_id, 'en', 'Privacy Policy' FROM language_keys WHERE key = 'privacy_policy_header';

INSERT INTO language_keys (key, section, help, markdown_allowed) VALUES ('privacy_policy_text', 'privacy_policy', 'The privacy policy text', TRUE);
INSERT INTO translations (key_id, language, translation) SELECT key_id, 'en', '

### What information do we collect?

We collect your answers as you use the benefit tool, and we store them before showing your results.  Although we use this data for research purposes, it is fully anonymized.

If you choose to join Hand-in-Hand, we collect your email address and ZIP code.  This information is always stored separately from your answers and cannot be linked to them.

### What do we use your information for?

Any of the information we collect from you may be used in one of the following ways:

To send periodic emails. The email address you provide when you sign up to participate in an online campaign, or to receive our newsletter may be used to send news, updates, and related campaign information. Note: If at any time you would like to unsubscribe from receiving future emails, we include detailed unsubscribe instructions at the bottom of each email.

### How do we protect your information?

We implement a variety of security measures to maintain the safety of your personal information when you provide it:

* We use a secure server for all traffic. All supplied information is transmitted via Secure Socket Layer (SSL) technology.

* Any information we store is kept in our database, accessible only by those authorized with specific access to it.  These people are required to keep the information confidential.

### Do we use cookies?

Yes. Cookies are small files that a site or its service provider transfers to your computers hard drive through your Web browser, which enable the sites or service providers systems to recognize your browser and capture and remember certain information.

#### Essential cookies

We use cookies as part of the basic operation of this tool:

* your quiz answers are collected and stored,
* your web browser is given an anonymous and random identifier for storing your answers in our database,
* your privacy preferences are stored for future visits

These cookies are managed solely by us and cannot be rejected.

#### Non-essential cookies

We also use cookies to compile aggregate data about site traffic and site interaction so that we can offer better site experiences and tools in the future.

These cookies are managed by the following vendors:

* Facebook Tracking Pixels &mdash; [privacy policy](https://www.facebook.com/policies/cookies/)

We do not forward any personal information to vendors, only anonymous browsing data.

### Do we disclose any information to outside parties?

We do not sell, trade, or otherwise transfer to outside parties your personally identifiable information. This does not include our trusted third parties who assist us in operating our website, conducting our business, or servicing you, so long as those organizations and parties also agree to keep this information confidential. We may also release your information when we believe release is appropriate to comply with the law, enforce our site policies, or protect ours or others’ rights, property, or safety. However, non-personally identifiable visitor information may be provided to other parties for marketing, advertising, or other uses.

### California Online Privacy Protection Act Compliance

Because we value your privacy we have taken the necessary precautions to be in compliance with the California Online Privacy Protection Act. We therefore will not distribute your personal information to outside parties without your consent.

### Your Consent

By using our site, you consent to our website’s privacy policy.

### Changes to our Privacy Policy

If we decide to change our privacy policy, we will post those changes on this page.

This policy was last modified on August 19, 2020.

### Contacting Us

If there are any questions regarding this privacy policy you may contact us using the information below.

Email: info@domesticemployers.org

' FROM language_keys WHERE key = 'privacy_policy_text';

