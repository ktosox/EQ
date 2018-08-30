#include <iostream>
#include <cstdlib>
#include <SFML/System.hpp>
#include <SFML/Graphics.hpp>



//------------------simple equipment managment game

//common objects as classes

class Game;//predefinition so Game pointers can exist
class ItemGrid;//predefinition so ItemGrid pointers can exist
class Item //basic item class
{

private:
Game* ParentGame;
ItemGrid* ParentGrid; //Pointer to the item grid which will handle this item
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
Item(ItemGrid*);
};


class ItemGrid //this will hold info regarding items
{
private:
Game* ParentGame;

unsigned int IDTracker;//keeps track of latest Item ID
unsigned int SelectedItem; // keeps track of what item is selected
public:
std::vector<Item*> AllItems;
Game* ReturnParentGame(); //returns pointer to the main Game object
unsigned int GetNewItemID(); //returns IDTracker++
ItemGrid(Game*);
};

class Button //generic button base
{
private:
Game* ParentGame;
public:
sf::RectangleShape ButtonBody; //body of ze button
sf::Text ButtonText; //text on ze button
std::string TextString; //string for ButtonText
sf::Color ColorText; // color of text
sf::Color ColorFill1; //button color in state1
sf::Color ColorFill2; // button color in state2
sf::Color ColorOutline; // button outline

Button(Game*);
};


class Timed //everything that requires time upadate
{
private:

public:	
	void UpdateTime(sf::Time);
};

class Game //base game class
{
private:

public:
	sf::Font TextFontDefault; // default font of used by all text
	sf::RenderWindow MainGameWindow;//stuff gets drawn here
	std::vector<sf::Drawable*> AllDrawables;//list of all drawable objects
	//note - above should be replaced with an unorderreed map in future
	std::vector<Timed*> AllTimebles;//list off all things that require time updates
	sf::Event event;//mother of all events
	void LoopDraw(); //keep drawing to the screen
	void LoopEvent();//keep reacting to events
	void LoopTime(); //keep the time passing
	sf::Clock GameClock;//a clock that keeps time
	sf::Time DeltaTime;//keeps time since last update
	ItemGrid* DefaultItemGrid;
	Game();	
};





//main - game loop
int main()
{
	Game OknoGry;
	sf::RectangleShape test; //debugstuff
	test.setPosition(200.0,250.0);
	test.setFillColor(sf::Color::Green);
	test.setSize(sf::Vector2f(350.0,240.0));
	OknoGry.AllDrawables.push_back(&test);

	
	while(OknoGry.MainGameWindow.isOpen())//game loop
	{
		OknoGry.LoopDraw();
		OknoGry.LoopEvent();
		OknoGry.LoopTime();		
	}
	std::cout<<"Program ended"<<'\n';
	return 0;
	
}


//ItemGrid - method definitions

unsigned int ItemGrid::GetNewItemID()
{
	return IDTracker++;
}

Game* ItemGrid::ReturnParentGame()
{
	return ParentGame;
}

ItemGrid::ItemGrid(Game* TheGame)
{
	ParentGame=TheGame;
	IDTracker=1000;
}


//Button - method definitions

Button::Button(Game* TheGame)
{
	ParentGame=TheGame;
	ButtonBody.setPosition(0.0,0.0);
	//ButtonBody.
}

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

Item::Item(ItemGrid* CreatorPointer)
{
	ParentGrid=CreatorPointer;
	ParentGrid->AllItems.push_back(this);
	ParentGame=ParentGrid->ReturnParentGame();
	SetID(ParentGrid->GetNewItemID());
	std::cout<<ID;//debug line to confirm what ID was set
}
 
 
 
//Timed - method definitions

void Timed::UpdateTime(sf::Time Tick)
{
	//std::cout<<"TimeUpdate";//debug function
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
			case sf::Event::LostFocus :
			std::cout<<"Lost screen Focus"<<'\n';
			break;
			case sf::Event::GainedFocus :
			std::cout<<"Regained screen Focus"<<'\n';
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
	
	ItemGrid testGrid(this);
	
}
