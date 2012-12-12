rmq-node-report
===============
A small set of scripts to gather information from the local node about the running process state of a RabbitMQ server and display the connected consumers to the box.

I found it useful for troubleshooting when a box is unresponsive to the management_agent plugin.

If anything else, it demonstrates how you can use escipt (erlang as a script) to connect in and gather information or interact with the running RabbitMQ process.

Warning
-------
You're connecting into your local RabbitMQ node as if you were meant to be there. If you don't know what you're doing, you're probably not. Use at your own risk, etc.

Usage
-----
Put node_report.sh and node_report.erl in a directory on your local RabbitMQ node. Run the node_report.sh script as a user who has access to or the same .erlang.cookie as RabbitMQ:

    ./node_report.sh

The connections section of the report includes the number of open connections by ip address, user and vhost.

Example output
--------------

    gmr@rabbitXX:~$ sudo ./node_report.sh 
    status report rabbit@rabbitXX
    mem_ets: 19687744952
    mem_binary: 9470936
    mem_proc: 1291058528
    mem_proc_used: 1290852880
    mem_atom: 1682841
    mem_atom_used: 1665410
    mem_code: 16484993
    mem_used: 21343453976
    mem_limit: 20262037094
    proc_used: 188771
    proc_limit: 1048576
    bytes_in: 390606716185
    bytes_out: 1000853597433
    run_queue: 0
    context_switches: 39552728218

    Connections 
    
      Count IP Addr     User  Virtual Host
    
          5 10.0.0.16   foo   bar
         40 10.0.0.16   bar   qux
       2439 10.0.0.81   www   /
       2458 10.0.0.82   www   /
       2480 10.0.0.83   www   /
       2440 10.0.0.84   www   /
       2441 10.0.0.85   www   /
       2403 10.0.0.86   www   /
       2372 10.0.0.87   www   /
       2495 10.0.0.88   www   /
       2486 10.0.0.89   www   /
        202 10.0.0.242   rejected   corgi