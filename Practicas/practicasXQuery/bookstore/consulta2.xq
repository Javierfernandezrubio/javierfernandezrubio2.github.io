(:Conculta con FLWOR:)
<ul>
{
for $x in doc("bookstore.xml")/bookstore/book/title
where $x
order by $x
return <li>{data($x)}</li>
}
</ul>