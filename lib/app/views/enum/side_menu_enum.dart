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

  // Flutter Tutorials
  flutterTutorials(
    children: [
      SideNavBarChildEnum.flutterIntro,
      SideNavBarChildEnum.flutterSetup,
      SideNavBarChildEnum.flutterWidgets,
      SideNavBarChildEnum.flutterStateless,
      SideNavBarChildEnum.flutterStateful,
      SideNavBarChildEnum.flutterLayouts,
      SideNavBarChildEnum.flutterRowColumn,
      SideNavBarChildEnum.flutterStack,
      SideNavBarChildEnum.flutterListView,
      SideNavBarChildEnum.flutterGridView,
      SideNavBarChildEnum.flutterNavigation,
      SideNavBarChildEnum.flutterGoRouter,
      SideNavBarChildEnum.flutterStateMgmt,
      SideNavBarChildEnum.flutterProvider,
      SideNavBarChildEnum.flutterRiverpod,
      SideNavBarChildEnum.flutterGetX,
      SideNavBarChildEnum.flutterBloc,
      SideNavBarChildEnum.flutterNetworking,
      SideNavBarChildEnum.flutterHttp,
      SideNavBarChildEnum.flutterDio,
      SideNavBarChildEnum.flutterLocalStorage,
      SideNavBarChildEnum.flutterSharedPref,
      SideNavBarChildEnum.flutterHive,
      SideNavBarChildEnum.flutterSqlite,
      SideNavBarChildEnum.flutterFirebase,
      SideNavBarChildEnum.flutterAnimations,
      SideNavBarChildEnum.flutterImplicitAnim,
      SideNavBarChildEnum.flutterExplicitAnim,
      SideNavBarChildEnum.flutterHeroAnim,
      SideNavBarChildEnum.flutterTesting,
      SideNavBarChildEnum.flutterUnitTest,
      SideNavBarChildEnum.flutterWidgetTest,
      SideNavBarChildEnum.flutterPublishing,
      SideNavBarChildEnum.flutterWebDesktop,
    ],
    parentPath: AppPath.FLUTTER_INTRO,
  ),

  // Interview Prep
  interviewPrep(
    children: [
      SideNavBarChildEnum.interviewHome,
      SideNavBarChildEnum.dartInterviewQA,
      SideNavBarChildEnum.flutterInterviewQA,
      SideNavBarChildEnum.mockInterview,
    ],
    parentPath: AppPath.INTERVIEW_HOME,
  ),

  // Best Guide
  bestGuide(
    children: [
      SideNavBarChildEnum.bestGuideHome,
      SideNavBarChildEnum.projectStructure,
      SideNavBarChildEnum.cleanArchitecture,
      SideNavBarChildEnum.performanceTips,
      SideNavBarChildEnum.responsiveDesign,
      SideNavBarChildEnum.codeStyle,
      SideNavBarChildEnum.commonMistakes,
      SideNavBarChildEnum.usefulPackages,
      SideNavBarChildEnum.testingGuide,
    ],
    parentPath: AppPath.BEST_GUIDE_HOME,
  ),

  // Search
  search(
    children: [],
    parentPath: AppPath.SEARCH,
  ),

  // Bookmarks
  bookmarks(
    children: [],
    parentPath: AppPath.BOOKMARKS,
  ),

  // Progress
  progress(
    children: [],
    parentPath: AppPath.PROGRESS,
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
      case SideNavBarParentEnum.flutterTutorials:
        return SK.flutterTutorials;
      case SideNavBarParentEnum.interviewPrep:
        return SK.interviewPrep;
      case SideNavBarParentEnum.bestGuide:
        return SK.bestGuide;
      case SideNavBarParentEnum.search:
        return SK.search;
      case SideNavBarParentEnum.bookmarks:
        return SK.bookmarks;
      case SideNavBarParentEnum.progress:
        return SK.progress;
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
      case SideNavBarParentEnum.flutterTutorials:
        return (I.codeActive, I.codeInactive);
      case SideNavBarParentEnum.interviewPrep:
        return (I.codeActive, I.codeInactive);
      case SideNavBarParentEnum.bestGuide:
        return (I.codeActive, I.codeInactive);
      case SideNavBarParentEnum.search:
        return (I.codeActive, I.codeInactive);
      case SideNavBarParentEnum.bookmarks:
        return (I.codeActive, I.codeInactive);
      case SideNavBarParentEnum.progress:
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

  // Flutter Tutorials
  flutterIntro(childPath: AppPath.FLUTTER_INTRO),
  flutterSetup(childPath: AppPath.FLUTTER_SETUP),
  flutterWidgets(childPath: AppPath.FLUTTER_WIDGETS),
  flutterStateless(childPath: AppPath.FLUTTER_STATELESS),
  flutterStateful(childPath: AppPath.FLUTTER_STATEFUL),
  flutterLayouts(childPath: AppPath.FLUTTER_LAYOUTS),
  flutterRowColumn(childPath: AppPath.FLUTTER_ROW_COLUMN),
  flutterStack(childPath: AppPath.FLUTTER_STACK),
  flutterListView(childPath: AppPath.FLUTTER_LISTVIEW),
  flutterGridView(childPath: AppPath.FLUTTER_GRIDVIEW),
  flutterNavigation(childPath: AppPath.FLUTTER_NAVIGATION),
  flutterGoRouter(childPath: AppPath.FLUTTER_GOROUTER),
  flutterStateMgmt(childPath: AppPath.FLUTTER_STATE_MGMT),
  flutterProvider(childPath: AppPath.FLUTTER_PROVIDER),
  flutterRiverpod(childPath: AppPath.FLUTTER_RIVERPOD),
  flutterGetX(childPath: AppPath.FLUTTER_GETX),
  flutterBloc(childPath: AppPath.FLUTTER_BLOC),
  flutterNetworking(childPath: AppPath.FLUTTER_NETWORKING),
  flutterHttp(childPath: AppPath.FLUTTER_HTTP),
  flutterDio(childPath: AppPath.FLUTTER_DIO),
  flutterLocalStorage(childPath: AppPath.FLUTTER_LOCAL_STORAGE),
  flutterSharedPref(childPath: AppPath.FLUTTER_SHARED_PREF),
  flutterHive(childPath: AppPath.FLUTTER_HIVE),
  flutterSqlite(childPath: AppPath.FLUTTER_SQLITE),
  flutterFirebase(childPath: AppPath.FLUTTER_FIREBASE),
  flutterAnimations(childPath: AppPath.FLUTTER_ANIMATIONS),
  flutterImplicitAnim(childPath: AppPath.FLUTTER_IMPLICIT_ANIM),
  flutterExplicitAnim(childPath: AppPath.FLUTTER_EXPLICIT_ANIM),
  flutterHeroAnim(childPath: AppPath.FLUTTER_HERO_ANIM),
  flutterTesting(childPath: AppPath.FLUTTER_TESTING),
  flutterUnitTest(childPath: AppPath.FLUTTER_UNIT_TEST),
  flutterWidgetTest(childPath: AppPath.FLUTTER_WIDGET_TEST),
  flutterPublishing(childPath: AppPath.FLUTTER_PUBLISHING),
  flutterWebDesktop(childPath: AppPath.FLUTTER_WEB_DESKTOP),

  // Interview Prep
  interviewHome(childPath: AppPath.INTERVIEW_HOME),
  dartInterviewQA(childPath: AppPath.INTERVIEW_DART_QA),
  flutterInterviewQA(childPath: AppPath.INTERVIEW_FLUTTER_QA),
  mockInterview(childPath: AppPath.INTERVIEW_MOCK),

  // Best Guide
  bestGuideHome(childPath: AppPath.BEST_GUIDE_HOME),
  projectStructure(childPath: AppPath.BEST_GUIDE_STRUCTURE),
  cleanArchitecture(childPath: AppPath.BEST_GUIDE_CLEAN_ARCH),
  performanceTips(childPath: AppPath.BEST_GUIDE_PERFORMANCE),
  responsiveDesign(childPath: AppPath.BEST_GUIDE_RESPONSIVE),
  codeStyle(childPath: AppPath.BEST_GUIDE_CODE_STYLE),
  commonMistakes(childPath: AppPath.BEST_GUIDE_MISTAKES),
  usefulPackages(childPath: AppPath.BEST_GUIDE_PACKAGES),
  testingGuide(childPath: AppPath.BEST_GUIDE_TESTING),

  // Search / Bookmarks / Progress
  searchPage(childPath: AppPath.SEARCH),
  bookmarksPage(childPath: AppPath.BOOKMARKS),
  progressPage(childPath: AppPath.PROGRESS),
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

      // Flutter Tutorials
      case SideNavBarChildEnum.flutterIntro:
        return SK.flutterIntro;
      case SideNavBarChildEnum.flutterSetup:
        return SK.flutterSetup;
      case SideNavBarChildEnum.flutterWidgets:
        return SK.flutterWidgets;
      case SideNavBarChildEnum.flutterStateless:
        return SK.flutterStateless;
      case SideNavBarChildEnum.flutterStateful:
        return SK.flutterStateful;
      case SideNavBarChildEnum.flutterLayouts:
        return SK.flutterLayouts;
      case SideNavBarChildEnum.flutterRowColumn:
        return SK.flutterRowColumn;
      case SideNavBarChildEnum.flutterStack:
        return SK.flutterStack;
      case SideNavBarChildEnum.flutterListView:
        return SK.flutterListView;
      case SideNavBarChildEnum.flutterGridView:
        return SK.flutterGridView;
      case SideNavBarChildEnum.flutterNavigation:
        return SK.flutterNavigation;
      case SideNavBarChildEnum.flutterGoRouter:
        return SK.flutterGoRouter;
      case SideNavBarChildEnum.flutterStateMgmt:
        return SK.flutterStateMgmt;
      case SideNavBarChildEnum.flutterProvider:
        return SK.flutterProvider;
      case SideNavBarChildEnum.flutterRiverpod:
        return SK.flutterRiverpod;
      case SideNavBarChildEnum.flutterGetX:
        return SK.flutterGetX;
      case SideNavBarChildEnum.flutterBloc:
        return SK.flutterBloc;
      case SideNavBarChildEnum.flutterNetworking:
        return SK.flutterNetworking;
      case SideNavBarChildEnum.flutterHttp:
        return SK.flutterHttp;
      case SideNavBarChildEnum.flutterDio:
        return SK.flutterDio;
      case SideNavBarChildEnum.flutterLocalStorage:
        return SK.flutterLocalStorage;
      case SideNavBarChildEnum.flutterSharedPref:
        return SK.flutterSharedPref;
      case SideNavBarChildEnum.flutterHive:
        return SK.flutterHive;
      case SideNavBarChildEnum.flutterSqlite:
        return SK.flutterSqlite;
      case SideNavBarChildEnum.flutterFirebase:
        return SK.flutterFirebase;
      case SideNavBarChildEnum.flutterAnimations:
        return SK.flutterAnimations;
      case SideNavBarChildEnum.flutterImplicitAnim:
        return SK.flutterImplicitAnim;
      case SideNavBarChildEnum.flutterExplicitAnim:
        return SK.flutterExplicitAnim;
      case SideNavBarChildEnum.flutterHeroAnim:
        return SK.flutterHeroAnim;
      case SideNavBarChildEnum.flutterTesting:
        return SK.flutterTesting;
      case SideNavBarChildEnum.flutterUnitTest:
        return SK.flutterUnitTest;
      case SideNavBarChildEnum.flutterWidgetTest:
        return SK.flutterWidgetTest;
      case SideNavBarChildEnum.flutterPublishing:
        return SK.flutterPublishing;
      case SideNavBarChildEnum.flutterWebDesktop:
        return SK.flutterWebDesktop;

      // Interview Prep
      case SideNavBarChildEnum.interviewHome:
        return SK.interviewHome;
      case SideNavBarChildEnum.dartInterviewQA:
        return SK.dartInterviewQA;
      case SideNavBarChildEnum.flutterInterviewQA:
        return SK.flutterInterviewQA;
      case SideNavBarChildEnum.mockInterview:
        return SK.mockInterview;

      // Best Guide
      case SideNavBarChildEnum.bestGuideHome:
        return SK.bestGuideHome;
      case SideNavBarChildEnum.projectStructure:
        return SK.projectStructure;
      case SideNavBarChildEnum.cleanArchitecture:
        return SK.cleanArchitecture;
      case SideNavBarChildEnum.performanceTips:
        return SK.performanceTips;
      case SideNavBarChildEnum.responsiveDesign:
        return SK.responsiveDesign;
      case SideNavBarChildEnum.codeStyle:
        return SK.codeStyle;
      case SideNavBarChildEnum.commonMistakes:
        return SK.commonMistakes;
      case SideNavBarChildEnum.usefulPackages:
        return SK.usefulPackages;
      case SideNavBarChildEnum.testingGuide:
        return SK.testingGuide;

      // Search / Bookmarks / Progress
      case SideNavBarChildEnum.searchPage:
        return SK.search;
      case SideNavBarChildEnum.bookmarksPage:
        return SK.bookmarks;
      case SideNavBarChildEnum.progressPage:
        return SK.progress;
    }
  }
}
