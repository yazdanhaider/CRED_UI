import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class ApiResponse {
  List<Item>? items;

  ApiResponse({this.items});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      items: json['items'] != null
          ? List<Item>.from(json['items'].map((item) => Item.fromJson(item)))
          : null,
    );
  }
}

class Item {
  OpenState? openState;
  ClosedState? closedState;
  String? ctaText;

  Item({this.openState, this.closedState, this.ctaText});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      openState: json['open_state'] != null
          ? OpenState.fromJson(json['open_state'])
          : null,
      closedState: json['closed_state'] != null
          ? ClosedState.fromJson(json['closed_state'])
          : null,
      ctaText: json['cta_text'],
    );
  }
}

class OpenState {
  Body? body;

  OpenState({this.body});

  factory OpenState.fromJson(Map<String, dynamic> json) {
    return OpenState(
      body: json['body'] != null ? Body.fromJson(json['body']) : null,
    );
  }
}

class ClosedState {
  ClosedBody? body;

  ClosedState({this.body});

  factory ClosedState.fromJson(Map<String, dynamic> json) {
    return ClosedState(
      body: json['body'] != null ? ClosedBody.fromJson(json['body']) : null,
    );
  }
}

class Body {
  String? title;
  String? subtitle;
  CardData? card;
  List<ItemData>? items;
  String? footer;

  Body({this.title, this.subtitle, this.card, this.items, this.footer});

  factory Body.fromJson(Map<String, dynamic> json) {
    return Body(
      title: json['title'],
      subtitle: json['subtitle'],
      card: json['card'] != null ? CardData.fromJson(json['card']) : null,
      items: json['items'] != null
          ? List<ItemData>.from(
          json['items'].map((item) => ItemData.fromJson(item)))
          : null,
      footer: json['footer'],
    );
  }
}

class CardData {
  String? header;
  String? description;
  int? maxRange;
  int? minRange;

  CardData({this.header, this.description, this.maxRange, this.minRange});

  factory CardData.fromJson(Map<String, dynamic> json) {
    return CardData(
      header: json['header'],
      description: json['description'],
      maxRange: json['max_range'],
      minRange: json['min_range'],
    );
  }
}

class ItemData {
  String? emi;
  String? duration;
  String? title;
  dynamic subtitle;
  String? tag;
  final Color color; // Add this field

  ItemData(
      {this.emi,
        this.duration,
        this.title,
        this.subtitle,
        this.tag,
        required this.color});

  factory ItemData.fromJson(Map<String, dynamic> json) {
    return ItemData(
      emi: json['emi'],
      duration: json['duration'],
      title: json['title'],
      subtitle: json['subtitle'],
      tag: json['tag'],
      color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
    );
  }
}

class ClosedBody {
  String? key1;
  String? key2;

  ClosedBody({this.key1, this.key2});

  factory ClosedBody.fromJson(Map<String, dynamic> json) {
    return ClosedBody(
      key1: json['key1'],
      key2: json['key2'],
    );
  }
}
