module.exports =  (router) => {
  router.get('/', async function (ctx, next) {
    ctx.response.type = 'json'
    ctx.response.status = 200
    ctx.response.body = {
      msg: 'Hello Docker'
    }
  })
}
