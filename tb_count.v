`timescale 1ns/1ns 

module coun4_tp; 
    reg clk, reset;
    wire[3:0] out;
    
    
    count4 mycount(out,reset,clk);   
    
    always #10 clk = ~clk;  
    
    initial begin  
        clk=0; 
        reset=0; 
        #10    reset=1; 
        #10    reset=0; 
        #1000 $stop; 
    end 
    

    initial $monitor($time,,"clk=%d reset=%d out=%d", clk, reset, out);     
    
    
    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0, coun4_tp); 
    end
endmodule
