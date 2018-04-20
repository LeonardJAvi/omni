
  $(window).on('load', function(){
    $(function(){
        var $container = $('.grid'),
        $checkboxes = $('input[type="checkbox"]');
        $container.isotope({
          itemSelector: '.element-item',
          isFitWidth: true,
        });
        $checkboxes.change(function(){
          var filters = [];
          $checkboxes.filter(':checked').each(function(){
            filters.push( this.value );
          });
          filters = filters.join(', ');
          $container.isotope({ filter: filters });
        });
    });

     $('input[type="checkbox"]' ).on( 'change', function() {
      if( $(this).is(':checked') ) {
        if( $(this).is('#todos') ){ 
          $('#pln').prop('checked', false);
          $('#htl').prop('checked', false);
          $('#atc').prop('checked', false);
          $t = 4;
        }
        else if( $(this).is('#pln') ){ 
          $('#todos').prop('checked', false);
          $p = 1;
        }
        else if ( $(this).is('#htl') ){  
          $('#todos').prop('checked', false);
          $h = 2;
        }
        else if ( $(this).is('#atc') ){  
          $('#todos').prop('checked', false);
          $a = 3;
        };
      } 
      else{ 
          if( $(this).is('#todos') ){             
            $t = 0;
          }
          else if( $(this).is('#pln') ){ 
            $p = 0;
            
          }
          else if ( $(this).is('#htl') ){  
            $h = 0;
          }
          else if ( $(this).is('#atc') ){   
            $a = 0;
          };
          // alert("Checkbox  ha sido deseleccionado" );
      }
    }); //end change



  }); //end windows load   