let battry;
let tires;
let rimes;
const url1='http://localhost:8088/TireShop/Api/Tires';
const url2='http://localhost:8088/TireShop/Api/Battries';
const url3='http://localhost:8088/TireShop/Api/Rimes';

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

$.ajax({
	  url: url3,
	})
	.done(function(res) {
		rimes=res;
	})
	.fail(function(err) {
	  console.log('Error: ' + err.status);
	});

    $(document).ready(function () {
 
        
        $('#type').on('click keydown',function () {
        	let productData=null;
          if($('#type') .val() =='Tire')
          {
                productData=tires;
          }
          else if ($('#type') .val() =='Battry')
          {
        	  productData=battry;
        	  console.log('testttt')
          }
          else if ($('#type') .val() =='Rimes')
          {
        	  productData=rimes;
          }
          else if ($('#type') .val() =='none')
          {
        	  productData=null;
          }
          $('#product').empty();      
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
   
    
  