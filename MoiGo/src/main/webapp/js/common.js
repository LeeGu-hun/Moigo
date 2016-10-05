function goRegister() {
	location.href = '/moigo/register';
}
function logout(){
	location.href = '/moigo/logout';
}
function showLogin(){
	$('#loginBox2').toggle();
}
function addGroup() {
	location.href = 'addgroup';
}
function goModify() {
	location.href= '/moigo/modifyForm';
}
function joinGroup() {
	if(confirm('가입하시겠습니까?')) {
		document.write("네");
		document.grpJoin.submit();
	} else {
		document.write("아니오");
		location.href='';
	}
}