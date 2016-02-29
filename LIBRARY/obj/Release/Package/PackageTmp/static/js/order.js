function getNodeDetail(nodeId){
	url = "/control/nodedetail/"
	data = new Object()
	data.nodeId = nodeId.toString()
	$.ajax({
		type : 'post',
		dataType : 'json',
		url : url,
		async : true,
		data :  data,

		success : function(response){
			b = response
			//Construct Data 
			console.log("ok")
			constructNodeDetail(response[0])
		},

		error : function(response){
			console.log("Oops,  some errors !")
		}
	})
}

function getLocalTime(nS) {     
    return new Date(parseInt(nS) * 1000).toLocaleString().substr(0,17)
}   

function constructNodeDetail(data){
	name = data.fields.name
	description = data.fields.description
	var contents = ""
	while(description){
		contents += description.substr(0, 30) + '\n'
		description = description.substr(30);
	}
	contents += '\n\n\n'
	url = data.fields.url
	ip = data.fields.ip
	port = data.fields.port
	type = data.fields.type
	status = data.fields.status
	createTime = getLocalTime(data.fields.timestamp)
	var html = ""
	html = html + '<div style="height:30px"> <span style="margin-right:10px; font-weight:bold"> 节点名称: </span>' + name +  '</div>'
	html += '<div> <span style="margin-right:10px; font-weight:bold">节点描述 : </span>' + contents + '</div>'
	html += '<div style="height:30px"> <span style="margin-right:10px; font-weight:bold">节点url : </span>' + url + '</div>'
	html += '<div style="height:30px"> <span style="margin-right:10px; font-weight:bold">节点ip : </span>' + ip + '</div>'
	html += '<div style="height:30px"> <span style="margin-right:10px; font-weight:bold;">节点port : </span>' + port + '</div>'
	html += '<div style="height:30px"> <span style="margin-right:10px; font-weight:bold">节点类型: </span>' + type + '</div>'
	html += '<div style="height:30px"> <span style="margin-right:10px; font-weight:bold">节点状态 : </span>' + status + '</div>'
	html += '<div style="height:30px"> <span style="margin-right:10px; font-weight:bold">节点创建时间 : </span>' + createTime + '</div>'
	$('#nodeContent').html(html)
}

function getDescription(content){
	var list = content.split('|||')
	var contents = ""
	for(var i = 0; i < list.length; ++i){
		contents += list[i] + '</br>'
	}
	$('#nodeDesc').html(contents)
}