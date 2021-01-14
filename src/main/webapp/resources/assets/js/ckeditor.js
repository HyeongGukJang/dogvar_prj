ClassicEditor 

    .create( document.querySelector( '#brdmemo' ) ) 

    .then( editor => { 

        console.log( editor ); 

    } ) 

    .catch( error => { 

        console.error( error ); 

    } );