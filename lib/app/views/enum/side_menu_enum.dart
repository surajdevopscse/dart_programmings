import 'package:dart_programing/app/routes/path.dart';

import '../../../utils/constants/images.dart';
import '../../../utils/constants/strings/string_keys.dart';

enum SideNavBarParentEnum {
  //Home
  home(
    children: [],
    parentPath: AppPath.HOME,
  ),
  //Introduction
  introductionAndSyntax(
    children: [
      SideNavBarChildEnum.introductionToDart,
      SideNavBarChildEnum.installDart,
      SideNavBarChildEnum.dartBasic,
      SideNavBarChildEnum.variables,
      SideNavBarChildEnum.dataTypes,
      SideNavBarChildEnum.comments,
      SideNavBarChildEnum.oprators,
      SideNavBarChildEnum.userInput,
      SideNavBarChildEnum.string,
      SideNavBarChildEnum.keywords,
      SideNavBarChildEnum.finalVSConst,
      SideNavBarChildEnum.dateTimeInDart,
    ],
    parentPath: AppPath.INTRODUCION,
  ),

  //Control Flow and Loops
  controlFlowAndLoop(
    children: [
      SideNavBarChildEnum.conditions,
      SideNavBarChildEnum.assertInDart,
      SideNavBarChildEnum.switchCase,
      SideNavBarChildEnum.ternery,
      SideNavBarChildEnum.loops,
      SideNavBarChildEnum.forLoop,
      SideNavBarChildEnum.forEachLoop,
      SideNavBarChildEnum.whileLoop,
      SideNavBarChildEnum.doWhileLoop,
      SideNavBarChildEnum.breakContinue,
      SideNavBarChildEnum.exception,
    ],
    parentPath: AppPath.CONDITIONS,
  ),

//Funtions In Dart
  functions(
    children: [
      SideNavBarChildEnum.functions,
      SideNavBarChildEnum.typesOfFunctions,
      SideNavBarChildEnum.functionParameter,
      SideNavBarChildEnum.anonymousFunctions,
      SideNavBarChildEnum.arrowFunctions,
      SideNavBarChildEnum.scope,
      SideNavBarChildEnum.mathInDart,
    ],
    parentPath: AppPath.FUNCTIONS,
  ),

//Colletions in Dart
  collections(
    children: [
      SideNavBarChildEnum.listInDart,
      SideNavBarChildEnum.setInDart,
      SideNavBarChildEnum.mapInDart,
      SideNavBarChildEnum.whereInDart,
    ],
    parentPath: AppPath.LISTINDART,
  ),

//FileHanding In Dart
  fileHandling(
    children: [
      SideNavBarChildEnum.readFile,
      SideNavBarChildEnum.writeFile,
      SideNavBarChildEnum.deleteFile,
    ],
    parentPath: AppPath.READFILE,
  ),

  //OOPS in Dart
  oppsInDart(
    children: [
      SideNavBarChildEnum.oopsInDart,
      SideNavBarChildEnum.classInDart,
      SideNavBarChildEnum.objectInDart,
      SideNavBarChildEnum.classAndObject,
      SideNavBarChildEnum.constructor,
      SideNavBarChildEnum.defaultConstructor,
      SideNavBarChildEnum.paramterizedConstructor,
      SideNavBarChildEnum.namedConstructor,
      SideNavBarChildEnum.constantContructor,
      SideNavBarChildEnum.encapsulation,
      SideNavBarChildEnum.getter,
      SideNavBarChildEnum.setter,
      SideNavBarChildEnum.inheritence,
      SideNavBarChildEnum.polymorphism,
      SideNavBarChildEnum.static,
      SideNavBarChildEnum.superInDart,
      SideNavBarChildEnum.enumInDart,
      SideNavBarChildEnum.abstarctClassInDart,
      SideNavBarChildEnum.interface,
      SideNavBarChildEnum.mixinInDart,
      SideNavBarChildEnum.generic,
      SideNavBarChildEnum.extension,
      SideNavBarChildEnum.callableObject,
      SideNavBarChildEnum.factoryConstructor,
    ],
    parentPath: AppPath.OOPSINDART,
  ),

  //Null Safety
  nullSafety(
    children: [
      SideNavBarChildEnum.nullSafety,
      SideNavBarChildEnum.typePromotions,
      SideNavBarChildEnum.lateKeywords,
    ],
    parentPath: AppPath.NullSAFETY,
  ),

//Async Programming
  asyncProgram(
    children: [
      SideNavBarChildEnum.asyncProgramming,
      SideNavBarChildEnum.futureInDart,
      SideNavBarChildEnum.asyncAndAwait,
      SideNavBarChildEnum.streamInDart,
      SideNavBarChildEnum.isolate,
    ],
    parentPath: AppPath.ASYNCPROGRAMMING,
  ),
  ;

