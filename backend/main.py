import asyncio
import json
import websockets
import pyautogui

# Define mapping from Xbox controller buttons to keyboard keys
button_mapping = {
    'X': 'x',
    'Y': 'y',
    'A': 'a',
    'B': 'b',
    'Rb': 'w',
    'Lb': 's',
    'UP': 'up',
    'DOWN': 'down',
    'LEFT': 'left',
    'RIGHT': 'right'
}

async def handle_client(websocket, path):
    print("Client connected")

    try:
        async for message in websocket:
            print(f"Received: {message}")

            message = str(message)

            if is_json(message):
                try:
                    data = json.loads(message)

                    if isinstance(data, dict) and 'x' in data and 'y' in data and isinstance(data['x'], (int, float)) and isinstance(data['y'], (int, float)):
                        print(f"Joystick values: X={data['x']}, Y={data['y']}")
                        # Process the joystick values here

                except json.JSONDecodeError as e:
                    print(f"Error parsing JSON message: {e}")

            else:
                if message.startswith('LT:') or message.startswith('RT:'):
                    print(f"Slider data: {message}")
                    # Process the slider data here

                elif message in button_mapping:
                    button_key = button_mapping[message]
                    print(f"Button {message} pressed")
                    pyautogui.press(button_key)

                else:
                    print(f"Unknown message: {message}")

    except websockets.exceptions.ConnectionClosedOK:
        print("Client disconnected")

def is_json(string):
    try:
        json.loads(string)
        return True
    except ValueError:
        return False

start_server = websockets.serve(handle_client, '0.0.0.0', 8080)

asyncio.get_event_loop().run_until_complete(start_server)
asyncio.get_event_loop().run_forever()
