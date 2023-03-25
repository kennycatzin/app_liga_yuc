part of 'widgets.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(
    BuildContext context,
  ) {
    // : implement build
    return buildSearchBar(context);

    //BlocBuilder<BusquedaBloc, BusquedaState>(
    //   builder: (context, state) {
    //     if (state.seleccionManual) {
    //       return Container();
    //     } else {
    //       return FadeInDownBig(child: buildSearchBar(context));
    //     }
    //   },
    // );
  }

  Widget buildSearchBar(BuildContext context) {
    final wifht = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.symmetric(horizontal: 30),
        width: wifht * .99,
        child: GestureDetector(
          onTap: () async {},
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            width: wifht * .1,
            height: 40,
            child: Row(children: [
              Icon(Icons.search),
              SizedBox(
                width: 18,
              ),
              AutocompleteBasicExample(),
            ]),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  100,
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black38,
                      blurRadius: 5,
                      offset: Offset(0, 5))
                ]),
          ),
        ),
      ),
    );
  }
}

class AutocompleteBasicExample extends StatelessWidget {
  const AutocompleteBasicExample();

  static const List<String> _kOptions = <String>[
    'aardvark',
    'bobcat',
    'chameleon',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      child: Autocomplete<String>(
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text == '') {
            return const Iterable<String>.empty();
          }
          return _kOptions.where((String option) {
            return option.contains(textEditingValue.text.toLowerCase());
          });
        },
        onSelected: (String selection) {
          debugPrint('You just selected $selection');
        },
      ),
    );
  }
}
