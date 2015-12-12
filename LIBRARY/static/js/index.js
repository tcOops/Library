function addData(){
	var checkboxs = $('.selectNode')
	var nodeIds = ""
	var flag = false
	for(var i = 0; i < checkboxs.length; ++i){
		if(checkboxs[i].checked){
			console.log(i)
			if(flag) nodeIds += ','
			else flag = true
			nodeIds += checkboxs[i].value.toString()
		}
	}
	console.log('abs', nodeIds)
	$('#reserveData').val(nodeIds)
}

function addDatas(){
	var checkboxs = $('.selectNode')
	var nodeIds = ""
	var flag = false
	for(var i = 0; i < checkboxs.length; ++i){
		if(checkboxs[i].checked){
			console.log(i)
			if(flag) nodeIds += ','
			else flag = true
			nodeIds += checkboxs[i].value.toString()
		}
	}
	console.log('abs', nodeIds)
	$('#reserveDatas').val(nodeIds)
}

function choseAll(){
	var checkboxs = $('.selectNode')
	for(var i = 0; i < checkboxs.length; ++i){
		checkboxs[i].checked = true
	}
}

function choseReverse(){
	var checkboxs = $('.selectNode')
	for(var i = 0; i < checkboxs.length; ++i){
		checkboxs[i].checked ^= 1
	}
}

function getDescription(content){
	var contents = ""
	while(content){
		contents += content.substr(0, 30) + '\n'
		content = content.substr(30);
	}
	$('#nodeDesc').html(contents)
}