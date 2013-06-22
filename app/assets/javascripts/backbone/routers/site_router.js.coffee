class TestDouble.Routers.SiteRouter extends Backbone.Router
  routes:
    "inquiry": "inquiry"
    "inquiry/:category": "inquiry"
    ".*": "welcome"

  inquiry: (category = "") ->
    @welcome() unless @welcomeView?

    @inquiryView ||= new TestDouble.Views.InquiryView
      el: $('<div id="contactUs" class="modal hidden"></div>').appendTo('body')[0]
      model: new TestDouble.Models.Inquiry(category: category.replace(/\-/g,' '))
    @inquiryView.render()

  welcome: ->
    @welcomeView ||= new TestDouble.Views.WelcomeView
      el: $('.main')[0]
    @welcomeView.render()
