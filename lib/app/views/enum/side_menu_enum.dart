import '../../../constants/images.dart';
import '../../../constants/strings/string_keys.dart';
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
    }
  }

  (String selectedImage, String unSelectedImage) get image {
    switch (this) {
      case SideNavBarParentEnum.home:
        return (I.icCategory2Active, I.icCategory2);
      case SideNavBarParentEnum.introductionAndSyntax:
        return (I.icBriefcaseActive, I.icBriefcase);
      case SideNavBarParentEnum.controlFlowAndLoop:
        return (I.icProfile2userActive, I.icProfile2user);
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
  installDart(
    childPath: Routes.INSTALL_DART,
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
  );

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
    }
  }
}
