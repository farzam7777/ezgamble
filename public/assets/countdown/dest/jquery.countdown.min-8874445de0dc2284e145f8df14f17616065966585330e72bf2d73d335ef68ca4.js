!function(t){if("object"==typeof exports&&"undefined"!=typeof module)module.exports=t();else if("function"==typeof define&&define.amd)define([],t);else{var e;"undefined"!=typeof window?e=window:"undefined"!=typeof global?e=global:"undefined"!=typeof self&&(e=self),e.Countdown=t()}}(function(){return function t(e,i,n){function s(r,h){if(!i[r]){if(!e[r]){var a="function"==typeof require&&require;if(!h&&a)return a(r,!0);if(o)return o(r,!0);var f=new Error("Cannot find module '"+r+"'");throw f.code="MODULE_NOT_FOUND",f}var d=i[r]={exports:{}};e[r][0].call(d.exports,function(t){var i=e[r][1][t];return s(i||t)},d,d.exports,t,e,i,n)}return i[r].exports}for(var o="function"==typeof require&&require,r=0;r<n.length;r++)s(n[r]);return s}({1:[function(t,e){var i={date:"June 7, 2087 15:03:25",refresh:1e3,offset:0,onEnd:function(){},render:function(t){this.el.innerHTML=t.years+" years, "+t.days+" days, "+this.leadingZeros(t.hours)+" hours, "+this.leadingZeros(t.min)+" min and "+this.leadingZeros(t.sec)+" sec"}},n=function(t,e){this.el=t,this.options={},this.interval=!1,this.mergeOptions=function(t){for(var e in i)i.hasOwnProperty(e)&&(this.options[e]="undefined"!=typeof t[e]?t[e]:i[e],"date"===e&&"object"!=typeof this.options.date&&(this.options.date=new Date(this.options.date)),"function"==typeof this.options[e]&&(this.options[e]=this.options[e].bind(this)));"object"!=typeof this.options.date&&(this.options.date=new Date(this.options.date))}.bind(this),this.mergeOptions(e),this.getDiffDate=function(){var t=(this.options.date.getTime()-Date.now()+this.options.offset)/1e3,e={years:0,days:0,hours:0,min:0,sec:0,millisec:0};return t<=0?(this.interval&&(this.stop(),this.options.onEnd()),e):(t>=31557600&&(e.years=Math.floor(t/31557600),t-=365.25*e.years*86400),t>=86400&&(e.days=Math.floor(t/86400),t-=86400*e.days),t>=3600&&(e.hours=Math.floor(t/3600),t-=3600*e.hours),t>=60&&(e.min=Math.floor(t/60),t-=60*e.min),e.sec=Math.round(t),e.millisec=t%1*1e3,e)}.bind(this),this.leadingZeros=function(t,e){return e=e||2,t=String(t),t.length>e?t:(Array(e+1).join("0")+t).substr(-e)},this.update=function(t){return"object"!=typeof t&&(t=new Date(t)),this.options.date=t,this.render(),this}.bind(this),this.stop=function(){return this.interval&&(clearInterval(this.interval),this.interval=!1),this}.bind(this),this.render=function(){return this.options.render(this.getDiffDate()),this}.bind(this),this.start=function(){if(!this.interval)return this.render(),this.options.refresh&&(this.interval=setInterval(this.render,this.options.refresh)),this}.bind(this),this.updateOffset=function(t){return this.options.offset=t,this}.bind(this),this.restart=function(t){return this.mergeOptions(t),this.interval=!1,this.start(),this}.bind(this),this.start()};e.exports=n},{}],2:[function(t,e){var i=t("./countdown.js"),n="countdown",s="date";jQuery.fn.countdown=function(t){return $.each(this,function(e,o){var r=$(o);r.data(n)||(r.data(s)&&(t.date=r.data(s)),r.data(n,new i(o,t)))})},e.exports=i},{"./countdown.js":1}]},{},[2])(2)});