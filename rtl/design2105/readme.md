Design name: design2105
Author: Jeb

Trojan design base on: Trojan 5
Origin RTL hierarchy: single module
Insert module: syncfifo.v

trojan block:

   Trojan trojan_inst (
        .rst         (reset),
        .arr1       (data_in),
        .arr2       (count),
        .out        (out[3:0])
    );


