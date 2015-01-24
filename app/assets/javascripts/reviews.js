function setSlider() {
    $("#new_review").change(function () {
        $form = $(this);
        $input_value = $form.children("#review_rating").val();
        $final_input = $input_value == 0 ? "None" : $input_value;
        $label = $form.children("#review_rating").prev();
        $label.text("Rating: " + $final_input);
    });
}