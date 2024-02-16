import json
import os

# Define the suit colors for each range
suit_colors = [
    ("black", range(1, 31)),
    ("blue", range(31, 41)),
    ("yellow", range(41, 53)),
    ("pink", range(53, 64)),
    ("white", range(64, 75)),
    ("purple", range(75, 86)),
    ("red", range(86, 96)),
    ("clear", [96]),
    ("silver", [97]),
    ("techie", [98]),
    ("hotwhitesummer", [99]),
    ("iridescent", [100])
]

# Create the directory if it doesn't exist
if not os.path.exists('metadata'):
    os.makedirs('metadata')

for color, numbers in suit_colors:
    for number in numbers:
        data = {
            "name": f"Blast Babe #{number}",
            "description": "ur Blast companion <3",
            "image": f"ipfs://QmYzJNMsPebbimAWMxRgGnYmCVZx9ScYgABw9BCFC5DA9U/{number}.jpg",  # Corrected this line
            "attributes": {
                "suit_color": color,
            }
        }

        # Write the data to a JSON file in the 'metadata' directory
        with open(f'metadata/{number}.json', 'w') as f:
            json.dump(data, f, indent=4)
