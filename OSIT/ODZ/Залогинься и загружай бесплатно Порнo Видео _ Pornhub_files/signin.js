function _readOnlyError(e){throw new TypeError('"'+e+'" is read-only')}function _typeof(e){return(_typeof="function"==typeof Symbol&&"symbol"==typeof Symbol.iterator?function(e){return typeof e}:function(e){return e&&"function"==typeof Symbol&&e.constructor===Symbol&&e!==Symbol.prototype?"symbol":typeof e})(e)}var extendedPropsForModal={signInUtilModal:null,config:TOP_BODY,show:function(e){"undefined"!=typeof event&&event.preventDefault();var t=document.getElementById("signinModal"),n=-1<window.location.href.indexOf("awards/nominees")?document.querySelectorAll(".voteList"):document.getElementById("headerLoginLink");if(navigator.userAgent&&navigator.userAgent.match(/PLAYSTATION/))return document.location.assign("http://"+location.hostname+"/login"),!1;"block"!==t.style.display&&null!=n&&(this._openModal(e,t),"function"==typeof appendedTasteProfile&&appendedTasteProfile("js-tasteProfileLoginModal"))},_openModal:function(e,t){var o,i=this;t&&(this.signInUtilModal=new MG_Modal({content:t}),this.signInUtilModal&&(o=e||textPHTranslation.loginTitle,this.signInUtilModal.openModal(function(e,t){var n;i.container=t,0<=(i.container.querySelector("[class*=loginAccessTitle]").innerHTML=o).toLowerCase().indexOf("subscribe")&&(n=i.container.querySelector(".js-loginForm"),(t=document.createElement("input")).type="hidden",t.name="subscribe",t.value=1,n.appendChild(t)),i.init(),i.showCaptcha&&(i._initializeCaptcha(),i.toggleButtonDisable(!0))}),e=document.querySelectorAll(".js_closeModal"),MG_Utils.addEventHandler(e,"click",function(){i.signInUtilModal.closeModal(),i.recaptchaCompleted=!1,i.container=null})))},_initializeCaptcha:function(){try{var e=this.container.querySelector(".g-recaptcha");null!=("undefined"==typeof CaptachaComponents?"undefined":_typeof(CaptachaComponents))&&e&&CaptachaComponents.registerComponent(e,this.captchaAcknowledgement)}catch(e){}},redirectFromResponse:function(e){var t=this.container.querySelector("#signinLoggingin"),n=this.container.querySelector(".signinError");e.redirect?(t.style.display="block",n.style.display="none",void 0!==e.subscribe&&1==e.subscribe?document.querySelector(".subscribeButton button.login").setAttribute("data-login","0"):document.location.assign(e.redirect)):(n.style.display="block",n.innerHTML=e.message,this.toggleButtonDisable(!1))},callbackSuccess:function(n){if("0"==n.premium_redirect_cookie){if(n.showExpiredFreeTrial||n.showExpiredModal||n.showExpiredCovidModal)return this.premiumModalFromResponse(n);this.redirectFromResponse(n)}else{var e=new Date,t=premiumRedirectCookieURL+(0<premiumRedirectCookieURL.indexOf("?")?"&":"?")+"timestamp="+e.getTime(),e=new XMLHttpRequest;e.withCredentials=!0,e.open("GET",t,!0),e.onreadystatechange=function(){var e,t;4===this.readyState&&200<=this.status&&this.status<400&&(e=this.container.querySelector("#signinLoggingin"),t=this.container.querySelector(".signinError"),n.redirect?(e.style.display="",t.style.display="none",document.location.assign(n.redirect)):(t.style.display="",t.innerHTML=n.message,this.toggleButtonDisable(!1)))},e.send(),_readOnlyError("request")}},loginAjaxSuccess:function(e){var t;e.twoStepVerification?(t=this.container.querySelector(".js-loginForm"))&&(MG_Utils.addClass(t,"displayNone"),this.setupTwoStepVerification(e)):e.requireCaptcha?(this.showCaptcha=!0,jQuery(".js-loginForm .signinError").show().html(e.message),this.setupCaptacha()):this.callbackSuccess(e)}},signinbox=Object.assign({},Signinbox,extendedPropsForModal);MG_Utils.domReady(function(){document.location.search.match(/showSigninBox=true/i)&&null!=document.getElementById("headerLoginLink")&&signinbox.show(),expired_modal.init()});