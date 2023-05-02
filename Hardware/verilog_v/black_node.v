module BLACK_NODE (
    Gi, Gj, Pi, Pj,
    GiGj, PiPj
);
    input Gi, Gj, Pi, Pj;
    output GiGj, PiPj;
    
    assign GiGj = Gi | (Gj & Pi);
    assign PiPj = Pi & Pj;

endmodule