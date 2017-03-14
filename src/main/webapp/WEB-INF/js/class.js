$(function(){
    pageInit();
});
function pageInit(){
    jQuery("#list13").jqGrid(
        {
            url: '../class/queryItems',
            datatype: "json",
            colModel: [
                { label: 'id', name: 'id', width: 50, key: true },
                { label: '班级名称', name: 'name', width: 80 },
                { label: '年级', name: 'grade', width: 80 },
                { label: '学校ID', name: 'schoolId', width: 80 },
                { label: '所属学院', name: 'departmentId', width: 80 },
                { label: '所属专业', name: 'professionId', width: 80 }
            ],
            rowNum : 10,
            rowList : [ 10, 20, 30 ],
            pager : '#pager13',
            sortname : 'id',
            viewrecords : true,
            sortorder : "desc",
            multiselect : true,
            multikey : "ctrlKey",
            caption : "班级列表",
        });
    jQuery("#cm1").click(function() {
        var s;
        s = jQuery("#list13").jqGrid('getGridParam', 'selarrrow');
        alert(s);
    });
    jQuery("#cm1s").click(function() {
        jQuery("#list13").jqGrid('setSelection', "13");
    });
    jQuery("#list13").jqGrid('navGrid', '#pager13', {
            add : false,
            edit : false,
            del : false
        },
        {}, // edit parameters
        {}, // add parameters
        {reloadAfterSubmit : false}//delete parameters
    );
}