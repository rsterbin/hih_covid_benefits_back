# Email cleanup

## Check methods

* Find and remove all duplicates (lowercase, strip spaces, etc)
* Pull any "role" style accounts (webmaster@, info@, support@, etc)
* MX record check domains
* Full verification with WhoIs Email Verification API (rate limited to 1000x/month)

## Database

Emails from the front end go to the `raw_contacts` table, where they sit until they're ready to go through the cleanup process. Emails that pass get entered into `contacts` and deleted from `raw_contacts`.

Downloads are batched so it's easy to ensure that you're not grabbing old addresses if you don't want them. This uses the `email_batches` table, and all contacts can have a batch ID attached.

## User experience

### Cleanup process

Initial run does all of the check methods above except the full verification, then shows a good/bad list (tagged by reason) and allows the user to drag/drop between them.

Once the admin user verifies the good/bad list, we run a final check using the full verification.

The ones that pass are moved, and the ones that fail are shown again in the good/bad list (all on the bad side).

When the user approves the list, any they've moved to the "good" list are sent to the real contacts table without further review, and any they've left on the "bad" list are marked as processed.

If we've hit the rate limit, a banner shows up saying we can't do any more. (Unless Stacy wants to set up a paid account, in which case this can get dropped.)

### Downloading

The default view is a list of previous downloads (should look like the deploy list) and two buttons: one to download all new addresses, and one to download everything.

## React components:

* Containers:
  * Admin/Email
    * Admin/Email/List (default) -- button links to download page
    * Admin/Email/Download
    * Admin/Email/ListRaw -- button links to clean page
    * Admin/Email/Clean

