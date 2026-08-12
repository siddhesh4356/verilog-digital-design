module n_mod_alu #(parameter N = 4)(

    input  [N-1:0] A,
    input  [N-1:0] B,

    //Does the main Operation Select among Arithmetic,Logical ,Shift or compare 
   
    input [1:0] op_main,

  
    input [1:0] op_ar,      //Selects the 2 arithmetic operations 0->ADD 1->SUB
    input [1:0] op_log,      // Selects the logical operations like AND,OR,XOR etc
    input [1:0] op_shift,    // Selects the shifting operations Left,Right,Arithmetic

    output reg [N-1:0] Result, //Since index starts from 0 we go upto n-1 bits only

    // Flags
    output reg C,Z,S,V,   //C-Carry ,S-Sign ,Z-Zero,V-Overflow

    // Separate flags for Comparator outputs:-Lesser(L),Greater(G),Equal(E)
    output L,E,G

);

    // Sets temporary wires (Processing) to tackle Carry/Borrow 
    
    wire [N:0] add_temp;
    wire [N:0] sub_temp;
    
    //Sets output wires for arithmetic operations
    wire [N-1:0] add_out,sub_out,mult_out,div_out;
    
    //Sets output wires for Logical operations
    wire [N-1:0] and_out,or_out,xor_out;
    
   //Sets output wires for Shifting operations
    wire [N-1:0] left_shift_out,right_shift_out,arith_shift_out;


    // Arithmetic
    assign add_temp = A + B;
    assign sub_temp = A - B;
    
    assign add_out = add_temp[N-1:0];//Assigning the temp wire expression for full expression with carry
    assign sub_out = sub_temp[N-1:0];
    assign mult_out= A*B;
    assign div_out= (B!=0)?(A/B):0; //Prevents division by zero by returning 0 when B=0

    // Logical
    assign and_out = A & B;
    assign or_out  = A | B;
    assign xor_out = A ^ B;

    // Shift
    assign left_shift_out  = A << 1; //Shifts to the left by 1 bit by inserting 0 in LSB
    assign right_shift_out = A >> 1; //Shifts to the right by 1 bit by inseritng 0 in MSB

    // Arithmetic Right Shift
    assign arith_shift_out = $signed(A) >>> 1; //Shifts right and replicates the sign bit by preserving the sign bit 

    // Comparator

    comparator #(N) comp1(

        .A(A),
        .B(B),

        .L(L),
        .E(E),
        .G(G)

    );             //Uses the external N-bit comparator module saved in the same folder as this


    always @(*) begin

        // Default values
        Result = 0;

        C = 0;
        V = 0;

        // Main operations select

        case(op_main)

            // Arithmetic

            2'b00: begin

                case(op_ar)//Selects the sub ops ADD/SUB

                    // ADD
                    2'b00: begin
                        Result = add_out;
                        C = add_temp[N];

                        // Overflow Logic
                        V = (A[N-1] == B[N-1]) &&
                            (Result[N-1] != A[N-1]);
                    end

                    // SUBTRACT
                    2'b01: begin
                        Result = sub_out;
                        C = sub_temp[N];
                        // Overflow Logic
                        V = (A[N-1] != B[N-1]) &&
                            (Result[N-1] != A[N-1]);

                    end
                  2'b10:begin
                  Result=mult_out;
                  end
                  
                  2'b11:begin
                  Result=div_out;
                  end
                endcase

            end

            // Logical

            2'b01: begin

                case(op_log)//Selects AND,OR,XOR etc

                    2'b00: Result = and_out;
                    2'b01: Result = or_out;
                    2'b10: Result = xor_out;

                    default: Result = 0;

                endcase

            end

            // Shift ops
            
            2'b10: begin

                case(op_shift)//Selects the SUB SHIFT operations LS,RS,ARS

                    2'b00: Result = left_shift_out;
                    2'b01: Result = right_shift_out;
                    2'b10: Result = arith_shift_out;

                    default: Result = 0;

                endcase

            end

            // Compare

            2'b11: begin

                // Since omparator outputs handled separately
                Result = 0;

            end

            default: begin

                Result = 0;

            end

        endcase

    
        // COMMON FLAGS

        Z = (Result == 0);

        S = Result[N-1];

    end

endmodule
