/*
 * file everywhere - 浏览器通用文件上传
 * copyright->flowerszhong
 * flowerszhong@gmail.com
 * http://www.cnblogs.com/flowerszhong/
 */
(function($) {
	$.fn.fileEveryWhere = function(options) {
		var defaults = {
			WrapWidth : 300,
			WrapHeight : 30,
			ButtonWidth : 60,
			ButtonHeight : 28,
			ButtonText : "浏览",
			ButtonClass: '',
			TextHeight : 28,
			TextWidth : 240,
			TextClass: ''
		};
		var options = $.extend(defaults, options);
		var browser_ver = $.browser.version.substr(0, 1);
		var displayMode = ($.browser.msie && browser_ver <= "7") ? "inline"
				: "inline-block";
		return this.each(function(i, n) {
			// 创建包含，设置为相对定位
			var wrapper = $("<div class='fileWraper'>").css({
				"width" : options.WrapWidth + "px",
				"height" : options.WrapHeight + "px",
				"display" : displayMode,
				"zoom" : "1",
				"position" : "relative",
				"overflow" : "hidden",
				"z-index" : "1"
			});
			// 创建文本输入框，用于存放上传文件名称
			var text = $('<input class="filename" type="text" />').css({
				"width" : options.TextWidth + "px",
				"heigth" : options.TextHeight + "px"
			}).addClass(options.TextClass);
			// 创建浏览按钮
			var button = $('<input class="btnfile" type="button" />').val(
					options.ButtonText).addClass(options.ButtonClass);
			$(this).wrap(wrapper).parent().append(text, button);
			$(this).css({
				"position" : "absolute",
				"top" : "0",
				"left" : "0",
				"z-index" : "2",
				"height" : options.WrapHeight + "px",
				"width" : options.WrapWidth + "px",
				"cursor" : "pointer",
				"opacity" : "0.0",
				"outline" : "0",
				"filter" : "alpha(opacity:0)"
			});
			if ($.browser.mozilla) {
				$(this).attr("size", 1 + (options.WrapWidth - 85) / 6.5)
			}
			$(this).bind("change", function() {
				text.val($(this).val());
			});
		});
	};
})(jQuery);