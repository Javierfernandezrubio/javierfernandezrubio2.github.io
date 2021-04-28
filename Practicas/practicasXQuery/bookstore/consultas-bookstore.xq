(: 1. Mostrar los títulos de los libros con la etiqueta "titulo".:)
for $x in doc("Biblioteca.xml")/bookstore/book/title
return <titulo>{data($x)}</titulo>

(: 2. Mostrar los libros cuyo precio sea menor o igual a 30. Primero incluyendo la condición en la cláusula "where" y luego en la ruta del XPath.:)
(:for $x in doc('bookstore.xml')/bookstore/book
where $x/price<=30
return $x/title:)
for $x in doc('bookstore.xml')/bookstore/book[price<=30]
return $x/title

(:3.Mostrar sólo el título de los libros cuyo precio sea menor o igual a 30.:)
for $x in doc('bookstore.xml')/bookstore/book[price<=30]
return <title>{$x/title/text()}</title>



(: 5. Mostrar el título y el autor de los libros del año 2005, y etiquetar cada uno de ellos con "lib2005".:)
<libreria>
{
for $x in doc('bookstore.xml')/bookstore/book
where $x/year=2005
return 
<lib2005>
{$x/title}
{$x/author}
</lib2005>
}
</libreria>

(: 6. Mostrar los años de publicación, primero con "for" y luego con "let" para comprobar la diferencia entre ellos. Etiquetar la salida con "publicacion".:)
(:for $x in doc('bookstore.xml')/bookstore/book
return 
<publicacion>{$x/year}</publicacion>:)
let $x := doc('bookstore.xml')/bookstore/book/year
return 
<publicacion>{$x}</publicacion>

(: 7. Mostrar los libros ordenados primero por "category" y luego por "title" en una sola consulta.
for $x in doc ("Biblioteca.xml")/bookstore/book
order by $x/@category,$x/title
return $x
:)
for $x in doc('bookstore.xml')/bookstore/book
order by $x/@category, $x/title
return 
<libros categoria='{$x/@category}'>
{$x/title}
</libros>

(: 8. Mostrar cuántos libros hay, y etiquetarlo con "total".
:)
let $x := count(doc('bookstore.xml')/bookstore/book)
return 
<total>
{$x}
</total>

(:9.Mostrar los títulos de los libros y al final una etiqueta con el número total de libros.:)
let $t := count(doc('bookstore.xml')/bookstore/book),
    $titulos := (for $x in doc('bookstore.xml')/bookstore/book return <title>{$x/title/text()}</title>)
  return <libros>
  {$titulos}
  <total>{$t}</total>
  </libros>

(: 10. Mostrar el precio mínimo y máximo de los libros.:)
let $x := max(doc('bookstore.xml')/bookstore/book/price),
    $c := min(doc('bookstore.xml')/bookstore/book/price)
return <libros><maximo>{$x}</maximo>
       <minimo>{$c}</minimo></libros>


(: 11. Mostrar el título del libro, su precio y su precio con el IVA incluido, cada uno con su propia etiqueta. Ordénalos por precio con IVA:)
for $x in doc('bookstore.xml')/bookstore/book
order by $x/price*1.21
return <libros>
        {$x/title}
        {$x/price}
        <precioiva>{$x/round(price*1.21,2)}</precioiva>
       </libros>


(: 12. Mostrar la suma total de los precios de los libros con la etiqueta "total".
:)
let $x := sum(doc('bookstore.xml')/bookstore/book/price)
return <libros><total>{$x}</total>
       </libros>


(: 13. Mostrar cada uno de los precios de los libros, y al final una nueva etiqueta con la suma de los precios.
:)
<Precios>
{
for $i in doc('bookstore.xml')/bookstore/book/price
return <price>{$i/text()}</price>
}
{
let $x := sum(doc('bookstore.xml')/bookstore/book/price)
return <total>{$x}</total>
}
{
}
</Precios>


(: 14. Mostrar el título y el número de autores que tiene cada título en etiquetas diferentes.:)
for $x in doc('bookstore.xml')/bookstore/book
(:let $i := count(doc('bookstore.xml')/bookstore/book/author):)
return <libros>
          <title>{$x/title/text()}</title>
          <autores>{count($x/author)}</autores>
       </libros>


(: 15. Mostrar en la misma etiqueta el título y entre paréntesis el número de autores que tiene ese título.
:)
for $x in doc('bookstore.xml')/bookstore/book
(:let $i := count(doc('bookstore.xml')/bookstore/book/author):)
return <libros>
          <title>{$x/title/text()}({count($x/author)})</title>
       </libros>

(: 15. Mostrar en la misma etiqueta el título y el número de autores que tiene ese título sea un atributo
:)
<libros>
{
for $x in doc('bookstore.xml')/bookstore/book
(:let $i := count(doc('bookstore.xml')/bookstore/book/author):)
return <title autores="{count($x/author)}">{$x/title/text()}</title>
}
</libros>


(: 16. Mostrar los libros escritos en años que terminen en "3":)
(:<libros>
{
for $x in doc('bookstore.xml')/bookstore/book
where ends-with($x/year,"3")
return <titulo>{$x/title/text()}</titulo>
}
</libros>:)

<libros>
{
let $x := doc('bookstore.xml')/bookstore/book[ends-with(year,'3')]
return <titulo>{$x/title/text()}</titulo>
}
</libros>


(: 17. Mostrar los libros cuya categoría empiece por "C".
:)
<libros>
{
for $x in doc('bookstore.xml')/bookstore/book
where starts-with($x/@category,"C")
return <titulo>{$x/title/text()}</titulo>
}
</libros>



(: 18. Mostrar los libros que tengan una "X" mayúscula o minúscula en el título ordenados de manera descendente:)
<libros>
{
  
  for $x in doc('bookstore.xml')/bookstore/book
  where contains($x/title,"x") or contains($x/title, "X")
  order by $x/title descending
  return <titulo>{$x/title/text()}</titulo>
}
</libros>


(: 22. Mostrar los títulos en una tabla de HTML:)
<html>
<table>
  <th>Titulo</th>
{
for $x in doc('bookstore.xml')/bookstore/book/title
return
       <tr>
        <td>{$x}</td> 
       </tr>
}
</table>
</html>