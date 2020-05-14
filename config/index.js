
class ConfigFetcher {

    constructor() {
        this.fetched = false;
        this.vals = {};
    }

    bootstrap() {
        if (this.fetched) {
            return;
        }
        if (typeof(process.env.DATABASE_URL) === 'undefined') {
            console.log('Database specs are missing');
            throw new Error('Cannot proceed; please try again');
        }
        this.vals.database_url = process.env.DATABASE_URL;
        this.vals.prelaunch_username = process.env.PRELAUNCH_USERNAME;
        this.vals.prelaunch_password = process.env.PRELAUNCH_PASSWORD;
        this.fetched = true;
    }

    get(key) {
        if (!this.fetched) {
            this.bootstrap();
        }
        return this.vals[key];
    }
}

module.exports = new ConfigFetcher();
