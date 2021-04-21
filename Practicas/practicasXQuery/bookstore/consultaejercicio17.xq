(:Mostrar los títulos en una tabla de HTML:)
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