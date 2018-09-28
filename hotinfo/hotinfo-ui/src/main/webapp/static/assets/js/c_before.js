(function($) {
	if($.conjs.contentIndexId){
		if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
			window.location.href = 'https://wap.xinmin.cn/content/'+$.conjs.contentIndexId+'.html';
		}
	}
})(jQuery);