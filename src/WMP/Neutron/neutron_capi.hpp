#ifdef __cplusplus
extern "C" { 
#endif

Neutron *neutron;  
//looking at other examples, they don't have some global scope instance of the class:


Neutron *CNeutron__ctor(int a)
{
	if (neutron != 0){delete neutron;} 
	neutron = new Neutron(a); 
	return neutron; 
}

void CNeutron__delete(Neutron* This) 
{
	delete This;
}

int CNeutron__grab_a(Neutron* ntrn_ptr)
{
	return ntrn_ptr->grab_a();
}


#ifdef __cplusplus
}
#endif
