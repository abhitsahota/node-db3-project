const db = require('../data/db-config')

module.exports = {
    find, 
    findById,
    findSteps,
    add,
    update,
    remove
}

function find() {
    return db('schemes')
}

function findById(id) {
    let result = db('schemes').where({id}).first()
    if (typeof(result) !== 'object') {
        return null
    } else {
        return result 
    }
}

function findSteps(id) {
    return db('steps')
    .select('scheme_name', 'steps.id', 'steps.step_number', 'steps.instructions')
    .join('schemes', 'steps.scheme_id', "schemes.id")
    .where('scheme_id', id)
    .orderBy('steps.step_number')

}

function add(scheme) {
    return db('schemes')
    .insert(scheme, 'id')
    .then(ids => {
        const [id] = ids;
        return findById(id);
    });
}

function update(changes, id) {
    return db('schemes')
    .where({ id })
    .update(changes)
}

function remove(id) {
    return db('schemes')
    .where({ id })
    .del()
}