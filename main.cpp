#include <iostream>
#include <cstdlib>
#include <SFML/System.hpp>
#include <SFML/Graphics.hpp>

//------------------simple equipment managment game

//common objects as classes

class ItemGrid//this will hold the position of items in equpiment
{
private:
unsigned int IDTracker;//keeps track of latest Item ID
public:
unsigned int GetNewItemID();
ItemGrid();//creates a defualt value for IDTracker
};

class Button
{
private:

public:
sf::RectangleShape ButtonBody; //body of ze button
sf::Text ButtonText; //text on ze button
std::string TextString; //string for ButtonText
sf::Font TextFont; // font of ButtonText
sf::Color ColorText; // color of text
sf::Color ColorFill1; //button color in state1
sf::Color ColorFill2; // button color in state2
sf::Color ColorOutline; // button outline
//Button();
};

class Item
{
private:
sf::Vector2i Position;// x/y of the item in grid space
unsigned int ID;//uniq item ID
bool IsUp; 
bool IsSelected;
sf::Sprite Body;//item body on which texture will be placed
//short[2][2] Shape;
public:
void PickUp();
void PickDown();
void SetID(unsigned int); //manual override for ID
void UpdatePosition(sf::Vector2i); // update the value of Position

//void DefineShape(); //might be used later
Item();
};


class Timed
{
private:

public:	
	void UpdateTime(sf::Time);
};

class Game
{
private:

public:

	sf::RenderWindow MainGameWindow;//stuff gets drawn here
	std::vector<sf::Drawable*> AllDrawables;//list of all drawable objects
	//note - above should be replaced with an unorderreed map in future
	std::vector<Timed*> AllTimebles;//list off all things that require time updates
	sf::Event event;//mother of all events
	void LoopDraw(); //keep drawing to the screen
	void LoopEvent();//keep reacting to events
	void LoopTime(); //keep the time passing
	Game();
	sf::Clock GameClock;//a clock that keeps time
	sf::Time DeltaTime;//keeps time since last update
};





//main game loop
int main()
{

	Game OknoGry;
	

	sf::RectangleShape test;
	test.setPosition(200.0,250.0);
	test.setFillColor(sf::Color::Green);
	test.setSize(sf::Vector2f(350.0,240.0));
	OknoGry.AllDrawables.push_back(&test);
	Timed TimeTest;
	OknoGry.AllTimebles.push_back(&TimeTest);
	//a way of keeping track of existing items and their data (np. placement)
	
	while(OknoGry.MainGameWindow.isOpen())//game loop
	{
		OknoGry.LoopDraw();
		OknoGry.LoopEvent();
		OknoGry.LoopTime();		
	}
	// welcome screen
	// -welcome backgorund 
	// - welcome screen buttons
	
	// game screen
	// -equipment background
	std::cout<<"Program ended"<<'\n';
	return 0;
	
}


//ItemGrid - method definitions

//Button - method definitions

//Item - method definitions
 
void Item::PickUp()
{
	
	//if alredy up - do stuff
	//if not up - pick up
}
void Item::PickDown()
{
	//if up - put down
	//if not up - do stuff
}
void Item::SetID(unsigned int newID)
{
	ID=newID;
}

void Item::UpdatePosition(sf::Vector2i NewPosition)
{
	Position=NewPosition;//updates postion of item
}

Item::Item()
{
	ID=
}
 
 
 
//Timed - method definitions

void Timed::UpdateTime(sf::Time Tick)
{
	std::cout<<"TimeUpdate";
} 
 
//Game - method definitions

void Game::LoopDraw()
{
	MainGameWindow.clear(sf::Color::Blue);


	for(int i=AllDrawables.size()-1;i>=0;i--)
	{
		
		//draw all the things
		MainGameWindow.draw(*AllDrawables[i]);
	}
	MainGameWindow.display();	
	return;
}

void Game::LoopEvent()
{
	while(MainGameWindow.pollEvent(event))//do until your out of events
	{
		switch(event.type)
		{
			case sf::Event::Closed :
			MainGameWindow.close();
			break;
			case sf::Event::MouseButtonPressed :
			std::cout<<"Mouse button pressed"<<'\n';
			//mouse button press stuff here
			break;
			default : //ignore all other events
			break;
		}
	}
	//go throug all the events
	return;
}

void Game::LoopTime()
{
	DeltaTime=GameClock.restart();
	for(int j=AllTimebles.size()-1;j>=0;j--)
	{
		AllTimebles[j]->UpdateTime(DeltaTime);
	}
	//pass delta T to evenrything that needs time
	//reset time
	return;
}

Game::Game()
{
	MainGameWindow.create(sf::VideoMode(1024,768),"Equipment Manager",sf::Style::Close);
}
