import 'package:admin_dashboard/datatables/categories_datatable.dart';
import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<CategoriesProvider>(context, listen: false).getCategories();
    super.initState();
  }

  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  @override
  Widget build(BuildContext context) {
    List<Categoria> categorias =
        Provider.of<CategoriesProvider>(context).categories;

    return ListView(
      physics: ClampingScrollPhysics(),
      children: [
        Center(
            child: Text(
          'Propiedades',
          style: CustomLabels.h1,
        )),
        SizedBox(
          height: 14,
        ),
        PaginatedDataTable(
          columns: const [
            DataColumn(label: Text('column1')),
            DataColumn(label: Text('column2')),
            DataColumn(label: Text('column3')),
            DataColumn(label: Text('column4'))
          ],
          source: CategoriesDTS(categorias),
          rowsPerPage: _rowsPerPage,
          onRowsPerPageChanged: (value) {
            setState(() {
              _rowsPerPage = value ?? 10;
            });
          },
        )
      ],
    );
  }
}
