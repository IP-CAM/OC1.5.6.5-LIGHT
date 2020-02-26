var TLSCookiesEU={message:'This Online Shop uses cookies...',button_text:'I understand',info_link_text:'More...',info_link:'https://el.wikipedia.org/wiki/HTTP_cookies',exdays:0,style:'\
    #tlscookieseu-bar {\
        background-color: rgba(42,59,39,0.9);\
        color: #eeeeee;\
        font-size: 14px;\
        text-align: center;\
        padding: 15px 5px 15px 5px;\
        position: fixed;\
        bottom: 0;\
        left:0;\
        width: 100%;\
        display: block;\
        z-index: 999999;\
    }\
    #tlscookieseu-bar a, #tlscookieseu-bar a:visited {\
        margin: 5px;\
        text-decoration: none;\
        color: #ffffff;\
    }\
    #tlscookieseu-ok {\
        text-decoration: none;\
        background-color: #008800;\
        color: #ffffff;\
        padding: 5px;\
        border-radius: 3px;\
    }\
    ',set:function(){if(TLSCookiesEU.exdays>0){var d=new Date();d.setTime(d.getTime()+(TLSCookiesEU.exdays*24*60*60*1000));document.cookie='TLSCookiesEU=OK; '+"expires="+d.toUTCString();}else{document.cookie='TLSCookiesEU=OK;';}},get:function(){var name='TLSCookiesEU=';var ca=document.cookie.split(';');for(var i=0;i<ca.length;i++){var c=ca[i];while(c.charAt(0)==' '){c=c.substring(1);}
if(c.indexOf(name)==0){return c.substring(name.length,c.length);}}
return'';},show:function(){var html='\
            <style>'+TLSCookiesEU.style+'</style>'+'<div id="tlscookieseu-bar">'+TLSCookiesEU.message+'<a href="'+TLSCookiesEU.info_link+'" target="_blank">'+TLSCookiesEU.info_link_text+'<\a>'+'<a href="" id="tlscookieseu-ok">'+TLSCookiesEU.button_text+'</a></div>'
$('body').append(html);$('#tlscookieseu-ok').click(function(event){TLSCookiesEU.set();$('#tlscookieseu-bar').fadeOut(300,function(){$('#tlscookieseu-bar').remove()});event.preventDefault();});},run:function(){if(TLSCookiesEU.get()=='OK'){return;}else{TLSCookiesEU.show();}}}
$(function(){TLSCookiesEU.run();});