
# Docker Image Transfer (DIT) Helper

## Description:

 A simple bash helper script to transfer docker images between container registries.

### NOTE:
	* Before using this script you should have logged in the container registries

## Usage

    dit.sh : Docker Images Transfer (DIT) aim to trasfer/copy docker images between registries."
    
    Usage: ./dit.sh --from [SOURCE REPO] --to [DEST_REPO] --image [IMAGE] --version [VERSION]
    
    options: 
     -f, --from      Source repository.
     -t, --to        Destination repository. 
     -i, --image     The image to transfer.
     -v, --version   The version of the image to transfer.
     -h, --help      Display this help message.

## License
 
  For more please refer to the [LICENCE](LICENCE) notice.