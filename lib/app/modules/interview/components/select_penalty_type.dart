import 'package:azulejo/app/modules/interview/model/type_penalty_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef OnSelectPenalty = void Function(TypePenalty value);

class Modal {
  mainBottomSheet(
    BuildContext context, {
    required OnSelectPenalty onSelectPenalty,
  }) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Penalidades',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF4F4F4F),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ...TypePenalty.values
                  .map(
                    (e) => ListTile(
                      leading: Icon(
                        Icons.circle,
                        color: typePenaltyColor[e],
                      ),
                      title: Text(typePenaltyDescription[e]!),
                      onTap: () {
                        onSelectPenalty(e);
                        Navigator.pop(context);
                      },
                    ),
                  )
                  .toList()
            ],
          );
        });
  }
}
