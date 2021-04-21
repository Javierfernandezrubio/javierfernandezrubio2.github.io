(:Mostrar el título del libro, su precio y su precio con el IVA incluido, cada uno con su propia etiqueta. Ordénalos por precio con IVA:)
for $x in doc('bookstore.xml')/bookstore/book
order by $x/price*1.21
return <libros>
        {$x/title}
        {$x/price}
        <precioiva>{$x/round(price*1.21,2)}</precioiva>
       </libros>