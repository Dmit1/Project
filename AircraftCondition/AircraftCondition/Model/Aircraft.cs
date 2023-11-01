using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AircraftCondition.AircraftCondition.Model
{
    public class Aircraft
    {
        int AircraftID {  get; set; }  
        string Name { get; set; }
        string RegName { get; set; }
        string ManufactureDate { get; set; }
        List<Component> Components { get; set; }

        Aircraft(int aircraftID,string name, string regName, string manufactureDate)
        {
            AircraftID = aircraftID;
            Name = name;
            RegName = regName;
            ManufactureDate = manufactureDate;
            Components = new List<Component>();     
        }
    }
}
