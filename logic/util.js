
module.exports = {

    makeSection: (dataA, dataB, mainKey) => {
        const sectionA = mainKey in dataA ? dataA[mainKey] : {};
        const sectionB = mainKey in dataB ? dataB[mainKey] : {};
        return { a: sectionA, b: sectionB };
    },

    compareSimple: (sectionA, sectionB) => {
        let result = { match: true, missingA: [], missingB: [], diff: [] };
        foreach (const k in sectionA) {
            if (!(k in sectionB)) {
                result.match = false;
                result.missingB.push(k);
            } else {
                if (sectionA[k] !== sectionB[k]) {
                    result.match = false;
                    result.diff.push({
                        key: k,
                        a_version: sectionA[k],
                        b_version: sectionB[k];
                    });
                }
            }
        }
        foreach (const k in sectionB) {
            if (!(k in sectionA)) {
                result.match = false;
                result.missingA.push(k);
            }
        }
        return result;
    },

    compareSpec: (sectionA, sectionB, subkeys, keyCmp = {}) => {
        let result = { match: true, missingA: [], missingB: [], diff: [] };
        foreach (const k in sectionA) {
            if (!(k in sectionB)) {
                result.match = false;
                result.missingB.push(k);
            } else {
                let ok = true;
                foreach (const sk of subkeys) {
                    if (sk in keyCmp && typeof keyCmp[sk] === 'function') {
                        if (keyCmp[sk](sectionA[k][sk], sectionB[k][sk])) {
                            ok = false;
                        }
                    } else {
                        if (sectionA[k][sk] !== sectionB[k][sk]) {
                            ok = false;
                        }
                    }
                }
                if (!ok) {
                    result.match = false;
                    result.diff.push({
                        key: k,
                        a_version: sectionA[k],
                        b_version: sectionB[k];
                    });
                }
            }
        }
        foreach (const k in sectionB) {
            if (!(k in sectionA)) {
                result.match = false;
                result.missingA.push(k);
            }
        }
        return result;
    },

    compareSectionOrder: (sectionA, sectionB) => {
        const a_order = 'order' in sectionA ? sectionA.order : [];
        const b_order = 'order' in sectionB ? sectionB.order : [];
        const failure = { match: false, diff: { a_version: a_order, b_version: b_order } };
        if (a_order.length != b_order.length) {
            return failure;
        }
        for (const i = 0; i < a_order.length; i++) {
            if (a_order[i] !== b_order[i]) {
                return failure;
            }
        }
        return { match: true, diff: {} };
    }

};

