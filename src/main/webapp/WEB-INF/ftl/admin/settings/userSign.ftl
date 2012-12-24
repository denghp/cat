<#include "macro-head.ftl">
<!DOCTYPE html>
<html>
<head>
<@head title="${appTitle}">
<meta name="keywords" content="${metaKeywords}"/>
<meta name="description" content=""/>
</@head>
</head>
<body>
<div class="container body-container">
	<#include "header.ftl">
	<div class="row">
		<div class="span3">
			<#include "admin/side.ftl">
		</div>
		<div class="span9">
			<section>
				<legend>网站参数</legend>
				<form id="signs-form" class="form-horizontal" action="${contextPath}/admin/settings/webSign.json" method="post">
					<div class="control-group">
						<label class="control-label" for="sign1">签名档1：</label>
						<div class="controls">
						<textarea id="sign1" name="signs" rows="5">还没开发呐</textarea>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="sign2">签名档2：</label>
						<div class="controls">
						<textarea id="sign2" name="signs" rows="5">还没开发呐</textarea>
						</div>
					</div>
					<div class="control-group">
						<div class="controls">
						<button type="submit" class="btn btn-primary">更改</button>
						<div class="alert alert-info line-alert help-inline" style="display: none;">
				      	<!-- 
				      	<button type="button" class="close" data-dismiss="alert">×</button>
				      	 -->
							<span id="msg-submit" class="">
							</span>
				      </div>
						</div>
					</div>
				</form>
			</section>
		</div>
	</div>
	<#include "footer.ftl">
</div>
<script type="text/javascript" src="${contextPath}/js/form/jquery.form.js"></script>
<script type="text/javascript">
$("#nav-settings-userSign").addClass("active");
$('#signs-form').ajaxForm({
	//dataType:"json",
	beforeSerialize:function($form, options) {
	},
	beforeSubmit:function(formData, jqForm, options) {
	},
	success:function(data) {
		if (data && data.fieldErrorList) {
			$(".control-group").removeClass("error");
			for ( var i = 0; i < data.fieldErrorList.length; i++) {
				var error = data.fieldErrorList[i];
				$("[name='"+error.field+"']")
					.tooltip({title:error.defaultMessage,placement:"left"})
					.tooltip('show')
					.keypress(function(){
						$(this).tooltip("destroy").unbind();
						$(this).parent().removeClass("error");
					})
					.parent().addClass("error");
				//$("#msg-"+error.field).html(error.defaultMessage).parent().addClass("error");
			}
		} else if (data) {
			if (data.result) {
				// TODO alert有问题，默认点关闭后删除了，下次保存就显示不出来，需要处理一下
				$("#msg-submit").html("更新成功").parent().show();
			} else {
				$("#msg-submit").html(data.message).parent().show();
			}
		}
	},
	error:function(jqXHR, textStatus, errorThrown) {
		$("#msg-submit").html(textStatus+jqXHR.responseText).parent().show();
	}
});
</script>
</body>
</html>