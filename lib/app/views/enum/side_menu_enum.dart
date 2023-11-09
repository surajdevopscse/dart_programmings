import '../../../utils/constants/images.dart';
import '../../../utils/constants/strings/string_keys.dart';
import '../../routes/app_pages.dart';

enum SideNavBarParentEnum {
  //Home
  home(
    children: [],
    parentPath: Routes.HOME,
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
    parentPath: Routes.INTRODUCTION,
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
    parentPath: Routes.CONDITIONS,
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
    parentPath: Routes.FUNCTIONS,
  ),

//Colletions in Dart
  collections(
    children: [
      SideNavBarChildEnum.listInDart,
      SideNavBarChildEnum.setInDart,
      SideNavBarChildEnum.mapInDart,
      SideNavBarChildEnum.whereInDart,
    ],
    parentPath: Routes.LISTINDART,
  ),

//FileHanding In Dart
  fileHandling(
    children: [
      SideNavBarChildEnum.readFile,
      SideNavBarChildEnum.writeFile,
      SideNavBarChildEnum.deleteFile,
    ],
    parentPath: Routes.READFILE,
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
    parentPath: Routes.OOPSINDART,
  ),

  //Null Safety
  nullSafety(
    children: [
      SideNavBarChildEnum.nullSafety,
      SideNavBarChildEnum.typePromotions,
      SideNavBarChildEnum.lateKeywords,
    ],
    parentPath: Routes.NullSAFETY,
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
    parentPath: Routes.ASYNCPROGRAMMING,
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
  home(childPath: Routes.HOME),
  //Introduction to Dart
  introductionToDart(
    childPath: Routes.INTRODUCTION,
  ),
  installDart(
    childPath: Routes.INSTALL_DART,
  ),
  dartBasic(
    childPath: Routes.DART_BASIC,
  ),
  variables(
    childPath: Routes.VARIABLE,
  ),
  dataTypes(
    childPath: Routes.DATATYPES,
  ),
  comments(
    childPath: Routes.COMMENTS,
  ),
  oprators(
    childPath: Routes.OPRATOR,
  ),
  userInput(
    childPath: Routes.USERINPUT,
  ),
  metaData(
    childPath: Routes.METADATA,
  ),
  libraries(
    childPath: Routes.LIBRARIES,
  ),
  string(
    childPath: Routes.STRING,
  ),
  keywords(
    childPath: Routes.KEYWORDS,
  ),
  finalVSConst(
    childPath: Routes.FINALVSCONST,
  ),
  dateTimeInDart(
    childPath: Routes.DATETIME,
  ),

  //Control Flow
  controllFLow(
    childPath: Routes.CONDITIONS,
  ),
  assertInDart(
    childPath: Routes.ASSERT,
  ),
  switchCase(
    childPath: Routes.SWITCH,
  ),
  ternery(
    childPath: Routes.TERNERY,
  ),
  loops(
    childPath: Routes.LOOPS,
  ),
  forLoop(
    childPath: Routes.FORLOOP,
  ),
  forEachLoop(
    childPath: Routes.FOREACHLOOP,
  ),
  whileLoop(
    childPath: Routes.WHILE,
  ),
  doWhileLoop(
    childPath: Routes.DOWHILE,
  ),
  breakContinue(
    childPath: Routes.BREAKCONTINUE,
  ),
  conditions(
    childPath: Routes.CONDITIONS,
  ),
  exception(
    childPath: Routes.EXCEPTION,
  ),
  //Funtions
  functions(
    childPath: Routes.FUNCTIONS,
  ),
  typesOfFunctions(
    childPath: Routes.TYPESOFFUNCTIONS,
  ),
  functionParameter(
    childPath: Routes.FUNCTIONPARAMETER,
  ),
  anonymousFunctions(
    childPath: Routes.ANONYMOUSFUNCTION,
  ),
  arrowFunctions(
    childPath: Routes.ARROWFUNCTIONS,
  ),
  scope(
    childPath: Routes.SCOPE,
  ),
  mathInDart(
    childPath: Routes.MATHINDART,
  ),

  //Collections In Dart
  listInDart(
    childPath: Routes.LISTINDART,
  ),
  setInDart(
    childPath: Routes.SETINDART,
  ),
  mapInDart(
    childPath: Routes.MAPINDART,
  ),
  whereInDart(
    childPath: Routes.WHERE,
  ),

  //File Handling in Dart
  readFile(
    childPath: Routes.READFILE,
  ),
  writeFile(
    childPath: Routes.WRITEFILE,
  ),
  deleteFile(
    childPath: Routes.DELETEFILE,
  ),

  //OOPS in Dart
  oopsInDart(
    childPath: Routes.OOPSINDART,
  ),
  classInDart(
    childPath: Routes.CLASINDART,
  ),
  objectInDart(
    childPath: Routes.OBJECTINDART,
  ),
  classAndObject(
    childPath: Routes.CLASSANDOBJECT,
  ),
  constructor(
    childPath: Routes.CONSTRUCTOR,
  ),
  defaultConstructor(
    childPath: Routes.DEFAULTCONSTRUCTOR,
  ),
  paramterizedConstructor(
    childPath: Routes.PARAMETERIZEDCONSTRUCTOR,
  ),
  namedConstructor(
    childPath: Routes.NAMEDCONSTRUCTOR,
  ),
  constantContructor(
    childPath: Routes.CONSTANTCONTRUCTOR,
  ),
  encapsulation(
    childPath: Routes.ENCAPSULATION,
  ),
  getter(
    childPath: Routes.GETTER,
  ),
  setter(
    childPath: Routes.SETTER,
  ),
  inheritence(
    childPath: Routes.INHERITENCE,
  ),
  polymorphism(
    childPath: Routes.POLYMORPHISM,
  ),
  static(
    childPath: Routes.STATIS,
  ),
  superInDart(
    childPath: Routes.SUPERINDART,
  ),
  enumInDart(
    childPath: Routes.ENUM,
  ),
  abstarctClassInDart(
    childPath: Routes.ABSTRACTINDSRT,
  ),
  interface(
    childPath: Routes.INTERFACE,
  ),
  mixinInDart(
    childPath: Routes.MIXINDART,
  ),
  generic(
    childPath: Routes.GENERIC,
  ),
  extension(
    childPath: Routes.EXTENSION,
  ),
  callableObject(
    childPath: Routes.CALLABLEOBJECT,
  ),
  factoryConstructor(
    childPath: Routes.FACTORYCONSTRUCTOR,
  ),

  //Null Safety
  nullSafety(
    childPath: Routes.NullSAFETY,
  ),
  typePromotions(
    childPath: Routes.TYPEPROMOTIONS,
  ),
  lateKeywords(
    childPath: Routes.LATE,
  ),

  //Asynchronous Programing
  asyncProgramming(
    childPath: Routes.ASYNCPROGRAMMING,
  ),
  futureInDart(
    childPath: Routes.FUTURE,
  ),
  asyncAndAwait(
    childPath: Routes.ASYNCANDAWAIT,
  ),
  streamInDart(
    childPath: Routes.STREAM,
  ),
  isolate(
    childPath: Routes.ISOLATE,
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
