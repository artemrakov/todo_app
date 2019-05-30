import selectize from 'selectize'
import "selectize/dist/css/selectize.css";


$('.tag_list').selectize({
    create: function(input) {
        return {
            value: input,
            text: input
        }
    }
});
