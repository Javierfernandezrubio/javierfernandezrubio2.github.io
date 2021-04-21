(:Mostrar cuántos libros hay, y etiquetarlo con "total".
:)
let $x := count(doc('bookstore.xml')/bookstore/book)
return 
<total>
{$x}
</total>
