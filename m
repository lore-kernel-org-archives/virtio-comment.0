Return-Path: <virtio-comment-return-8148-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78201C001B0
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 11:35:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 181EA6E6D7
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 11:35:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 12795986C74
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 11:35:40 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 07B9E986C35; Fri,  3 Nov 2023 11:35:40 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DBED8986C34
	for <virtio-comment@lists.oasis-open.org>; Fri,  3 Nov 2023 11:35:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KHZdrG7ebdW/tK+VNYQPM50Zdaa6LzqcEuEkwKNtnusJgRwZY3KK8bTrVM359BqVUCFV2LNzlOIYrBYHCw3CwIWNAFeSXxYCqjrCm6jmpH7wTVqHopG2VWghDJBUpSadHOrBHGQZvBN2nBLNkdU5LxBZ04p0Dpo65TcWvCN6Gb/PdzljjVC8PK+iREuLs9u2S3MyIG40uPwFdLVsQLLTMXb1BFaLNbY7CKcNGgYBUBvyfbOfTJBU3lP58tHWZD+9LqYTnftM1G7mhWceUDUNAVHrQdeSpT44MSJS+bIZouRX37/sdUrIRHqDiXGwC5l9GgL2StGWDLCSOmOdXuJKAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=InLoUz3EN9rGjoBIHJWvMtW46vK6GJQ2yqqbn63uIAM=;
 b=QIITTZs7CzRo2lp5E8gmZUZWWhDDsMqykHlb8NIuL6gnda+4XCgIxqoygrancl9Xbh3Lvx7k6Q27gfd/rFfaOJDEopPITP9qP9lrBFm7BhftSs79AN77T/1aupsWVGbm1+8GQQePOW1CGD+BO1QXxqLDDfLN1/wSUiRLvO6YHgSEHLfuAkZGuS3laBK0Pb611DIGB7n/Wo6/onsJMp8jTz7sALt1/xgGajriKb4pCCS0/1pn75f518Eu5ESeE9Qln7scIqPO69sSUXgf17BYDrOgU+SPi7ebNrqjxjqHq4GeXcRUnxCtAMdQc1z6Sm6utk6NyMBF1FbXFAwSnnL1kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Zhu Lingshan
	<lingshan.zhu@intel.com>
CC: "jasowang@redhat.com" <jasowang@redhat.com>, "eperezma@redhat.com"
	<eperezma@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Thread-Topic: [PATCH V2 6/6] virtio-pci: implement dirty page tracking
Thread-Index: AQHaDkFr7w3tkrCqqkSwyxm5dwAptLBoapSAgAABpXA=
Date: Fri, 3 Nov 2023 11:35:03 +0000
Message-ID:
 <PH0PR12MB5481D028E63E6CB0AA7F4149DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-7-lingshan.zhu@intel.com>
 <20231103064730-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231103064730-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|BL1PR12MB5755:EE_
