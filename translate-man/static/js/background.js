!function(e){function r(n){if(t[n])return t[n].exports;var o=t[n]={exports:{},id:n,loaded:!1};return e[n].call(o.exports,o,o.exports,r),o.loaded=!0,o.exports}var t={};return r.m=e,r.c=t,r.p="/",r(0)}({0:function(e,r,t){"use strict";function n(e){if(e.status>=200&&e.status<300)return e;var r=new Error(e.statusText);throw r.response=e,r}t(7);browser.runtime.onMessage.addListener(function(e,r,t){var o=e.url,a=e.type||"text",s=e.params||{};if(o)return fetch(o,s).then(n).then(function(e){switch(a){case"text":return e.text();case"json":return e.json();case"arrayBuffer":return e.arrayBuffer()}}).then(function(e){return"arrayBuffer"===a?JSON.stringify(Array.apply(null,new Uint8Array(e))):e}).then(function(e){t(e)}).catch(function(e){t({error:e})}),!0}),browser.runtime.onInstalled&&browser.runtime.onInstalled.addListener(function(e){"update"===e.reason&&parseInt(e.previousVersion.replace(/\./g,""))<213&&browser.storage.local.clear()}),browser.runtime.onUpdateAvailable&&browser.runtime.onUpdateAvailable.addListener(function(e){console.log("Have a new version:"+e.version),browser.runtime.reload()})},7:function(e,r){"use strict";Object.defineProperty(r,"__esModule",{value:!0}),window.browser="undefined"!=typeof browser?browser:chrome;var t=(r.POPENV=!!browser.windows,r.getUILanguage=function(){var e=browser.i18n.getUILanguage()||"en";return"en"===e.slice(0,2)&&(e="en"),e=e.replace(/_/g,"-")},r.getAbsoluteURL=function(e){return browser.extension.getURL(e)},r.setUserDataAndSendMessage=function(e,r){browser.storage.local.get("userData",function(t){var n=t.userData,o={userData:Object.assign({},n,e)};browser.storage.local.set(Object.assign({},t,o),function(){r&&browser.tabs.query({},function(e){e.forEach(function(e){browser.tabs.sendMessage(e.id,{type:"reload"})})})})})},r.getRangeFromPoint=function(e,r){var t=void 0,n=void 0,o=void 0;if(document.caretPositionFromPoint)t=document.caretPositionFromPoint(e,r),n=t.offsetNode,o=t.offset;else{if(!document.caretRangeFromPoint)return"";t=document.caretRangeFromPoint(e,r),n=t.startContainer,o=t.startOffset}return{node:n,offset:o}});r.getWordFromPoint=function(e,r,n){var o=void 0,a=void 0,s=void 0,i=void 0,u=void 0,c=void 0,f=/((?=[\x00-\x7e]+)[^A-Za-z-'])/,d=function(e,r){if(!r)return!1;"string"==typeof e&&(e=document.querySelector(e)),"string"==typeof r&&(r=document.querySelector(r));for(var t=[e],n=1;(t[0]=t[0].parentNode)&&9!==t[0].nodeType;)r===t[0]&&(t[n]=t[0],n++);return 2===n};if(o=t(e,r),a=o.node,s=o.offset,!a||a.nodeType!==Node.TEXT_NODE)return"";if(d(a,n))return"";if(i=a.data,s>=i.length&&(s=i.length-1),s===i.length-1)return"";if(i[s].match(f))return"";for(var l=s;l>-1;l--)if(0===l||i[l-1].match(f)){u=l;break}for(var g=s;g<i.length;g++)if(g===i.length||i[g].match(f)){c=g;break}return i.substring(u,c)}}});