class MyInject {
    constructor (ctx) {
      this.app = ctx.app
      this.error = ctx.error
    }

    pageTitle (routeName) {
        const jsonPath = `pages.${routeName.replace(/-/g, '.')}`
        const title = this.app.i18n.t(jsonPath)
        return (typeof (title) === 'object') ? title.index : title
    }

    format (date) {
        const dateTimeFormat = new Intl.DateTimeFormat(
          'ja', { dateStyle: 'medium', timeStyle: 'short' }
        )
        return dateTimeFormat.format(new Date(date))
    }
    
    projectLinkTo (id, name = 'project-id-dashboard') {
        return { name, params: { id } }
    }

    errorHandler ({ status, statusText }) {
        return this.error({ statusCode: status, message: statusText })
    }
}
  
export default ({ app, error }, inject) => {
    inject('my', new MyInject(app, error))
}