  final List<SideNavBarChildEnum> children;
  final String parentPath;

  const SideNavBarParentEnum(
      {required this.children, required this.parentPath});

  String get title {
    switch (this) {
      case SideNavBarParentEnum.home:
        return SK.home;
      case SideNavBarParentEnum.introductionAndSyntax:
        return SK.introductionAndSyntax;
      case SideNavBarParentEnum.controlFlowAndLoop:
        return SK.controlFlow;
      case SideNavBarParentEnum.functions:
        return SK.functions;
      case SideNavBarParentEnum.collections:
        return SK.collection;
      case SideNavBarParentEnum.fileHandling:
        return SK.fileHandling;
      case SideNavBarParentEnum.oppsInDart:
        return SK.oopsInDart;
      case SideNavBarParentEnum.nullSafety:
        return SK.nullSafety;
      case SideNavBarParentEnum.asyncProgram:
        return SK.asyncProgramming;
    }
  }

  (String selectedImage, String unSelectedImage) get image {
    switch (this) {
      case SideNavBarParentEnum.home:
        return (I.codeActive, I.codeInactive);
      case SideNavBarParentEnum.introductionAndSyntax:
        return (I.codeActive, I.codeInactive);
      case SideNavBarParentEnum.controlFlowAndLoop:
        return (I.codeActive, I.codeInactive);
      case SideNavBarParentEnum.functions:
        return (I.codeActive, I.codeInactive);
      case SideNavBarParentEnum.collections:
        return (I.codeActive, I.codeInactive);
      case SideNavBarParentEnum.fileHandling:
        return (I.codeActive, I.codeInactive);
      case SideNavBarParentEnum.oppsInDart:
        return (I.codeActive, I.codeInactive);
      case SideNavBarParentEnum.nullSafety:
        return (I.codeActive, I.codeInactive);
      case SideNavBarParentEnum.asyncProgram:
        return (I.codeActive, I.codeInactive);
    }
  }
}

enum SideNavBarChildEnum {
  //HOME
  home(childPath: AppPath.HOME),
  //Introduction to Dart
  introductionToDart(
    childPath: AppPath.INTRODUCION,
  ),
  installDart(
    childPath: AppPath.INSTALL_DART,
  ),
  dartBasic(
    childPath: AppPath.DART_BASIC,
  ),
  variables(
    childPath: AppPath.VARIABLE_IN_DART,
  ),
  dataTypes(
    childPath: AppPath.DATA_TYPES_IN_DART,
  ),
  comments(
    childPath: AppPath.COMMENTS_IN_DART,
  ),
  oprators(
    childPath: AppPath.OPRATOR_IN_DART,
  ),
  userInput(
    childPath: AppPath.USER_INPUT_IN_DART,
  ),
  metaData(
    childPath: AppPath.METADATA_IN_DART,
  ),
  libraries(
    childPath: AppPath.LIBRARIES_AND_IMPORTS_IN_DART,
  ),
  string(
    childPath: AppPath.STRING_IN_DART,
  ),
  keywords(
    childPath: AppPath.KEYWORDS_IN_DART,
  ),
  finalVSConst(
    childPath: AppPath.FINAL_VS_CONST,
  ),
  dateTimeInDart(
    childPath: AppPath.DATETIME,
  ),

  //Control Flow
  controllFLow(
    childPath: AppPath.CONDITIONS,
  ),
  assertInDart(
    childPath: AppPath.ASSERT,
  ),
  switchCase(
    childPath: AppPath.SWITCH,
  ),
  ternery(
    childPath: AppPath.TERNERY,
  ),
  loops(
    childPath: AppPath.LOOPS,
  ),
  forLoop(
    childPath: AppPath.FORLOOP,
  ),
  forEachLoop(
    childPath: AppPath.FOREACHLOOP,
  ),
  whileLoop(
    childPath: AppPath.WHILE,
  ),
  doWhileLoop(
    childPath: AppPath.DOWHILE,
  ),
  breakContinue(
    childPath: AppPath.BREAK,
  ),
  conditions(
    childPath: AppPath.CONDITIONS,
  ),
  exception(
    childPath: AppPath.EXCEPTION,
  ),
  //Funtions
  functions(
    childPath: AppPath.FUNCTIONS,
  ),
  typesOfFunctions(
    childPath: AppPath.TYPESOFFUNCTIONS,
  ),
  functionParameter(
    childPath: AppPath.FUNCTIONPARAMETER,
  ),
  anonymousFunctions(
    childPath: AppPath.ANONYMOUSFUNCTIONS,
  ),
  arrowFunctions(
    childPath: AppPath.ARROWFUNCTIONS,
  ),
  scope(
    childPath: AppPath.SCOPE,
  ),
  mathInDart(
    childPath: AppPath.MATHINDART,
  ),

