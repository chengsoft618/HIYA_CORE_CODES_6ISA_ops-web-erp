<script type="text/javascript">
function submit_${taskId!''}submitForm12(isLocation){
	var channels = ''; 
	var channelName = [];
	$('input[name="${taskId!''}channelname1055"]:checked').each(function(){ 
		channels+=$(this).val()+","; 
		channelName.push($(this).next('span').text());
	});
	if(channelName.length === 0 && channels === '') {
		$.jBox.tip("请确保不合格图片让商户重传，合格的请确认已通过邮件发送给设计师！", 'error');
		return;
	}
		
	var submit = function (v, h, f) {
			if (v == 'ok') {
					$.jBox.tip("正在修改，请稍等...", 'loading', {
					timeout : 3000,
					persistent : true
			});
			$.post("../jyk/flow/accountZhixiao/popularize_picture_material_consult_zhixiao", {
					taskId:$("#${taskId!''}taskIdTest12").val(),
					procInsId:$("#${taskId!''}procInsIdTest12").val()
				}, 
			function(data) {
				if (data.result) {
					if(isLocation==1){
						if (typeof updatePage === 'function') {
							updatePage();
						} else {
							window.location.href="../workflow/tasklist";
						}
					}else{
						window.location.reload();
					}
				} else {
					$.jBox.closeTip();
					$.jBox.info(data.message);
				}
			});
		}
		return true; 
	};
	$.jBox.confirm("确认完成推广图片素材查阅吗？", "提示", submit);
}
</script>
<input type='hidden' id='${taskId!''}taskIdTest12' name='taskIdTest' value="${taskId!''}"/>
<input type='hidden' id='${taskId!''}procInsIdTest12' name='procInsIdTest'  value="${procInsId!''}"/>
<div class="act-rs-item  ${detailType!''}  ${followTaskDetailWrap!''}">
	<div class="act-rs-left floatleft">
		<div class="act-rs-title padding15">
				<h3><a href="../workflow/taskDetail?taskId=${taskId!''}&followTaskDetailWrap=${followTaskDetailWrap!''}&detailType=${detailType!''}">${taskName!''}</a></h3>
			<div class="listSubmit">
				<button  onclick="submit_${taskId!''}submitForm12()" type="button" class="makesrue btn btn-primary">确定完成</button>
				<a href="javascript:;" class="select-user open-select-user" style="float: left;" onclick="syncSelect('${taskId!''}', '${taskUser!''}','${taskUserId!''}')"></a>
			</div>
			<div class="taskPrincipal"><span class="taskPrincipalName">${taskUser!''}</span></div>
		</div>
		<div class="act-rs-form padding15">
			<div class="rs-label">
				<label class="subTask" value="1">
					<span>选择的门店：${storeName!''}&nbsp;&nbsp;&nbsp;
<!-- 						<a href="javascript:;" class="showStorePopularizePic" data-datas="${storeId!''},zhixiao">查看</a> -->
					</span>
					<input type="hidden" class="hide" value="just">
				</label>
			</div>
			<div class="rs-label">
				<input type="checkbox" name="${taskId!''}channelname1055" />
				<label class="subTask">
					推广图片素材查阅；不合格图片让商户重传；合格的请确认已通过邮件发送给设计师
				</label>				
			</div>		
				
		</div>
	</div>
	<div class="act-rs-right">
		<div class="padding15">
			<div class="act-time">开始：${startDate!''}</div>
			<div class="act-time">到期：${endDate!''}</div>
			<div class="act-jd">
			 <#if taskConsumTime?? && (taskConsumTime < taskConsumTimeMin) >
					<div class="progress progress-success">
						<div class="bar" style="width: ${taskConsumTime!''}%"></div>
					</div>
			<#elseif taskConsumTime?? && (taskConsumTime > taskConsumTimeMin && taskConsumTime < taskConsumTimeMax)>
					<div class="progress progress-warning">
						<div class="bar" style="width: ${taskConsumTime!''}%"></div>
					</div>
			<#else>
				<div class="progress progress-danger">
						<div class="bar" style="width: 100%"></div>
					</div>
			</#if>
			</div>
			<div class="act-jd-word positionrelative"><div class="acjw positionrabsolute" style="left: 80%;">${taskConsumTime!''}%</div></div>
		</div>
	</div>
		<div class="act-process-left-footer" >
		<div class="footer-info floatleft">
			<p></p>
			<p>负责人：${taskUser!''}</p>
		</div>
		<div class="footer-btn floatright">
			<button style="button" class="btn btn-large"  onclick="submit_${taskId!''}submitForm12(1)">确定完成</button>
			<span class="flowTaskState hide">已完成</span>
		</div>
	</div>
</div>