# Project Structure

## Program Flow

1. Greets User, asks for hemisphere (northern or southern)
2. User provides hemisphere
3. Responds with hemisphere and local time, asks user to pick a selection:
    1. View Available Bugs
    2. View Available Fish
    3. View Available Sea Creatures
    4. List Bugs by Month
    5. List Fish by Month
    6. List Sea Creatures by Month
    8. Exit

## Classes

- Critters
    - Bugs
    - Fish
    - Sea Creatures
- CLI
- API

### Notes

https://acnhapi.com/v1a/fish/
https://acnhapi.com/v1a/bugs/
https://acnhapi.com/v1a/sea/

Attributes for Critter class
name[name-USen]
availability[month-array-northern, month-array-southern, time-array, location]
catch-phrase