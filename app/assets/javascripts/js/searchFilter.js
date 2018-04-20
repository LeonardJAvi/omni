$(window).on('load', function(){
  $( function() {

    createItems();

    var $container = $('.grid').isotope({
      itemSelector: '.element-item',
    });

    // filter with selects and checkboxes
    var $selects = $('.select-filter');
    var $checkboxes = $('input[type="checkbox"]');

    $selects.add( $checkboxes ).change( function() {
      // map input values to an array
      var exclusives = [];
      var inclusives = [];
      // exclusive filters from selects
      $selects.each( function( i, elem ) {
        if ( elem.value ) {
          exclusives.push( elem.value );
        }
      });
      // inclusive filters from checkboxes
      $checkboxes.each( function( i, elem ) {
        // if checkbox, use value if checked
        if ( elem.checked ) {
          inclusives.push( elem.value );
        }
      });
      // combine exclusive and inclusive filters
      // first combine exclusives
      exclusives = exclusives.join('');

      var filterValue;
      if ( inclusives.length ) {
        // map inclusives with exclusives for
        filterValue = $.map( inclusives, function( value ) {
          return value + exclusives;
        });
        filterValue = filterValue.join(', ');
      } else {
        filterValue = exclusives;
      }


      $container.isotope({ filter: filterValue })
    });
  });

  var colors = [ 'todos', 'plan', 'hotel', 'actividad' ];
  var sizes = [ 'barranquilla', 'eje-cafetero'];

  function createItems() {

    var $items;

    for (  var i=0; i < colors.length; i++ ) {
      for ( var j=0; j < sizes.length; j++ ) {

          var color = colors[i];
          var size = sizes[j];
          var $item = $('<div />', {
            'class': 'item ' + color + ' ' + size
          });
          $item.append( '<p>' + size + '</p><p>$');
          // add to items
          $items = $items ? $items.add( $item ) : $item;

      }
    }

    // $items.appendTo( $('#container') );

  }


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