x-ms-office365-filtering-correlation-id: 9fd9dc23-0bc8-4085-c1aa-08dbdc60ebba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 cZvl/GxO912zKoQrlTk5gtBMbBYpfuPAyUw+HwgNABUgXhn7vivACklnysuth4tGj5kX0LWe/ZhOfOgu+aQuJnU9aYCgxCKBtZEgSK+XuhFan10D0+WRDcnu7KAOTg+QjJ+IcW+1SYAvi1AWqb0fMrLnvpEYLxzkXfUPjpfWXEPFhPM3iRfA3wyxpdxxpvst3Cm6QMasPR6SLtu7UcNr3PEWdL46rzzSq3KJkGxgCFg0HS0cWRhPYAQ0Vvx6zo80cyEZdHLb1F9Ky2FjGf/DzrPZ92ZAhGx7emqDIDtvTTbQxOwFufHydxp8g6sUnZyx5+FYbHFr3ab9T2Q0viIbILsvUusm6D9oR8xC+U5Kz4IB1C9Neh1uQNVISxlg1UE/JaEWpZtWxPYqhD9eu+Hd+pkgWs8cBRAd0ylVKnDRVxVTueGQpI9J6fQk8ihNOpwcKtezGwL4Haam5Ak/h14k1WbByEdkRUcblofi7yBcQdjKD4GIx+M06fg1BdAnw8S0lemiZobc+DfarXCW31rWAvPlZl2lJtevX/hpCF0LhHy7Vt/tky+z1XIziVZZUoGaP5oWFPn1MItaOJvHfF7gDI1GsQx1p9hQVhMrlvq4bZrJiKXD67dVG1yQZKT+06i14JgoVb3HXw8HGKFH8zJSQOIk7Z6LRhqDsFk28WlAKcaHBFcMYLvAm61FKdeRshai
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(376002)(136003)(366004)(39860400002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(38070700009)(55016003)(66946007)(66476007)(54906003)(76116006)(66556008)(66446008)(64756008)(316002)(110136005)(86362001)(38100700002)(33656002)(122000001)(9686003)(83380400001)(478600001)(66574015)(26005)(6506007)(71200400001)(7696005)(2906002)(966005)(41300700001)(4326008)(5660300002)(52536014)(8936002)(8676002)(14143004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d254NThEUXUzUC9CRDJMUW5GUlRabUdGZjl5Q2tuM05xbDZUb0FQVWlnNXRu?=
 =?utf-8?B?UkhuOWFWUC9DdTliTnpWeG4xcXkrSzZYTW1PRU12eG1UOUJnVEQxT3JIUzVN?=
 =?utf-8?B?QmI3d2ovL3IxQllKRmZuVTZXTXdhckZCRDRQVjlpZWszWjFnSDA4L3pTMmVq?=
 =?utf-8?B?RVJkOFNiYStFcFFRQlhFdkdncXlzdmtiUWN0V0haOS9xMFBxVjdPMzZQQmJN?=
 =?utf-8?B?UE5jbkVNaXBCRDBJTjlOZU8rWHhVN1h1MllwQUQxVU5ST0lVMjJ0cGE4Nm9Q?=
 =?utf-8?B?QUZnMVhtNlg2cExkdlR4cnRIVnFabGVyajUwc2xvQUI5blNlalN1ZGZ5cDhC?=
 =?utf-8?B?YU9TdjJOalFHOHEzYkZlZ3RGeDB5U0c1MzI5RXNRbjNOTUVPNkdCa3hZRmc0?=
 =?utf-8?B?U3F1Zys3ZEI1MkE1d2lQK3J6N1hGT1NLdHUxa2pIc3YwLzB5UVIzSStnSXhr?=
 =?utf-8?B?SGs1Vmd2cmdCb3JkYTlJMlp2WGErK3AyeXE2c1QvaTQxem5TZDQzRmlZOTll?=
 =?utf-8?B?eVVBWUt1ZjRIMzg4TldGZTRBZCtON2hxQVdpRHdkdndGbWRCNnlGaXlabU1a?=
 =?utf-8?B?bk1yRVNIZCtqZTRiK3V1V080S3hjMlZUSnBPbWUwQnFoU0VvZVhZMUxsMUNO?=
 =?utf-8?B?U0wwSkVjUFVOVnhmelhNU0ZhVVBYeDF5ZlhwdnVZYk5nMkw0MWNSenJJaVhV?=
 =?utf-8?B?RC91REEvQnhqZDZBS3hmTFhwNlFCTnVsdzdDdVNMa0hnZkhVQ1FKWE1jRFA2?=
 =?utf-8?B?SmVYOXRaWnliVlhId1ZjeGFtcEFOME5TSXkzS2ExTjJzTmEwcWJMaENySDIw?=
 =?utf-8?B?ZCt6Z0NkYnVDcXFkUDNQUERsNGZKeWcyK3VZNVVJbVgxYk94dUxmVmQ0R05z?=
 =?utf-8?B?SHhoNnMzNmNPNVFmakRsRGVCc0JCV1lGMFpQcE9VbUxoYUI1ditXKzRmd1B0?=
 =?utf-8?B?U2QxRmNnRzdDUkhXd0JtREVKZHIxS0pBSDlrWnlOV3QyS0JtMkVyZUtpTFlo?=
 =?utf-8?B?RklGQVpja1FCT1MrdE1YaFE2L01kbUt2NG5ZK2o5Y1hZd0lQeW9ydzE2czZL?=
 =?utf-8?B?bjY3STE4SDl6QW01RTAzV2ZIWVBnMTZ2NU1OVzlzOFppcHkxUGozMVVTV3ZH?=
 =?utf-8?B?SDMvRCtxYUhIbnJqNnlFTk9FZ1lLdmhLbk10UU5qSFYySEJ0WWxXQzNyWVU1?=
 =?utf-8?B?dGdsZHJkazlmM09FR2w2OEN6bHQvM2tITitYbmJ1clNoMUR6N01sQ2hJWEhN?=
 =?utf-8?B?d253RjU3OXpSZThkaXZPOGRVdFp0MXQrbGxhSmdDK0NOTnNDbDhaOWE3QlJP?=
 =?utf-8?B?NW92ZFhjb1NBdzBkdWJYVzkrRXJuTlE2QVQxVXBiWmtVV3Y1QllpTVFrV091?=
 =?utf-8?B?QjdId21FTkhTamJGUktXSWQzaDZBR0JmbEFSMlFzWlYvclN1ZGtxOVYwOTcy?=
 =?utf-8?B?NVJ0L1VERTRibjcyRnFxSXJQQWpPSG9DU3cvb25wTW9uNXk2Z3FHa2pMUmpS?=
 =?utf-8?B?Rit0K0VjQ0EzTFhaS05DRXJ6ZUZhRXJ3anpIY3lxd0pJWmkrWTg0WDRGVTU4?=
 =?utf-8?B?aHY4R2RKeCt0KzlPeDArdHVZSERlb2dUMXNCVVBYWU8zWmNqU1E3YkYvT2RL?=
 =?utf-8?B?OVhOR0FMbDgxOWRtY1RuMWplZEFsK3g1N25aYzlqNEhidFZLS3NyaEFhcUx0?=
 =?utf-8?B?VEg2ZmRRTFIydFp5ZUNIY2FrUzlZOHREeFk5d0JsSzEzOWhxQmNSSCt5RDAv?=
 =?utf-8?B?UThLRUxZUVhUUWtheW00dW1VcUhmU3FwdmU2K0VtY1hyL1pEQ0xjakszZUQ2?=
 =?utf-8?B?TEpEb0JQYWFhYW9IQ3hCUWZQWXZTSHR1QkJuSlhNVm04eXRFQUhkbkxYbEd4?=
 =?utf-8?B?cWIzbUU2T1FaTytDY1VRRlFrQXhvaktEWkdTQUwyUE16RTN3bHJ0ajZsWDN6?=
 =?utf-8?B?STFPeDV4aHpPeFRaSjJLRW9jbVU0UFBRcW9NYjh5UEtEOEFIbW00QVhHcDlP?=
 =?utf-8?B?SWhUQldGQnIybHZNNVltNTdZdnRsbXMvMVUyM2FnbWhXeWpKSkx3ZHY4dWFn?=
 =?utf-8?B?OVJTUWVDYk5sN3lKTVlycHo0V09FclBTMWpBTjBCUEo1SGd2dzlielJsVlFx?=
 =?utf-8?Q?P3nI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fd9dc23-0bc8-4085-c1aa-08dbdc60ebba
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2023 11:35:03.2315
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EJvRlnRjDADJQa7nr3pAh8LGi/EBig+6464ro3uGLOa+GBtkH0yjLC7PSymQnPlHqMTI3grizGIiyfl38cQE1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5755
Subject: [virtio-comment] RE: [PATCH V2 6/6] virtio-pci: implement dirty page tracking

DQo+IEZyb206IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+DQo+IFNlbnQ6IEZy
aWRheSwgTm92ZW1iZXIgMywgMjAyMyA0OjIwIFBNDQo+IA0KPiBPbiBGcmksIE5vdiAwMywgMjAy
MyBhdCAwNjozNDozN1BNICswODAwLCBaaHUgTGluZ3NoYW4gd3JvdGU6DQo+ID4gK1xpdGVtW1xm
aWVsZHtiaXRtYXBfYWRkcn1dDQo+ID4gKwlUaGUgZHJpdmVyIHVzZSB0aGlzIHRvIHNldCB0aGUg
YWRkcmVzcyBvZiB0aGUgYml0bWFwIHdoaWNoIHJlY29yZHMgdGhlDQo+IGRpcnR5IHBhZ2VzDQo+
ID4gKwljYXVzZWQgYnkgdGhlIGRldmljZS4NCj4gPiArCUVhY2ggYml0IGluIHRoZSBiaXRtYXAg
cmVwcmVzZW50cyBvbmUgbWVtb3J5IHBhZ2UsIGJpdCAwIGluIHRoZSBiaXRtYXANCj4gPiArCXJl
cHJzZW50cyBwYWdlIDAgYXQgYWRkcmVzcyAwLCBiaXQgMSByZXByZXNlbnRzIHBhZ2UgMSwgYW5k
IHNvIG9uIGluIGENCj4gbGluZWFyIG1hbm5lci4NCj4gPiArCVdoZW4gXGZpZWxke2VuYWJsZX0g
aXMgc2V0IHRvIDEgYW5kIHRoZSBkZXZpY2Ugd3JpdGVzIHRvIGEgbWVtb3J5IHBhZ2UsDQo+ID4g
Kwl0aGUgZGV2aWNlIE1VU1Qgc2V0IHRoZSBjb3JyZXNwb25kaW5nIGJpdCB0byAxIHdoaWNoIGlu
ZGljYXRpbmcgdGhlDQo+IHBhZ2UgaXMgZGlydHkuDQo+ID4gK1xpdGVtW1xmaWVsZHtiaXRtYXBf
bGVuZ3RofV0NCj4gPiArCVRoZSBkcml2ZXIgdXNlIHRoaXMgdG8gc2V0IHRoZSBsZW5ndGggaW4g
Ynl0ZXMgb2YgdGhlIGJpdG1hcC4NCj4gPiArXGVuZHtkZXNjcmlwdGlvbn0NCj4gPiArDQo+ID4g
K1xkZXZpY2Vub3JtYXRpdmV7XHN1YnN1YnNlY3Rpb259e01lbW9yeSBEaXJ0eSBQYWdlcyBUcmFj
a2VyDQo+ID4gK0NhcGFiaWxpdHl9e1ZpcnRpbyBUcmFuc3BvcnQgT3B0aW9ucyAvIFZpcnRpbyBP
dmVyIFBDSSBCdXMgLyBNZW1vcnkNCj4gPiArRGlydHkgUGFnZXMgVHJhY2tlciBDYXBhYmlsaXR5
fQ0KPiA+ICsNCj4gPiArVGhlIGRldmljZSBNVVNUIE5PVCBzZXQgYW55IGJpdHMgYmV5b25kIGJp
dG1hcF9sZW5ndGggd2hlbiByZXBvcnRpbmcNCj4gZGlydHkgcGFnZXMuDQo+ID4gKw0KPiA+ICtU
byBwcmV2ZW50IGEgcmVhZC1tb2RpZnktd3JpdGUgcHJvY2VkdXJlLCBpZiBhIG1lbW9yeSBwYWdl
IGlzIGRpcnR5LA0KSXQgaXMgbm90IHRvIHByZXZlbnQ7IGl0IGlzIGp1c3Qgbm90IHBvc3NpYmxl
IHRvIGRvIHJhY3kgUk1XLiDwn5iKDQpIZW5jZSB0byB3b3JrIGFyb3VuZCB5b3UgcHJvcG9zZSB0
byBtYXJrIGFsbCBwYWdlcyBkaXJ0eS4gVG9vIGJhZC4NClRoaXMganVzdCBkb2VzIG5vdCB3b3Jr
Lg0KDQpTZWNvbmRseSB0aGUgYml0bWFwIGFycmF5IGlzIGZ1bmN0aW9uIGlzIGZvciBmdWxsIGd1
ZXN0IG1lbW9yeSBzaXplLCB3aGlsZSB0aGVyZSBpcyBsb3Qgb2Ygc3BhcmNlIHJlZ2lvbiBub3cg
YW5kIGFsc28gaW4gZnV0dXJlLg0KVGhpcyBpcyB0aGUgc2Vjb25kIHByb2JsZW0uDQoNClRoaXMg
aXMgZXhhY3RseSB3aHkgSSBhc2tlZCB5b3UgdG8gcmV2aWV3IHRoZSBwYWdlIHdyaXRlIHJlY29y
ZGluZyBzZXJpZXMgb2YgYWRtaW4gY29tbWFuZHMgYW5kIGNvbW1lbnQuDQpBbmQgeW91IG5ldmVy
IGNvbW1lbnRlZCB3aXRoIHNoZWVyIGlnbm9yYW5jZS4NCg0KU28gY2xlYXJseSB0aGUgc3RhcnQg
c3RvcCBtZXRob2QgZm9yIHNwZWNpZmljIHJhbmdlIGFuZCB3aXRob3V0IGJhbmR3aWR0aCBleHBs
b3Npb24sIGFkbWluIGNvbW1hbmRzIG9mIFsxXSBzdGFuZHMgYmV0dGVyLg0KDQpJZiB5b3UgZG8g
WzFdIG9uIHRoZSBtZW1iZXIgZGV2aWNlIGFsc28gdXNpbmcgaXRzIEFRIGluIGZ1dHVyZSwgaXQg
d2lsbCB3b3JrIGZvciBub24tcGFzc3Rocm91Z2ggY2FzZS4NCklmIHlvdSBidWlsZCBub24tcGFz
c3Rocm91Z2ggbGl2ZSBtaWdyYXRpb24gdXNpbmcgWzFdLCBhbHNvIGl0IHdpbGwgd29yay4NClNv
IEkgZG9u4oCZdCBzZWUgYW55IHBvaW50IG9mIHRoaXMgc2VyaWVzIGFueW1vcmUuDQoNClsxXSBo
dHRwczovL2xpc3RzLm9hc2lzLW9wZW4ub3JnL2FyY2hpdmVzL3ZpcnRpby1jb21tZW50LzIwMjMx
MC9tc2cwMDQ3NS5odG1sDQoNCj4gPiArb3B0aW9uYWxseSB0aGUgZGV2aWNlIGlzIHBlcm1pdHRl
ZCB0byBzZXQgdGhlIGVudGlyZSBieXRlLCB3aGljaCBlbmNvbXBhc3Nlcw0KPiB0aGUgcmVsZXZh
bnQgYml0LCB0byAxLg0KPiA+ICsNCj4gPiArVGhlIGRldmljZSBNQVkgaW5jcmVhc2UgXGZpZWxk
e2dyYV9wb3dlcn0gdG8gcmVkdWNlIFxmaWVsZHtiaXRtYXBfbGVuZ3RofS4NCj4gPiArDQo+ID4g
K1RoZSBkZXZpY2UgbXVzdCBpZ25vcmUgYW55IHdyaXRlcyB0byBcZmllbGR7cGFzaWR9IGlmIFBB
U0lEIEV4dGVuZGVkDQo+ID4gK0NhcGFiaWxpdHkgaXMgYWJzZW50IG9yIHRoZSBQQVNJRCBmdW5j
dGlvbmFsaXR5IGlzIGRpc2FibGVkIGluIFBBU0lEDQo+ID4gK0V4dGVuZGVkIENhcGFiaWxpdHkN
Cj4gDQo+IA0KPiBJIGhhdmUgdG8gc2F5IHRoaXMgaXMgZ29pbmcgdG8gd29yayB2ZXJ5IGJhZGx5
IHdoZW4gdGhlIG51bWJlciBvZiBkaXJ0eSBwYWdlcyBpcw0KPiBzbWFsbDogeW91IHdpbGwgZW5k
IHVwIHNjYW5uaW5nIGFuZCByZS1zY2FubmluZyBhbGwgb2YgYml0bWFwLg0KPiBBbmQgdGhlIHJl
c29sdXRpb24gaXMgYXBwYXJlbnRseSA4IHBhZ2VzPyBZb3UgaGF2ZSBqdXN0IG11bHRpcGxpZWQg
dGhlIG1pZ3JhdGlvbg0KPiBiYW5kd2lkdGggYnkgYSBmYWN0b3Igb2YgOC4NCg0KWWVhaC4NCkFu
ZCBkZXZpY2UgZG9lcyBub3QgZXZlbiBrbm93IHByZXZpb3VzbHkgcmVwb3J0ZWQgcGFnZXMgYXJl
IHJlYWQgYnkgZHJpdmVyIG9yIG5vdC4gQWxsIGd1ZXNzIHdvcmsgZ2FtZSBmb3IgZHJpdmVyIGFu
ZCBkZXZpY2UuDQo=

