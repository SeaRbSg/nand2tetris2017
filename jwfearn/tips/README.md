## HDL Tips

#### PROBLEM: *Can't connect gate's output pin to part*
You want to use the value of one of your outputs as input to other
chips to calculate another output. Below we define a chip with two outputs 
`o` and `no`. The output `o` is like a regular Mux; and `no` is not of `o`.

```
CHIP MyMux {
  IN
    a, b, sel;
  OUT
    o,   // a if sel == 0, b otherwise
    no;  // not(out)
  PARTS:
    Mux(a=a, b=a, sel=sel, out=o);
    Not(in=o, out=no);
//      ^^^^ ERROR: Can't connect gate's output pin to part
}
```
Since `o` is defined to be an output pin for `MyMux`, it can't be used as
input to our internal `Not` chip.

#### SOLUTION
Define an internal pin with the same value as the output pin.
```
    Mux(a=a, b=b, sel=sel, out=o, out=temp);
    Not(in=temp, out=no);
```

#### PROBLEM: *sub bus of an internal node may not be used*
You want to use one of the bits an internal multi-bit pin (aka bus). Below we 
define a chip that takes a 16-bit value as input and returns true if the input
is even.
```
CHIP Even16 {
  IN
    in[16];
  OUT
    out; // 1 if in is even, otherwise 0
  PARTS:
    Not16(in=in, out=temp);
    And(a=temp[0], b=true, out=out);
//      ^^^^^^^^^ ERROR: sub bus of an internal node may not be used
}
```
We are not allowed to access individual bits of our internal `temp` bus.

#### SOLUTION 1
We *are* allowed to access individual bits of the outputs of other chips. So
we can define a single-bit internal pin.
```
    Not16(in=in, out[0]=temp);
    And(a=temp, b=true, out=out);
```

#### SOLUTION 2
We can also redirect a single bit of an internal chip's output bus to our 
output pin directly.
```
    Not16(in=in, out[0]=out);
```

#### SOLUTION 3
We can even just use a single bit of our input bus.
```
    Not(in=in[0], out=out);
```
