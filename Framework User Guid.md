This page explains how to create a Metafacture objects and how to assemble them to form a processing pipeline. We use as an example a simple pipeline containing a Metamorph instance.


# Building a Flow

A Flow consists of a data source, an arbitrary number of pipe elements and finally a data sink.
The individual elements are connected by calling the `setReceiver()` method. The following code snipped shows an example.

```java
// create necessary objects
final PicaReader reader = new PicaReader();
final Metafix metafix = new Metafix("defnition.fix");
final ListMapWriter writer = new ListMapWriter();

//connect them
reader.setReceiver(fix).setReceiver(writer);

//start processing
reader.read(input);
```

Note that the call `setReceiver()` returns
its argument, preserving the respective type. Thus the calls can be chained to
build up a pipeline as shown in the listing. Finally the processing is started
by calling the respective method on the data source/reader. The method name
depends on the reader. In the Metamorph project `read()` is used by
convention.

The following code snippet shows a few more sophisticated connection patterns, such
as adding an additional element, junctions or splitters.

```java
//adding logging
reader.setReceiver(new LogPipe()).setReceiver(metafix).setReceiver(writer);

//adding a tee junction
reader.setReceiver(new Tee()).setReceivers(writer1, writer2);

//splitting based on a metamorph description
final Splitter splitter = new Splitter("morph/typeSplitter.xml");
reader.setReceiver(splitter).setReceiver("Tn", writer1);
splitter.setReceiver("Tp", writer2);
```

# Piping different Objects



# Objects as Eventstream

```java
public interface StreamSender {
	<R extends StreamReceiver> R setReceiver(R streamReceiver);
}
```

```java
public interface StreamReceiver {
	void startRecord(String identifier);
	void endRecord();
	void startEntity(String name);
	void endEntity();
	void literal(String name, String value);
}
```

# Error Handling
If an exception occurs during the processing of a stream of records, it is back
propagated to the first element in the chain. This normally means that
processing is terminated which may not be the preferred action. Imagine
processing a million records. One normally prefers to log any error but continue
the processing.
For this reason an error handler may be registered with the Metamorph object. It
catches all exceptions occurring in the Metamorph object and below. 

```java
metamorph.setErrorHandler(new MetamorphErrorHandler() {
	@Override
	public void error(final Exception e) {
		// TODO fill in your error handling code
	}
});
```