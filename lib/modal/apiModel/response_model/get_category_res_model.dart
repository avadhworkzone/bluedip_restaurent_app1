class GetCategoryResModel {
  bool? status;
  GetCategory? getCategory;

  GetCategoryResModel({this.status, this.getCategory});

  GetCategoryResModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    getCategory = json['getCategory'] != null
        ? new GetCategory.fromJson(json['getCategory'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.getCategory != null) {
      data['getCategory'] = this.getCategory!.toJson();
    }
    return data;
  }
}

class GetCategory {
  String? command;
  int? rowCount;
  var oid;
  List<Rows>? rows;
  List<Fields>? fields;
  List<Null>? lParsers;
  Types? tTypes;
  var rowCtor;
  bool? rowAsArray;

  GetCategory(
      {this.command,
      this.rowCount,
      this.oid,
      this.rows,
      this.fields,
      this.lParsers,
      this.tTypes,
      this.rowCtor,
      this.rowAsArray});

  GetCategory.fromJson(Map<String, dynamic> json) {
    command = json['command'];
    rowCount = json['rowCount'];
    oid = json['oid'];
    if (json['rows'] != null) {
      rows = <Rows>[];
      json['rows'].forEach((v) {
        rows!.add(new Rows.fromJson(v));
      });
    }
    if (json['fields'] != null) {
      fields = <Fields>[];
      json['fields'].forEach((v) {
        fields!.add(new Fields.fromJson(v));
      });
    }
    // if (json['_parsers'] != null) {
    //   lParsers = <Null>[];
    //   json['_parsers'].forEach((v) {
    //     lParsers!.add(new Null.fromJson(v));
    //   });
    // }
    tTypes = json['_types'] != null ? new Types.fromJson(json['_types']) : null;
    rowCtor = json['RowCtor'];
    rowAsArray = json['rowAsArray'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['command'] = this.command;
    data['rowCount'] = this.rowCount;
    data['oid'] = this.oid;
    if (this.rows != null) {
      data['rows'] = this.rows!.map((v) => v.toJson()).toList();
    }
    if (this.fields != null) {
      data['fields'] = this.fields!.map((v) => v.toJson()).toList();
    }
    // if (this.lParsers != null) {
    //   data['_parsers'] = this.lParsers!.map((v) => v.toJson()).toList();
    // }
    if (this.tTypes != null) {
      data['_types'] = this.tTypes!.toJson();
    }
    data['RowCtor'] = this.rowCtor;
    data['rowAsArray'] = this.rowAsArray;
    return data;
  }
}

class Rows {
  int? categoryId;
  String? categoryName;
  String? dateCreated;
  var dateModified;
  String? status;
  int? isDeleted;

  Rows(
      {this.categoryId,
      this.categoryName,
      this.dateCreated,
      this.dateModified,
      this.status,
      this.isDeleted});

  Rows.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    dateCreated = json['date_created'];
    dateModified = json['date_modified'];
    status = json['status'];
    isDeleted = json['is_deleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['date_created'] = this.dateCreated;
    data['date_modified'] = this.dateModified;
    data['status'] = this.status;
    data['is_deleted'] = this.isDeleted;
    return data;
  }
}

class Fields {
  String? name;
  int? tableID;
  int? columnID;
  int? dataTypeID;
  int? dataTypeSize;
  int? dataTypeModifier;
  String? format;

  Fields(
      {this.name,
      this.tableID,
      this.columnID,
      this.dataTypeID,
      this.dataTypeSize,
      this.dataTypeModifier,
      this.format});

  Fields.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    tableID = json['tableID'];
    columnID = json['columnID'];
    dataTypeID = json['dataTypeID'];
    dataTypeSize = json['dataTypeSize'];
    dataTypeModifier = json['dataTypeModifier'];
    format = json['format'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['tableID'] = this.tableID;
    data['columnID'] = this.columnID;
    data['dataTypeID'] = this.dataTypeID;
    data['dataTypeSize'] = this.dataTypeSize;
    data['dataTypeModifier'] = this.dataTypeModifier;
    data['format'] = this.format;
    return data;
  }
}

class Parsers {
  Parsers();

