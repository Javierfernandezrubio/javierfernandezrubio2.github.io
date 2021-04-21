(:Mostrar los libros que tengan una "X" mayúscula o minúscula en el título ordenados de manera descendente:)
<libros>
{
  
  for $x in doc('bookstore.xml')/bookstore/book
  where contains($x/title,"x") or contains($x/title, "X")
  order by $x/title descending
  return <titulo>{$x/title/text()}</titulo>
}
</libros>