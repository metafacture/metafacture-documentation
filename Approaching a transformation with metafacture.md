Every approach transform metadata with metafacture is quite similiar:

- You need to know what you want:
	e.g. Transform data from Marc21 from a certain folder to some kind of JSON Data.
- You have to identify the commands that you need.
- Combine the commands without the transformation module and test if the workflow goes trough.
- Adjust the workflow until it works.
- If the general workflow is working, move on to prepare the transformation.
- Get familar with the incoming data:
	- e.g. use `| list-fix-paths| print` to checkout the metadata-element paths that are provided.
	- use `| list-fix-values ("specifiedElementPath")| print` to get all element values of a certain element
- Start to write your transformation successivly and `write` to a specific or `print` the result.
 - Start with one element that you want to transform an retain it.
 - If you are happy with the result continue.
- If you have finalized your transformation include it in your application or transform the data you want.