  //Collections In Dart
  listInDart(
    childPath: AppPath.LISTINDART,
  ),
  setInDart(
    childPath: AppPath.SETINDART,
  ),
  mapInDart(
    childPath: AppPath.MAPINDART,
  ),
  whereInDart(
    childPath: AppPath.WHERE,
  ),

  //File Handling in Dart
  readFile(
    childPath: AppPath.READFILE,
  ),
  writeFile(
    childPath: AppPath.WRITEFILE,
  ),
  deleteFile(
    childPath: AppPath.DELETEFILE,
  ),

  //OOPS in Dart
  oopsInDart(
    childPath: AppPath.OOPSINDART,
  ),
  classInDart(
    childPath: AppPath.CLASINDART,
  ),
  objectInDart(
    childPath: AppPath.OBJECTINDART,
  ),
  classAndObject(
    childPath: AppPath.CLASSANDOBJECT,
  ),
  constructor(
    childPath: AppPath.CONSTRUCTOR,
  ),
  defaultConstructor(
    childPath: AppPath.DEFAULTCONSTRUCTOR,
  ),
  paramterizedConstructor(
    childPath: AppPath.PARAMETERIZEDCONSTRUCTOR,
  ),
  namedConstructor(
    childPath: AppPath.NAMEDCONSTRUCTOR,
  ),
  constantContructor(
    childPath: AppPath.CONSTANTCONTRUCTOR,
  ),
  encapsulation(
    childPath: AppPath.ENCAPSULATION,
  ),
  getter(
    childPath: AppPath.GETTER,
  ),
  setter(
    childPath: AppPath.SETTER,
  ),
  inheritence(
    childPath: AppPath.INHERITENCE,
  ),
  polymorphism(
    childPath: AppPath.POLYMORPHISM,
  ),
  static(
    childPath: AppPath.STATIS,
  ),
  superInDart(
    childPath: AppPath.SUPERINDART,
  ),
  enumInDart(
    childPath: AppPath.ENUM,
  ),
  abstarctClassInDart(
    childPath: AppPath.ABSTRACTINDSRT,
  ),
  interface(
    childPath: AppPath.INTERFACE,
  ),
  mixinInDart(
    childPath: AppPath.MIXINDART,
  ),
  generic(
    childPath: AppPath.GENERIC,
  ),
  extension(
    childPath: AppPath.EXTENSION,
  ),
  callableObject(
    childPath: AppPath.CALLABLEOBJECT,
  ),
  factoryConstructor(
    childPath: AppPath.FACTORYCONSTRUCTOR,
  ),

  //Null Safety
  nullSafety(
    childPath: AppPath.NullSAFETY,
  ),
  typePromotions(
    childPath: AppPath.TYPEPROMOTIONS,
  ),
  lateKeywords(
    childPath: AppPath.LATE,
  ),

  //Asynchronous Programing
  asyncProgramming(
    childPath: AppPath.ASYNCPROGRAMMING,
  ),
  futureInDart(
    childPath: AppPath.FUTURE,
  ),
  asyncAndAwait(
    childPath: AppPath.ASYNCANDAWAIT,
  ),
  streamInDart(
    childPath: AppPath.STREAM,
  ),
  isolate(
    childPath: AppPath.ISOLATE,
  ),
  ;

  final String? childPath;
  const SideNavBarChildEnum({this.childPath});

