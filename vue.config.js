const url = 'http://10.0.75.1:8081'
// 基础路径，发布前修改这里,当前配置打包出来的资源都是相对路径
let publicPath = './'
module.exports = {
  publicPath: publicPath,
  lintOnSave: true,
  productionSourceMap: false,
  // 开发时，配置转发代理，生产环境使用nginx代理
  devServer: {
    proxy: {
      '/auth': {
        target: url,
        ws: true,
        pathRewrite: {
          '^/auth': '/auth'
        }
      },
      '/captcha': {
        target: url,
        ws: true,
        pathRewrite: {
          '^/captcha': '/captcha'
        }
      }
    }
  }
}
