let battry;
let tires;
const url1='http://localhost:8088/TiresShop_App/Api/Tires';
const url2='http://localhost:8088/TiresShop_App/Api/Battries';


$.ajax({
  url: url1,
})
.done(function(res) {
	tires=res;
})
.fail(function(err) {
  console.log('Error: ' + err.status);
});

$.ajax({
	  url: url2,
	})
	.done(function(res) {
		battry=res;
	})
	.fail(function(err) {
	  console.log('Error: ' + err.status);
	});

    $(document).ready(function () {

        $('#type').click(function () {
          let productData;
          
          if($('#type') .val() =='Tires')
          {
                productData=tires;
          }
          else 
          {
        	  productData=battry;
          }
                $.each(productData, function (index, value) {
                    
          	
                    $('#product').append('<option value="' + productData[index].name +'"id="'+productData[index].id +'">' + productData[index].name + '</option>');
                    
                });

        });
       
        // SHOW SELECTED VALUE.
        $('#type').change(function () {
            $('#product').empty();
          
        });
    
        $('#product').change(function () {
     
            productIds=this.options[this.selectedIndex].id;
        
            $('input[name="productId"]').val(productIds)
            
        });
    });
   
    
  