  String get title {
    switch (this) {
      //Home
      case SideNavBarChildEnum.home:
        return SK.home;
      //Introduction
      case SideNavBarChildEnum.introductionToDart:
        return SK.introductionToDart;
      case SideNavBarChildEnum.installDart:
        return SK.installDart;
      case SideNavBarChildEnum.dartBasic:
        return SK.dartBasic;
      case SideNavBarChildEnum.variables:
        return SK.variables;
      case SideNavBarChildEnum.dataTypes:
        return SK.dataTypes;
      case SideNavBarChildEnum.comments:
        return SK.comments;
      case SideNavBarChildEnum.oprators:
        return SK.oprator;
      case SideNavBarChildEnum.userInput:
        return SK.userInput;
      case SideNavBarChildEnum.metaData:
        return SK.metaData;
      case SideNavBarChildEnum.libraries:
        return SK.libraries;
      case SideNavBarChildEnum.string:
        return SK.string;
      case SideNavBarChildEnum.keywords:
        return SK.keywords;
      case SideNavBarChildEnum.finalVSConst:
        return SK.finalVsConst;
      case SideNavBarChildEnum.dateTimeInDart:
        return SK.dateTime;

      //Control Flow
      case SideNavBarChildEnum.controllFLow:
        return SK.controlFlow;
      case SideNavBarChildEnum.conditions:
        return SK.conditions;
      case SideNavBarChildEnum.assertInDart:
        return SK.assertInDart;
      case SideNavBarChildEnum.switchCase:
        return SK.switchCase;
      case SideNavBarChildEnum.ternery:
        return SK.terneryOprator;
      case SideNavBarChildEnum.loops:
        return SK.loops;
      case SideNavBarChildEnum.forLoop:
        return SK.forLoop;
      case SideNavBarChildEnum.forEachLoop:
        return SK.forEach;
      case SideNavBarChildEnum.whileLoop:
        return SK.whileLoop;
      case SideNavBarChildEnum.doWhileLoop:
        return SK.doWhile;
      case SideNavBarChildEnum.breakContinue:
        return SK.breakAnndContinue;
      case SideNavBarChildEnum.exception:
        return SK.exception;

      //Functions
      case SideNavBarChildEnum.functions:
        return SK.functions;
      case SideNavBarChildEnum.typesOfFunctions:
        return SK.typesOfFunctions;
      case SideNavBarChildEnum.functionParameter:
        return SK.functionParameter;
      case SideNavBarChildEnum.anonymousFunctions:
        return SK.anonymousFunctions;
      case SideNavBarChildEnum.arrowFunctions:
        return SK.arrowFunctions;
      case SideNavBarChildEnum.scope:
        return SK.scope;
      case SideNavBarChildEnum.mathInDart:
        return SK.mathInDart;

      //Collections
      case SideNavBarChildEnum.listInDart:
        return SK.listInDart;
      case SideNavBarChildEnum.setInDart:
        return SK.setInDart;
      case SideNavBarChildEnum.mapInDart:
        return SK.mapInDart;
      case SideNavBarChildEnum.whereInDart:
        return SK.whereInDart;

      //FileHanding
      case SideNavBarChildEnum.readFile:
        return SK.readFile;
      case SideNavBarChildEnum.writeFile:
        return SK.writeFile;
      case SideNavBarChildEnum.deleteFile:
        return SK.deleteFile;

      //OOPS IN Dart
      case SideNavBarChildEnum.oopsInDart:
        return SK.oopsInDart;
      case SideNavBarChildEnum.classInDart:
        return SK.classInDart;
      case SideNavBarChildEnum.objectInDart:
        return SK.objectInDart;
      case SideNavBarChildEnum.classAndObject:
        return SK.classAndObject;
      case SideNavBarChildEnum.constructor:
        return SK.constructor;
      case SideNavBarChildEnum.defaultConstructor:
        return SK.defaultConstructor;
      case SideNavBarChildEnum.paramterizedConstructor:
        return SK.paramterizedConstructor;
      case SideNavBarChildEnum.namedConstructor:
        return SK.namedConstructor;
      case SideNavBarChildEnum.constantContructor:
        return SK.constantContructor;
      case SideNavBarChildEnum.encapsulation:
        return SK.encapsulation;
      case SideNavBarChildEnum.getter:
        return SK.getter;
      case SideNavBarChildEnum.setter:
        return SK.setter;
      case SideNavBarChildEnum.inheritence:
        return SK.inheritence;
      case SideNavBarChildEnum.polymorphism:
        return SK.polymorphism;
      case SideNavBarChildEnum.static:
        return SK.static;
      case SideNavBarChildEnum.superInDart:
        return SK.superInDart;
      case SideNavBarChildEnum.enumInDart:
        return SK.enumInDart;
      case SideNavBarChildEnum.abstarctClassInDart:
        return SK.abstarctClassInDart;
      case SideNavBarChildEnum.interface:
        return SK.interface;
      case SideNavBarChildEnum.mixinInDart:
        return SK.mixinInDart;
      case SideNavBarChildEnum.generic:
        return SK.generic;
      case SideNavBarChildEnum.extension:
        return SK.extension;
      case SideNavBarChildEnum.callableObject:
        return SK.callableObject;
      case SideNavBarChildEnum.factoryConstructor:
        return SK.factoryConstructor;

      //Null Safety
      case SideNavBarChildEnum.nullSafety:
        return SK.nullSafety;
      case SideNavBarChildEnum.typePromotions:
        return SK.typePromotions;
      case SideNavBarChildEnum.lateKeywords:
        return SK.lateKeywords;

      //Async Programing
      case SideNavBarChildEnum.asyncProgramming:
        return SK.asyncProgramming;
      case SideNavBarChildEnum.futureInDart:
        return SK.futureInDart;
      case SideNavBarChildEnum.asyncAndAwait:
        return SK.asyncAndAwait;
      case SideNavBarChildEnum.streamInDart:
        return SK.streamInDart;
      case SideNavBarChildEnum.isolate:
        return SK.isolate;
    }
  }
}
