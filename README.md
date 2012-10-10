Initial data came from:

http://www.starling-software.com/employment/programmer-competency-matrix.html

jQuery:
$('tr.q').each(function(idx, row) {
  console.log(JSON.stringify(
    $(row).find('td').map(function(idx, col) { return {answer:col.innerHTML} })
  ));
});

Enter your responses to a form: http://formr.herokuapp.com/responses/new?form_id=2
View loaded form: http://formr.herokuapp.com/forms?id=2
