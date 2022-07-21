initChina();
function initChina(){
    //var url = "https://restapi.amap.com/v3/config/district?keywords=中华人民共和国&subdistrict=3&key=73e1bcac65854dd6aae8ca9acd487aeb";
    var china;
    $.get('/js/pcr.js',function (data){
        china = data;
        //取出所有省份
        var provinces = data.districts[0].districts;

        //加载省信息
        for(var province of provinces){
            $('#province')
                .append("<option value="+province.name+">"+province.name+"</option>");
        }

        //先初始化默认的省市区
        var firstProvince = data.districts[0].districts[0];
        //取出该省的市
        var cities = firstProvince.districts;
        //加载市
        var cityContent = "";
        for(var city of cities){
            cityContent += "<option value="+city.name+">"+city.name+"</option>";
        }
        $('#city').html(cityContent);

        var firstCity = cities[0];
        //加载县区
        var regions = firstCity.districts;
        console.log(regions);
        var regionContent = "";
        for(var region of regions){
            regionContent += "<option value="+region.name+">"+region.name+"</option>";
        }
        $('#region').html(regionContent);
    },'json');

    //选择省
    $('#province').change(function (){
        //取出所有省份
        var provinces = china.districts[0].districts;
        for(var province of provinces){
            if($(this).val() == province.name){
                //取出该省下的所有市
                var cities = province.districts;
                console.log(cities);
                var content = "";
                //判断上海市、天津市、北京市三个直辖市
                if(cities.length == 1){
                    var regions = cities[0].districts;
                    for(var region of regions){
                        content += "<option value="+region.name+">"+region.name+"</option>";
                    }
                    $('#city').html(content);
                    //region不显示
                    $('#region').css('display','none');
                }else{
                    $('#region').css('display','inline');
                    for(var city of cities){
                        content += "<option value="+city.name+">"+city.name+"</option>";
                    }
                    $('#city').html(content);
                }

                //初始化县区
                var text = "";
                var regions = cities[0].districts;
                for(var region of regions){
                    text += "<option value="+region.name+">"+region.name+"</option>";
                }
                $('#region').html(text);
            }
        }
    });

    //选择市
    $('#city').change(function (){
        //取出所有省份
        var provinces = china.districts[0].districts;
        var content = "";
        for(var province of provinces){
            //取出该省下的所有市
            var cities = province.districts;
            for(var city of cities){
                //取出市下的所有区
                var regions = city.districts;
                for(var region of regions){
                    if($(this).val() == city.name){
                        content += "<option value="+region.name+">"+region.name+"</option>";
                    }
                }
            }
        }
        $('#region').html(content);
    });
}