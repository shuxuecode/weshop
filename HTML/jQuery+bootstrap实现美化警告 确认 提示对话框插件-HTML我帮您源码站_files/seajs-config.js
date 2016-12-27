seajs.config({
	base : app.base,
	alias : {
		'jquery' : 'jquery/1.11.2/jquery',
		'$' : 'jquery/1.11.2/jquery',
		'bootstrap' : 'bootstrap/3.3.5/bootstrap',
		'bootstrapValidator' : 'jquery/bootstrapValidator/js/bootstrapValidator',
		'bootstrapValidator-zh-cn' : 'jquery/bootstrapValidator/js/language/zh_CN',
		"bootstrapValidator-css": "jquery/bootstrapValidator/css/bootstrapValidator.min.css",
		'jquery-confirm' : 'jquery/jquery-confirm/js/jquery-confirm',
		'jquery-confirm-css' : 'jquery/jquery-confirm/css/jquery-confirm.css',
		'pym' : 'pym/pym',
		'pushy' : 'pushy/pushy',
		'iscroll' : 'iscroll/iscroll',
		'iscroll-infinite' : 'iscroll/iscroll-infinite',
		'responsiveiframe' : 'jquery/jquery.responsiveiframe',
		'html580' : 'html580/1.0.0/html580',
		'form' : 'jquery/jquery.form',
		'cookie' : 'jquery/jquery.cookie',
		'lazyload' : 'jquery/jquery.lazyload'
	},
	// 变量配置
	vars : {
		'locale' : 'zh-cn'
	},
	charset : 'utf-8',
	debug : app.debug

});
