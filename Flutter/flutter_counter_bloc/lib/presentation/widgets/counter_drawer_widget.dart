import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_bloc/presentation/blocs/counter/counter_bloc.dart';
import 'package:flutter_counter_bloc/presentation/blocs/counter/counter_event.dart';
import 'package:flutter_counter_bloc/presentation/blocs/tema/theme_bloc.dart';
import 'package:flutter_counter_bloc/presentation/blocs/tema/theme_event.dart';
import 'package:flutter_counter_bloc/config/theme/app_theme.dart';

class CounterDrawerWidget extends StatelessWidget {
  const CounterDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<ThemeBloc>().state;
    Color drawerColor = themeState.appTheme.getDrawerColor();

    return Drawer(
      child: Container(
        color: drawerColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 159, 165, 169),
              ),
              child: Text('Opciones del contador'),
            ),
            ListTile(
              leading: const Icon(Icons.refresh),
              title: const Text('Reiniciar contador'),
              onTap: () {
                context.read<CounterBloc>().add(CounterReset());
              },
            ),
            ListTile(
              leading: const Icon(Icons.color_lens),
              title: const Text('Cambiar tema'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => const ThemeDialog(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ThemeDialog extends StatefulWidget {
  const ThemeDialog({super.key});

  @override
  ThemeDialogState createState() => ThemeDialogState();
}

class ThemeDialogState extends State<ThemeDialog> {
  bool isDarkMode = false;
  int selectedColor = 0;

  @override
  void initState() {
    super.initState();
    final themeState = context.read<ThemeBloc>().state;
    isDarkMode = themeState.appTheme.isDarkmode;
    selectedColor = themeState.appTheme.selectedColor;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Configurar tema'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SwitchListTile(
            title: const Text('Modo oscuro'),
            value: isDarkMode,
            onChanged: (bool value) {
              setState(() {
                isDarkMode = value;
              });
            },
          ),
          Row(
            children: [
              const Text('Color:'),
              const SizedBox(width: 10),
              DropdownButton<int>(
                value: selectedColor,
                onChanged: (int? newValue) {
                  if (newValue != null) {
                    setState(() {
                      selectedColor = newValue;
                    });
                  }
                },
                items: List.generate(colorList.length, (index) {
                  return DropdownMenuItem<int>(
                    value: index,
                    child: Container(
                      width: 24,
                      height: 24,
                      color: colorList[index],
                    ),
                  );
                }),
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.read<ThemeBloc>().add(
                  ThemeChanged(
                      isDarkMode: isDarkMode, selectedColor: selectedColor),
                );
            Navigator.of(context).pop();
          },
          child: const Text('Guardar'),
        ),
      ],
    );
  }
}
