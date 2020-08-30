import 'package:flutter/material.dart';
import 'package:section7_final/widgets/main_drawer.dart';

class FliterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String , bool> currentFilter;

  FliterScreen(this.currentFilter , this.saveFilters);
  @override
  _FliterScreenState createState() => _FliterScreenState();
}

class _FliterScreenState extends State<FliterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _locatoseFree = false;

  @override
  initState(){
  _glutenFree = widget.currentFilter['gluten'];
  _glutenFree = widget.currentFilter['lactose'];
  _glutenFree = widget.currentFilter['vegetarian'];
  _glutenFree = widget.currentFilter['vegen'];
  super.initState();
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(icon: Icon(Icons.save), onPressed: (){
            final selectedFilters = {
              'gluten': _glutenFree,
              'lactose': _locatoseFree,
              'vegan': _vegan,
              'vegetarian': _vegetarian,
            };
            widget.saveFilters(selectedFilters);
          })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile('GLuten-free',
                    'only include gluten-free meals', _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Lactose-free',
                    'only include lactose-free meals',
                    _locatoseFree, (newValue) {
                  setState(() {
                    _locatoseFree = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Vegetarian', 'only include Vegetarian meals', _vegetarian,
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Vegan', 'only include Vegan meals', _vegan, (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
