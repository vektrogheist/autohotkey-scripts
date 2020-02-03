## Virtural Desktop Manager:

**Prerequisite**
Install PowerShell Module
https://www.powershellgallery.com/packages/VirtualDesktop/1.1.0

Package can be installed using powershell using:
`Install-Module -Name VirtualDesktop`


primary goals:
    ```
    - open 10 desktops on start (easy)
  x - Switch between desktops with Super+Desktop Number (easy)
    - Add some sort of bar showing open desktops [1][2][3][4][5][6][7][8][9][0] at top of screen (medium)
  x - "send" an open window to a desired desktop (easy?)
    ```

secondary goals:
    ```
    - Associate groups of programs with desktop numbers (ie, intellij always open on desktop 3)
    - Have some groups of those programs run at startup and actually be positioned decently on the screen
                 - potentially would like to store an optimal layout of all applications which can be restored per desktop by hotkey.
    ```

*[ debating if i should disable creating and destroying desktops all together because it would throw off my numbering if u like destroyed desktop 2 and now 3 is technically 2 but you have setting specific to 3 ]*

**HotKeys with drop down menus / subsequent commands**:

Google Doc Creation:
       ```
       -Hotkey when pressed anywhere opens a drop down menu for subsequent inputs:
           
           #+G - Create New Google File
          __________________________
          |                        _|_______________________
          |  D   *create doc*     |                        |
          |_______________________| 1  *GDrive Primary*    |
          | \  \  \  \  \  \ \  \ |________________________|
          |  S   *create sheet*   |                        |
          |__\___\__\___\___\__\__| 2  *GDrive Secondary*  |
          |                       |________________________|
          |  P   *create slides*    |     
          |_________________________|          
          |                         |          
          |                         |          
          |_________________________|      
    
      to specify document type to generate and if necessary which drive location to put it in, then opens a new document in chrome

       ```



**Misc**:
```
  - Hotkey to open terminal in current folder in explorer
  - ctrl+alt (spin mouse wheel) controls volume
  - super+shift (spin mouse wheel) controls brightness
  - Hotkey to open highlighted text in a newly created sublime window
```