  Parsers.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}

// class Types {
//   Types? tTypes;
//   Parsers? text;
//   Parsers? binary;
//
//   Types({this.tTypes, this.text, this.binary});
//
//   Types.fromJson(Map<String, dynamic> json) {
//     tTypes = json['_types'] != null ? new Types.fromJson(json['_types']) : null;
//     text = json['text'] != null ? new Parsers.fromJson(json['text']) : null;
//     binary =
//         json['binary'] != null ? new Parsers.fromJson(json['binary']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.tTypes != null) {
//       data['_types'] = this.tTypes!.toJson();
//     }
//     if (this.text != null) {
//       data['text'] = this.text!.toJson();
//     }
//     if (this.binary != null) {
//       data['binary'] = this.binary!.toJson();
//     }
//     return data;
//   }
// }
//
// class Types {
//   Parsers? arrayParser;
//   Builtins? builtins;
//
//   Types({this.arrayParser, this.builtins});
//
//   Types.fromJson(Map<String, dynamic> json) {
//     arrayParser = json['arrayParser'] != null
//         ? new Parsers.fromJson(json['arrayParser'])
//         : null;
//     builtins = json['builtins'] != null
//         ? new Builtins.fromJson(json['builtins'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.arrayParser != null) {
//       data['arrayParser'] = this.arrayParser!.toJson();
//     }
//     if (this.builtins != null) {
//       data['builtins'] = this.builtins!.toJson();
//     }
//     return data;
//   }
// }

class Builtins {
  int? bOOL;
  int? bYTEA;
  int? cHAR;
  int? iNT8;
  int? iNT2;
  int? iNT4;
  int? rEGPROC;
  int? tEXT;
  int? oID;
  int? tID;
  int? xID;
  int? cID;
  int? jSON;
  int? xML;
  int? pGNODETREE;
  int? sMGR;
  int? pATH;
  int? pOLYGON;
  int? cIDR;
  int? fLOAT4;
  int? fLOAT8;
  int? aBSTIME;
  int? rELTIME;
  int? tINTERVAL;
  int? cIRCLE;
  int? mACADDR8;
  int? mONEY;
  int? mACADDR;
  int? iNET;
  int? aCLITEM;
  int? bPCHAR;
  int? vARCHAR;
  int? dATE;
  int? tIME;
  int? tIMESTAMP;
  int? tIMESTAMPTZ;
  int? iNTERVAL;
  int? tIMETZ;
  int? bIT;
  int? vARBIT;
  int? nUMERIC;
  int? rEFCURSOR;
  int? rEGPROCEDURE;
  int? rEGOPER;
  int? rEGOPERATOR;
  int? rEGCLASS;
  int? rEGTYPE;
  int? uUID;
  int? tXIDSNAPSHOT;
  int? pGLSN;
  int? pGNDISTINCT;
  int? pGDEPENDENCIES;
  int? tSVECTOR;
  int? tSQUERY;
  int? gTSVECTOR;
  int? rEGCONFIG;
  int? rEGDICTIONARY;
  int? jSONB;
  int? rEGNAMESPACE;
  int? rEGROLE;

  Builtins(
      {this.bOOL,
      this.bYTEA,
      this.cHAR,
      this.iNT8,
      this.iNT2,
      this.iNT4,
      this.rEGPROC,
      this.tEXT,
      this.oID,
      this.tID,
      this.xID,
      this.cID,
      this.jSON,
      this.xML,
      this.pGNODETREE,
      this.sMGR,
      this.pATH,
      this.pOLYGON,
      this.cIDR,
      this.fLOAT4,
      this.fLOAT8,
      this.aBSTIME,
      this.rELTIME,
      this.tINTERVAL,
      this.cIRCLE,
      this.mACADDR8,
      this.mONEY,
      this.mACADDR,
      this.iNET,
      this.aCLITEM,
      this.bPCHAR,
      this.vARCHAR,
      this.dATE,
      this.tIME,
      this.tIMESTAMP,
      this.tIMESTAMPTZ,
      this.iNTERVAL,
      this.tIMETZ,
      this.bIT,
      this.vARBIT,
      this.nUMERIC,
      this.rEFCURSOR,
      this.rEGPROCEDURE,
      this.rEGOPER,
      this.rEGOPERATOR,
      this.rEGCLASS,
      this.rEGTYPE,
      this.uUID,
      this.tXIDSNAPSHOT,
      this.pGLSN,
      this.pGNDISTINCT,
      this.pGDEPENDENCIES,
      this.tSVECTOR,
      this.tSQUERY,
      this.gTSVECTOR,
      this.rEGCONFIG,
      this.rEGDICTIONARY,
      this.jSONB,
      this.rEGNAMESPACE,
      this.rEGROLE});

