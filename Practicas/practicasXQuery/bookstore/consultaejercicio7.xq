(:Mostrar el precio mínimo y máximo de los libros.:)
let $x := max(doc('bookstore.xml')/bookstore/book/price),
    $c := min(doc('bookstore.xml')/bookstore/book/price)
return <libros><maximo>{$x}</maximo>
       <minimo>{$c}</minimo></libros>

