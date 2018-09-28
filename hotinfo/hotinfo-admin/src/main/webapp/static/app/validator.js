var Validator = function () {

    /**
     * 初始化表单
     */
    var handlerInitValidateForm = function () {
        initValidateMethod();

        $("#inputForm").validate({
            errorElement: 'span',
            errorClass: 'help-block',

            errorPlacement: function (error, element) {
                element.parent().parent().attr("class", "form-group has-error");
                error.insertAfter(element);
            }
        });

        // 自定义校验规则
        function initValidateMethod() {
            // 手机验证
            $.validator.addMethod("mobile", function(value, element) {
                var length = value.length;
                var mobile =  /^(17[0-9]|13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\d{8}$/;
                return this.optional(element) || (mobile.test(value));
            }, "手机号码格式错误");
        }
    };

    return {
        initValidateForm: function () {
            handlerInitValidateForm();
        }
    }
}();

$(function () {
   Validator.initValidateForm();
});