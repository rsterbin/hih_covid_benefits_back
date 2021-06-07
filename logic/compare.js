
class Compare {

    stdDefaults = {
        storeDiff: false,
        logDiff: null,
    };

    specObject(args = {}) {
        const defaults = { ...this.stdDefaults,
            itemSpec: null,
        };
        const opts = Object.assign(defaults, args);
        const spec = new CompareObject(opts.itemSpec);
        return this.wrapSpec(spec, opts);
    }

    specKeyedObject(args = {}) {
        const defaults = { ...this.stdDefaults,
            keyMap: {},
        };
        const opts = Object.assign(defaults, args);
        const spec = new CompareKeyedObject(opts.keyMap);
        return this.wrapSpec(spec, opts);
    }

    specList(args = {}) {
        const defaults = { ...this.stdDefaults,
            itemSpec: null,
            pkey: false,
            orderSpec: null,
            doOrderDiff: true,
        };
        const opts = Object.assign(defaults, args);
        const spec = new CompareList(opts.itemSpec, opts.pkey, opts.orderSpec, opts.doOrderDiff);
        return this.wrapSpec(spec, opts);
    }

    specListedObject(args = {}) {
        const defaults = { ...this.stdDefaults,
            itemSpec: null,
            orderSpec: null,
            doOrderDiff: true,
        };
        const opts = Object.assign(defaults, args);
        const spec = new CompareListedObject(opts.itemSpec, opts.orderSpec, opts.doOrderDiff);
        return this.wrapSpec(spec, opts);
    }

    wrapSpec(spec, opts) {
        spec.storeDiff = opts.storeDiff;
        spec.logDiff = opts.logDiff;
        spec.parent = this;
        spec.init();
        return spec;
    }

    makeSection (dataA, dataB, mainKey) {
        const sectionA = mainKey in dataA ? dataA[mainKey] : {};
        const sectionB = mainKey in dataB ? dataB[mainKey] : {};
        return { a: sectionA, b: sectionB };
    }

    makeList (dataA, dataB, mainKey) {
        const listA = mainKey in dataA ? dataA[mainKey] : [];
        const listB = mainKey in dataB ? dataB[mainKey] : [];
        return { a: listA, b: listB };
    }

}

/*

comparable things:

- object w/ key-val pairs (check all)
- object w/ specific key-val pairs (check only those)
- list of scalars or simple objects (check none)
- list of complex objects (pass spec to determine what to do with each)
- order-spec object (like list)

when drilling down, we need to know whether we care about keeping a diff

*/

class CompareSpec {

    storeDiff = false;
    logDiff = false;

    init() {
    }

    match(dataA, dataB) {
        return dataA === dataB;
    }

    diff(dataA, dataB) {
        let result = { match: true, diff: {} };
        if (dataA === dataB) {
            result.match = false;
            result.diff.a_version = dataA;
            result.diff.b_version = dataB;
        }
        if (this.logDiff) {
            console.log(this.logDiff, result);
        }
        return result;
    }

}

class CompareObject extends CompareSpec {

    constructor(itemSpec = null) {
        super();
        this.itemSpec = itemSpec;
    }

    match(dataA, dataB) {
        if (typeof dataA !== 'object') { dataA = {}; }
        if (typeof dataB !== 'object') { dataB = {}; }
        for (const k in dataA) {
            if (!(k in dataB)) {
                return false;
            }
            if (this.itemSpec instanceof CompareSpec) {
                if (!this.itemSpec.match(dataA[k], dataB[k])) {
                    return false;
                }
            } else {
                if (dataA[k] !== dataB[k]) {
                    return false;
                }
            }
        }
        for (const k in dataB) {
            if (!(k in dataA)) {
                return false;
            }
        }
        return true;
    }

    diff(dataA, dataB) {
        if (typeof dataA !== 'object') { dataA = {}; }
        if (typeof dataB !== 'object') { dataB = {}; }
        let result = { match: true, diff: {} };
        for (const k in dataA) {
            if (!(k in dataB)) {
                result.match = false;
                result.diff[k] = {
                    a_version: dataA[k],
                    b_version: null
                };
            } else {
                if (this.itemSpec instanceof CompareSpec) {
                    const diff = this.itemSpec.diff(dataA[k], dataB[k]);
                    if (!diff.match) {
                        result.match = false;
                        result.diff[k] = diff;
                    }
                } else {
                    if (dataA[k] !== dataB[k]) {
                        result.match = false;
                        result.diff[k] = {
                            a_version: dataA[k],
                            b_version: dataB[k]
                        };
                    }
                }
            }
        }
        for (const k in dataB) {
            if (!(k in dataA)) {
                result.match = false;
                result.diff[k] = {
                    a_version: null,
                    b_version: dataB[k]
                };
            }
        }
        if (this.logDiff) {
            console.log(this.logDiff, result);
        }
        return result;
    }

}

