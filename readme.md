# local-proxy

The goal of this project is simple:

if you want to copy some piece of data from a remote console and read it from another console,
you can use your own localhost and ngrok as a clipboard.

1. Make sure you have ngrok installed
2. ruby `./start.sh`
3. take note of the host
4. execute client.rb code in a remote console
5. call `save_data(string_data, host)` in console A 
6. call `string_data = read_data(host)` in console B
 
