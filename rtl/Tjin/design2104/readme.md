Design name: design2104
Author: Jeb

Trojan design base on: Trojan 5
Origin RTL hierarchy: single module
Insert module: singleport_ram.v

trojan block:

   Trojan trojan_inst (
        .rst         (wr_en),
        .arr1       (data_in[7:0]),
        .arr2       (addr),
        .out        (read_addr)
    );