  Builtins.fromJson(Map<String, dynamic> json) {
    bOOL = json['BOOL'];
    bYTEA = json['BYTEA'];
    cHAR = json['CHAR'];
    iNT8 = json['INT8'];
    iNT2 = json['INT2'];
    iNT4 = json['INT4'];
    rEGPROC = json['REGPROC'];
    tEXT = json['TEXT'];
    oID = json['OID'];
    tID = json['TID'];
    xID = json['XID'];
    cID = json['CID'];
    jSON = json['JSON'];
    xML = json['XML'];
    pGNODETREE = json['PG_NODE_TREE'];
    sMGR = json['SMGR'];
    pATH = json['PATH'];
    pOLYGON = json['POLYGON'];
    cIDR = json['CIDR'];
    fLOAT4 = json['FLOAT4'];
    fLOAT8 = json['FLOAT8'];
    aBSTIME = json['ABSTIME'];
    rELTIME = json['RELTIME'];
    tINTERVAL = json['TINTERVAL'];
    cIRCLE = json['CIRCLE'];
    mACADDR8 = json['MACADDR8'];
    mONEY = json['MONEY'];
    mACADDR = json['MACADDR'];
    iNET = json['INET'];
    aCLITEM = json['ACLITEM'];
    bPCHAR = json['BPCHAR'];
    vARCHAR = json['VARCHAR'];
    dATE = json['DATE'];
    tIME = json['TIME'];
    tIMESTAMP = json['TIMESTAMP'];
    tIMESTAMPTZ = json['TIMESTAMPTZ'];
    iNTERVAL = json['INTERVAL'];
    tIMETZ = json['TIMETZ'];
    bIT = json['BIT'];
    vARBIT = json['VARBIT'];
    nUMERIC = json['NUMERIC'];
    rEFCURSOR = json['REFCURSOR'];
    rEGPROCEDURE = json['REGPROCEDURE'];
    rEGOPER = json['REGOPER'];
    rEGOPERATOR = json['REGOPERATOR'];
    rEGCLASS = json['REGCLASS'];
    rEGTYPE = json['REGTYPE'];
    uUID = json['UUID'];
    tXIDSNAPSHOT = json['TXID_SNAPSHOT'];
    pGLSN = json['PG_LSN'];
    pGNDISTINCT = json['PG_NDISTINCT'];
    pGDEPENDENCIES = json['PG_DEPENDENCIES'];
    tSVECTOR = json['TSVECTOR'];
    tSQUERY = json['TSQUERY'];
    gTSVECTOR = json['GTSVECTOR'];
    rEGCONFIG = json['REGCONFIG'];
    rEGDICTIONARY = json['REGDICTIONARY'];
    jSONB = json['JSONB'];
    rEGNAMESPACE = json['REGNAMESPACE'];
    rEGROLE = json['REGROLE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BOOL'] = this.bOOL;
    data['BYTEA'] = this.bYTEA;
    data['CHAR'] = this.cHAR;
    data['INT8'] = this.iNT8;
    data['INT2'] = this.iNT2;
    data['INT4'] = this.iNT4;
    data['REGPROC'] = this.rEGPROC;
    data['TEXT'] = this.tEXT;
    data['OID'] = this.oID;
    data['TID'] = this.tID;
    data['XID'] = this.xID;
    data['CID'] = this.cID;
    data['JSON'] = this.jSON;
    data['XML'] = this.xML;
    data['PG_NODE_TREE'] = this.pGNODETREE;
    data['SMGR'] = this.sMGR;
    data['PATH'] = this.pATH;
    data['POLYGON'] = this.pOLYGON;
    data['CIDR'] = this.cIDR;
    data['FLOAT4'] = this.fLOAT4;
    data['FLOAT8'] = this.fLOAT8;
    data['ABSTIME'] = this.aBSTIME;
    data['RELTIME'] = this.rELTIME;
    data['TINTERVAL'] = this.tINTERVAL;
    data['CIRCLE'] = this.cIRCLE;
    data['MACADDR8'] = this.mACADDR8;
    data['MONEY'] = this.mONEY;
    data['MACADDR'] = this.mACADDR;
    data['INET'] = this.iNET;
    data['ACLITEM'] = this.aCLITEM;
    data['BPCHAR'] = this.bPCHAR;
    data['VARCHAR'] = this.vARCHAR;
    data['DATE'] = this.dATE;
    data['TIME'] = this.tIME;
    data['TIMESTAMP'] = this.tIMESTAMP;
    data['TIMESTAMPTZ'] = this.tIMESTAMPTZ;
    data['INTERVAL'] = this.iNTERVAL;
    data['TIMETZ'] = this.tIMETZ;
    data['BIT'] = this.bIT;
    data['VARBIT'] = this.vARBIT;
    data['NUMERIC'] = this.nUMERIC;
    data['REFCURSOR'] = this.rEFCURSOR;
    data['REGPROCEDURE'] = this.rEGPROCEDURE;
    data['REGOPER'] = this.rEGOPER;
    data['REGOPERATOR'] = this.rEGOPERATOR;
    data['REGCLASS'] = this.rEGCLASS;
    data['REGTYPE'] = this.rEGTYPE;
    data['UUID'] = this.uUID;
    data['TXID_SNAPSHOT'] = this.tXIDSNAPSHOT;
    data['PG_LSN'] = this.pGLSN;
    data['PG_NDISTINCT'] = this.pGNDISTINCT;
    data['PG_DEPENDENCIES'] = this.pGDEPENDENCIES;
    data['TSVECTOR'] = this.tSVECTOR;
    data['TSQUERY'] = this.tSQUERY;
    data['GTSVECTOR'] = this.gTSVECTOR;
    data['REGCONFIG'] = this.rEGCONFIG;
    data['REGDICTIONARY'] = this.rEGDICTIONARY;
    data['JSONB'] = this.jSONB;
    data['REGNAMESPACE'] = this.rEGNAMESPACE;
    data['REGROLE'] = this.rEGROLE;
    return data;
  }
}

class Types {
  Types? tTypes;
  Parsers? text;
  Parsers? binary;