class CompareKeyedObject extends CompareSpec {

    constructor(keyMap = {}) {
        super();
        this.keyMap = keyMap;
    }

    match(dataA, dataB) {
        if (typeof dataA !== 'object') { dataA = {}; }
        if (typeof dataB !== 'object') { dataB = {}; }
        for (const k in this.keyMap) {
            const spec = this.keyMap[k];
            if (spec instanceof CompareSpec) {
                if (!spec.match(dataA[k], dataB[k])) {
                    return false;
                }
            } else {
                if (dataA[k] !== dataB[k]) {
                    return false;
                }
            }
        }
        return true;
    }

    diff(dataA, dataB) {
        if (typeof dataA !== 'object') { dataA = {}; }
        if (typeof dataB !== 'object') { dataB = {}; }
        let result = { match: true, diff: {} };
        for (const k in this.keyMap) {
            const spec = this.keyMap[k];
            if (spec instanceof CompareSpec) {
                if (spec.storeDiff) {
                    const diff = spec.diff(dataA[k], dataB[k]);
                    if (!diff.match) {
                        result.match = false;
                        result.diff[k] = diff;
                    }
                } else {
                    if (!spec.match(dataA[k], dataB[k])) {
                        result.match = false;
                        result.diff[k] = {
                            a_version: dataA[k],
                            b_version: dataB[k],
                        };
                    }
                }
            } else {
                let diff = {};
                let match = true;
                if (k in dataA && k in dataB) {
                    if (!dataA[k] === dataB[k]) {
                        match = false;
                        diff = {
                            a_version: dataA[k],
                            b_version: dataB[k],
                        };
                    }
                } else if (k in dataA && !(k in dataB)) {
                    if (dataA[k] !== null) {
                        match = false;
                        diff = {
                            a_version: dataA[k],
                            b_version: null,
                        };
                    }
                } else if (!(k in dataA) && k in dataB) {
                    if (dataB[k] !== null) {
                        match = false;
                        diff = {
                            a_version: null,
                            b_version: dataB[k],
                        };
                    }
                }
                if (!match) {
                    result.match = false;
                    result.diff[k] = diff;
                }
            }
        }
        if (this.logDiff) {
            console.log(this.logDiff, result);
        }
        return result;
    }
}

class CompareList extends CompareSpec {

    constructor(itemSpec = null, pkey = false, orderSpec = null, doOrderDiff = true) {
        super();
        this.pkey = pkey;
        this.itemSpec = itemSpec;
        this.orderSpec = orderSpec;
        this.doOrderDiff = doOrderDiff;
    }

    init() {
        if (this.pkey) {
            this.mirrorSpec = this.parent.specListedObject({
                storeDiff: this.storeDiff,
                itemSpec: this.itemSpec,
                orderSpec: this.orderSpec,
                doOrderDiff: this.doOrderDiff
            });
        }
    }

    match(dataA, dataB) {
        if (!Array.isArray(dataA)) { dataA = []; }
        if (!Array.isArray(dataB)) { dataB = []; }
        if (dataA.length != dataB.length) {
            return false;
        }
        for (let i = 0; i < dataA.length; i++) {
            if (dataB[i] === undefined) {
                return false;
            }
            if (this.itemSpec instanceof CompareSpec) {
                if (!this.itemSpec.match(dataA[i], dataB[i])) {
                    return false;
                }
            } else {
                if (dataA[i] !== dataB[i]) {
                    return false;
                }
            }
        }
        for (let i = 0; i < dataB.length; i++) {
            if (dataA[i] === undefined) {
                return false;
            }
        }
        return true;
    }

