$("#file1").change(function(){
    readURL(this, 1);
});

$("#file2").change(function(){
    readURL(this, 2);
});

$("#file3").change(function(){
    readURL(this, 3);
});

function readURL(input, i) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#image_section'+i).attr('src', e.target.result);
            $('#image_section'+i).css("display","");
            $('#add_button'+i).css("display","none");
        }

        reader.readAsDataURL(input.files[0]);
    }
}
