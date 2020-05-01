# Delannoy Number
In mathematics, a Delannoy number D describes the number of paths from the southwest corner (0, 0) of a rectangular grid to the northeast corner (m, n), using only single steps north, northeast, or east.
For Example, D(3, 3) equals 63.


Delannoy number can be used to find:

- Counts the number of global alignments of two sequences of lengths m and n.
- Number of points in an m-dimensional integer lattice that are at most n steps from the origin.
- In cellular automata, the number of cells in an m-dimensional von Neumann neighborhood of radius n.
- Number of cells on a surface of an m-dimensional von Neumann neighborhood of radius n.
Examples :



Input : n = 3, m = 3
Output : 63

Input : n = 4, m = 5
Output : 681

# FSMD
Basic Finite State Machine with Datapath (FSMD) example to find the number of paths from the southwest corner (0, 0) of a rectangular grid to the northeast corner (m, n) (m, n are up to 14), using only single steps north, northeast, or east.
## Install

These examples use [ModelSim&reg; and Quartus&reg; Prime from Intel FPGA](http://fpgasoftware.intel.com/?edition=lite), [GIT](https://git-scm.com/download/win), [Visual Studio Code](https://code.visualstudio.com/download), make sure they are installed locally on your computer before proceeding.

## Usage

1. Grab a copy of this repository to your computer's local folder (i.e. C:\projects):

    ```sh
    $ cd projects
    $ git clone https://github.com/Salem22/DelannoyNumber.git
    ```
2. Use Visual Studio Code (VSC) to edit and view the design files:

    ```sh
    $ cd DelannoyNumber
    $ code .
    ```
    Click on the toplevel.vhd file in the left pane to view its contents.
    
3. From the VSC View menu, choose Terminal, in the VCS Terminal, create a "work" library:

    ```sh
    $ vlib work
    ```
    
4. Compile all the design units:

    ```sh
    $ vcom *.vhd
    ```
    
5. Simulate your design. For example, if m = 4, n = 3 then y = 129:

    ```sh
    $ vsim work.tb
    ```