    diff(dataA, dataB) {
        if (!Array.isArray(dataA)) { dataA = []; }
        if (!Array.isArray(dataB)) { dataB = []; }
        if (this.pkey) {
            const newData = this.mungeData(dataA, dataB);
            this.mirrorSpec.logDiff = this.logDiff;
            return this.mirrorSpec.diff(newData.a, newData.b);
        }

        let result = { match: true, diff: [] };

        for (let i = 0; i < dataA.length; i++) {
            if (dataB[i] === undefined) {
                result.match = false;
                result.diff.push({
                    a_version: dataA[i],
                    b_version: null,
                    index: i
                });
            }
            if (this.itemSpec instanceof CompareSpec) {
                if (this.itemSpec.storeDiff) {
                    const diff = this.itemSpec.diff(dataA[i], dataB[i]);
                    if (!diff.match) {
                        result.match = false;
                        result.diff.push(diff);
                    }
                } else {
                    if (!this.itemSpec.match(dataA[i], dataB[i])) {
                        result.match = false;
                        result.diff.push({
                            a_version: dataA[i],
                            b_version: dataB[i],
                            index: i
                        });
                    }
                }
            } else {
                if (dataA[i] !== dataB[i]) {
                    result.match = false;
                    result.diff.push({
                        a_version: dataA[i],
                        b_version: dataB[i],
                        index: i
                    });
                }
            }
        }

        for (let i = 0; i < dataB.length; i++) {
            if (dataA[i] === undefined) {
                result.match = false;
                result.diff.push({
                    a_version: null,
                    b_version: dataB[i],
                    index: i
                });
            }
        }

        if (this.logDiff) {
            console.log(this.logDiff, result);
        }
        return result;
    }

    mungeData(listA, listB) {
        let result = {
            a: {
                order: [],
                spec: {}
            },
            b: {
                order: [],
                spec: {}
            }
        };
        let code_map = {
            a: {},
            b: {}
        };
        for (const item of listA) {
            let pcode = item[this.pkey];
            if (this.pkey in item) {
                pcode = item[this.pkey];
            } else {
                pcode = 'unknown';
            }
            let code = pcode;
            if (pcode in code_map.a) {
                code = pcode + '-' + code_map.a[pcode];
            } else {
                code_map.a[pcode] = 0;
            }
            code_map.a[pcode]++;
            result.a.order.push(code);
            result.a.spec[code] = item;
        }
        for (const item of listB) {
            let pcode = item[this.pkey];
            if (this.pkey in item) {
                pcode = item[this.pkey];
            } else {
                pcode = 'unknown';
            }
            let code = pcode;
            if (pcode in code_map.b) {
                code = pcode + '-' + code_map.b[pcode];
            } else {
                code_map.b[pcode] = 0;
            }
            code_map.b[pcode]++;
            result.b.order.push(code);
            result.b.spec[code] = item;
        }
        return result;
    }

}

class CompareListedObject extends CompareSpec {

    constructor(itemSpec = null, orderSpec = null, doOrderDiff = true) {
        super();
        this.itemSpec = itemSpec;
        this.orderSpec = orderSpec;
        this.doOrderDiff = doOrderDiff;
    }

    init() {
        if (!(this.orderSpec instanceof CompareSpec)) {
            this.orderSpec = this.parent.specList({ storeDiff: false });
        }
        if (!(this.itemSpec instanceof CompareSpec)) {
            this.itemSpec = this.parent.specObject({ storeDiff: true });
        }
        this.dataSpec = this.parent.specObject({ storeDiff: true , itemSpec: this.itemSpec });
    }

    match(dataA, dataB) {
        if (typeof dataA !== 'object') { dataA = {}; }
        if (typeof dataB !== 'object') { dataB = {}; }
        const spec = this.parent.makeSection(dataA, dataB, 'spec');
        const order = this.parent.makeList(dataA, dataB, 'order');
        if (!this.orderSpec.match(order.a, order.b)) {
            return false;
        }
        if (!this.dataSpec.match(spec.a, spec.b)) {
            return false;
        }
        return true;
    }

    diff(dataA, dataB) {
        if (typeof dataA !== 'object') { dataA = {}; }
        if (typeof dataB !== 'object') { dataB = {}; }
        const spec = this.parent.makeSection(dataA, dataB, 'spec');
        const order = this.parent.makeList(dataA, dataB, 'order');
        let result = this.dataSpec.diff(spec.a, spec.b);
        if (this.doOrderDiff) {
            const order_ok = this.orderSpec.diff(order.a, order.b);
            result.order_match = order_ok.match;
            result.order_diff = {
                a_version: order.a,
                b_version: order.b
            };
            if (this.orderSpec.storeDiff) {
                result.order_diff.complex_diff = order_ok.diff;
            }
            if (!order_ok) {
                result.match = false;
            }
        }
        if (this.logDiff) {
            console.log(this.logDiff, result);
        }
        return result;
    }

}

module.exports = new Compare();

