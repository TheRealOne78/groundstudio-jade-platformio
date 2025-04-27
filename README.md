# PlatformIO profiles for GroundStudio's Jade development boards

> [!CAUTION]
> The GroundStudio Jade Pro Micro is still untested, and using it may cause unexpected issues.
> Proceed with caution!

## Description
This repository provides support for GroundStudio's Jade dev boards, enabling easy integration with PlatformIO for development. The repo includes the configuration files necessary for PlatformIO to recognize and work with GroundStudio's Jade boards, such as the Jade Nano, Jade Uno+, and Jade Pro Micro. 

## Setup Tutorial
### Unix-based systems (GNU/Linux | macOS | BSD | etc)

1. Ensure PlatformIO (Core) is installed
   If you don't have `platformio` installed, follow the instructions here: [https://platformio.org/install](https://platformio.org/install).
2. Clone the repo:
    ```sh
    git clone https://github.com/TheRealOne78/groundstudio-jade-platformio.git --recursive
    ```
3. Navigate to the cloned directory:
    ```sh
    cd groundstudio-jade-platformio
    ```
4. Run the setup script to configure everything:
    ```sh
    ./setup.sh
    ```

### Windows
> [!NOTE]
> For **Windows systems**, the setup is still a work-in-progress.  Please follow the Unix setup for now, but be aware that Windows support is being developed.

## References
- [GroundStudio Jade GitHub Repository](https://github.com/GroundStudio/Jade)
- [GroundStudio Official Shop](https://ardushop.ro/en/37-groundstudio)
- [PlatformIO Board Creation Docs](https://docs.platformio.org/en/latest/platforms/creating_board.html)

