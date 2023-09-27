class Neutron 
{
	private: 
	
	int a; 

	public: 
	#include "ctor/ctor.hpp" 
	
	int grab_a(); 

};

int Neutron::grab_a()
{
	return this->a; 

}
