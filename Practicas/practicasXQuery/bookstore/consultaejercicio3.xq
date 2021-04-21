(:Mostrar el título y el autor de los libros del año 2005, y etiquetar cada uno de ellos con "lib2005".:)
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