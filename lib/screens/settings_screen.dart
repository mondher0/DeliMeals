import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  // final Function saveFilter;
  // SettingsScreen(this.saveFilter);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Widget _bulidListView(
      String title, String description, bool currentValue, updateValue) {
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(description),
        onChanged: updateValue);
  }

  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        actions: [
          IconButton(
              onPressed: () {
                // Map<String,bool> SelectedFilters = {
                //   'gluten':_glutenFree ,
                //   'lactose': _vegetarian,
                //   'vegan': _vegan,
                //   'vegetarian': _vegetarian
                // };

                // widget.saveFilter(SelectedFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(50),
            child: Text(
              'Adjust your meal selection',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _bulidListView('Glutten-free', 'Only include gluten-free meals',
                    _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _bulidListView(
                    'vegetarian', 'Only include vegetarian meals', _vegetarian,
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                _bulidListView('vegan', 'Only include vegan meals', _vegan,
                    (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
                _bulidListView('lactoseFree', 'Only include lactoseFree meals',
                    _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                })

                // SwitchListTile(
                //   title: Text('Glutten-free'),
                //   value: _glutenFree,
                //   subtitle: Text('Only include gluten-free meals'),
                //   onChanged: (newValue) {
                //     setState(() {
                //       _glutenFree = newValue;
                //     });
                //   },
                // )
              ],
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