  Types({this.tTypes, this.text, this.binary});

  Types.fromJson(Map<String, dynamic> json) {
    tTypes = json['_types'] != null ? new Types.fromJson(json['_types']) : null;
    text = json['text'] != null ? new Parsers.fromJson(json['text']) : null;
    binary =
        json['binary'] != null ? new Parsers.fromJson(json['binary']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tTypes != null) {
      data['_types'] = this.tTypes!.toJson();
    }
    if (this.text != null) {
      data['text'] = this.text!.toJson();
    }
    if (this.binary != null) {
      data['binary'] = this.binary!.toJson();
    }
    return data;
  }
}

// class Types {
//   Parsers? arrayParser;
//   Builtins? builtins;
//
//   Types({this.arrayParser, this.builtins});
//
//   Types.fromJson(Map<String, dynamic> json) {
//     arrayParser = json['arrayParser'] != null
//         ? new Parsers.fromJson(json['arrayParser'])
//         : null;
//     builtins = json['builtins'] != null
//         ? new Builtins.fromJson(json['builtins'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.arrayParser != null) {
//       data['arrayParser'] = this.arrayParser!.toJson();
//     }
//     if (this.builtins != null) {
//       data['builtins'] = this.builtins!.toJson();
//     }
//     return data;
//   }
// }
