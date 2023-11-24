Return-Path: <virtio-comment-return-8619-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B08C61DF4
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 12:13:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1E41D2A89D
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 12:13:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E3A809868B1
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 12:13:10 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id CE7D59862D9; Fri, 24 Nov 2023 12:13:10 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BF9C59868A5
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 Nov 2023 12:13:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bscn1PHx2Vyti0kzsiHIgcfd7n6RThh4acBynN1KMwVNyHwLI03RFSfrGBhp8ISluQBt8ZtIxEF+OTba1woED7ay9WhcTB/Oub7IOVG08d7Lvgn+598lwz+XLZg21eyvVPn5QvPxTchR1ceS7k/d6zUeTdupzNDrvp6xFvGm96ys7uFcenv/2zddaaCmieaLkz+JKEuGpA46Uk2f+Biu7kA6XHKicU7RirtJP1a4JlrENNmW78iOOvD+biXZviGSPdWZ+Ta0ODmUBsDmHkjT9rHTs1ATlPtOiW4oki1GAX9NOOn4LuKjdIla7h9X0FB+BkVbgUCGXve86V/083+mJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mdkXOJ9/7yNGasIJtdf1gGYP/nJg4Z4LLBNVSoFmnA4=;
 b=B8sLpAkpxw0ma8PZKO3lto1fr6NUKgXINMtV0LMOx4jryRelRvSPEfSuYZ72D5C56qAIX4AOa5/TA4MAD6UKfp5+Z9PEhBpaU3CsP1+geVGdn7xHXMt0B0QD5B1rJ9r+WD8mYXNgmNatvll3eBivxRKYSphSqFxfcL18ZKqQIX8io9Z+ciWQ2BdQBMe9zt605L5JJx/2JhG8rmerKgC/TKcd0q/x6kucWuPCi92wdKP4e0kDvLaKzhUzhUDD3P/FJJdYQ5TYwbaYtBNk/+UIvEN8lNvV801AAiYLJU1JHMLETllY2uMeqnvQp/SN3sRciBNT2/3yALkoLXZ186IrQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
CC: "Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com"
	<sburla@marvell.com>, Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb
	<maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Thread-Topic: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration
Thread-Index:
 AQHZ+dpD+jj/KUeLHUaMn2y+w39Cb7BBJzcAgAA1HlCAAEi6gIAAERjwgAEF2ACAAAjm4IABoeMAgAAIQWCAAYjxAIAAAHqAgAD5sYCAAEjPkIAGCquAgAAYNlCAAWk/gIAAN7kQgAF48YCAABlCkIAACTkAgAALvzCABizrAIAAD2aggAGUBACAAABcUIABWsEAgABcQLCAASo6AIAALsiAgAZSfICAAAYzAIABYc4AgAA+ffCAAULTgIAALVPAgAGlyQCAABp/kIAGUuiAgAAFiECAAWL9AIADJo4QgAY+aoCAA+XikIAC0e+AgAABs1CAAA/MAIAAAIgggAAIigCAAADl0IAF3rSAgAClrCCAANotAIAAAFTwgAMQfoCAAI6OAIAAA6EAgAAFYACAAABpAA==
Date: Fri, 24 Nov 2023 12:13:07 +0000
Message-ID:
 <PH0PR12MB548162F9198208DE4569F032DCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <PH0PR12MB5481AB5ECF613D806C338C54DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117063406-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481089119BAB97C8F4B7CE0DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsQorfXDUAv-oesSAVM4A4AdaGuutJ0-5uqGTe1f0kXQw@mail.gmail.com>
 <PH0PR12MB548197D801989844FAA702B5DCBBA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEuCMYYDss=Wmk=03Wpr3Gg2+Cy0tCf-X8r+N1PcjYayVg@mail.gmail.com>
 <PH0PR12MB5481C748270CCD8255ED869EDCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsYoC7wd70gNu1OXRh7nHGyyaTDm7-GQehJp6QOY8DmFQ@mail.gmail.com>
 <20231124063537-mutt-send-email-mst@kernel.org>
 <CACGkMEsc1879eONsvmOQhpRE0BZ1jRcrd1t-hKrTBLNmPbsDjg@mail.gmail.com>
 <20231124070519-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231124070519-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CY8PR12MB7413:EE_
x-ms-office365-filtering-correlation-id: f08247df-7463-4da1-e57e-08dbece6b7cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 eKOP8BtCoSuy1n5AE+4HUxAPnDomfq9W858ASCE1NSvKI/rft5eWwy5erKfnAN0gYKnbx0IEPHQHrSj0k/Tqhok9j0hUS3TByEMnIrLMo7yPLxa7xc/DvmVzviHLwLh2bouvwxVoDnwIBjDnb4Uwq0gg/tlCJoNn9SvILtwFTLLYDn5Ad3ttoX1sYDDh1mSwlyVV1m9VCwMHDdvRwqawzqjS8UUqatXHGtBMhwqRBc1EJGCtUGsAxHJyZ0kDW5LP4NGahtXX9Ck5YNwB6YHdaX78R2DIYF8V3XC9dWIoiyfU/mrFQvjHi4KhaU3jgwJse1tZcwzrWda/mPIwdgxu/sWKD7S880JF2pkBpl5sSchQcNoSoXC64SOryxiGtfXeW3+V0AI7qAOwALn3MzR+/dPoJbnXlQ4HmLZTUb5ppG2I0dUsvG3uwMO4aPRoBvSVbLqAa/u9gV5NxvkXQuirL24kgm2v+GFSl9th6Wbz7o8Z/G/kwcu6+3PQ4x2M20kiG2EjJbBPj1Mlgjf3fXFDTkI8YcY/Atdu++bI4puAGkxnXHMiCH4Ity0uNqa+FiyfP7TniX7mK61zw1oilrBoQ10tspHvTO1+LQDFlVOJ5wYeF8vZoRhPu2oyqpf3HPYt
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(366004)(346002)(396003)(136003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(478600001)(9686003)(55016003)(71200400001)(107886003)(7696005)(6506007)(53546011)(76116006)(54906003)(26005)(66446008)(316002)(110136005)(66556008)(64756008)(66476007)(66946007)(86362001)(2906002)(33656002)(41300700001)(122000001)(5660300002)(38070700009)(38100700002)(52536014)(8936002)(8676002)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bks4dlVNTitiMGFodG9XNUlBOERwcWZ2c3B4N3ozUGwvWDNaWGk3bUNBWmwv?=
 =?utf-8?B?UFVBR3oraHJjM3EvVG5oUDNPZnJ0OHlMcU03MXBqUm5Sblg4UURFZDFkYkt6?=
 =?utf-8?B?OWhSVEwycmM2WmZpWUwwZmhBcGlobTVyMzBMMHZxK1k4UVh2NFFOcGlvNnRB?=
 =?utf-8?B?cjJWcnkzdUx6ZGN2VFVneERjNU1qellKMEJGWUEyNUxKMWVqL0hVVWtwSmdS?=
 =?utf-8?B?N0U3SThoSllPZjBLSkhDeG5ITzVZRVlOanFsc3lnZUdZSy9lUnNWdlhGcTdD?=
 =?utf-8?B?cHo3bVlXbWJIRlhWcEptN1NXdHEycjkxTzdTTzFPWTBPWDYzNGI5NkdnL2tm?=
 =?utf-8?B?UXpFY0xzbXA0VHA4NGNndFdNN0tYZndMSkgrWE13S1EybEJZUUhYbi8zaVJr?=
 =?utf-8?B?VEhiUFBKYXJWc25DckRxYUxuT3ZxckFyMWJHZXJBZWhhdFVlZEFrL2RVUFRn?=
 =?utf-8?B?bXhKQXR6MjFtb1F1V1RETG9kK3lwR2Z2aG1RK3NRUGtlVUszQXJXRXlNUlJV?=
 =?utf-8?B?bDZoOG9zTXB1WGxLWGdFcVptcFptNUQ0SUVnNWhSRFdDMWY0eDVmRGRmTGhO?=
 =?utf-8?B?S25kOHBQbXJYc3JBcjFxay9zYlNRS2lXZ2wxNk1XWW1RUEtZcXdMVkVEN3Jq?=
 =?utf-8?B?Qzk5NzdDYk50SFVqUTZkRE9sS3hHamFLT0dWWkFmY0F1UVJYYkErVHpvSGMy?=
 =?utf-8?B?cUl1UWE0MTYrMUVITkVkM01haTg5MWhhRi9hQzViLy8yOUlnUFJhaXQ4NUJ3?=
 =?utf-8?B?U1ZWTVFPYVVqd0t6N3g4Rk5LL21IN1BpeWdKWTVLWW1rL1lUM2wvTTl1bTN6?=
 =?utf-8?B?V3RYOVRrVkZHRmg5RjNWL3paNDVsdnA0cGVKblZRcWlBNk53Y01iY01uemRi?=
 =?utf-8?B?Ui9xd2V6UU15UERqZDJGa2NvYStZV0Vob0ZqMFR2RUN2bWtCbm1CNmVUTnNT?=
 =?utf-8?B?RkJ2RGg1RFlKYnQ3bklMTXBkQURjZnZ2Z1M0NVpwZkNrMU5vb2d1WGh5T2Np?=
 =?utf-8?B?bXkxandhRzcydGg1SFp2YVY5cjJHbDFtZXpMN3JaaWpCWm5QTWllL0htem1o?=
 =?utf-8?B?VEdpNndUNExibk84NXhheEdTcnpBRHJZMmpsRE5tcEJKM2N0RW95d2Evc2J5?=
 =?utf-8?B?L2p5eFJOUUhwQWpmd29CS3V6djZZZmdrRWhHT05pNm9RZGNrb29LNXZMQ3hH?=
 =?utf-8?B?cCtreVZRVDNrZ3dzQ3RKd2VZWitwSWFOSHYwUWczdHozREZXVlFua1hVbnpG?=
 =?utf-8?B?RjhlVnpkL2VRUHFqUk5JUHZ5V3RkS05pR3dZKzNlSXdjQitTaDNPTXE4Qk4v?=
 =?utf-8?B?TEJUWTZSRjhra1R2UWx1TGVKV01pVVBwUFdRaFcyK1lOQmtLOTh5aXNjWmMy?=
 =?utf-8?B?NWZLdGtzbytjdndySGtVWjd6VmJVbTNaVjRxNHhuRklpTGVkU2p1cE5BOUl3?=
 =?utf-8?B?K25lRW9VR1Zsbk1lZ1ZRZUIwOGhHNTBRNzZyMFFZU2NkR2U2L3VWNE84T05U?=
 =?utf-8?B?akxCNUQ1OVgvNU05cFZieVRndFdxSzJvL2tzdFFsN2VuWEd2ZGlGQTY5Nko0?=
 =?utf-8?B?T2czUWhLT3pIQTVlbkFwQzRHWGhYdVdnbk41amFjUFhUalMzME9PekVxUTM2?=
 =?utf-8?B?MXlKTGFMV2h6THdMTXNnUGFXd01mYitrQXJZaWhRUVBjZXZrN2MrRXJWOC82?=
 =?utf-8?B?V3pyVURGKzRBVS95VzhDR1J2NzF5czV4QWpsbzRFQ1RENlppOWhiNjZoZnlC?=
 =?utf-8?B?ZlJwUmU4QXZxNnByYlpiMGM4VFZZRGVZVUNOcG53WmtmSGZ2MS9kMzVkejJl?=
 =?utf-8?B?WmRwRlJCZmlvVXRaQ1plMSs2WDhDWHkwL0wvOFZuYmltWE96NnVlMnk3ZG1C?=
 =?utf-8?B?L3NobkZpTkdkN0VCZ2hvK1hSaTBtVGtSSVExVWFMTWQvNGp4aVpNbEJhdXJB?=
 =?utf-8?B?OHBvK29XeHdBeXFUeklxa25RdmhrZXppeFhvbHdUUnNvZ1owdWFLZW84dHdX?=
 =?utf-8?B?aDlmWStJa3BNNTJBalhra29hY0dQN3lxOFgvRmVMMnNYRjR2ZGFTK3ZCZy9H?=
 =?utf-8?B?TUVFbi9LdHc3Zzg1ODRJcC81VlJ5eFdhbzlwa1UzY2oxc2ZQMXZ2dXdrRkRv?=
 =?utf-8?Q?bKNM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f08247df-7463-4da1-e57e-08dbece6b7cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2023 12:13:07.3012
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zYMl5kEoZw306xXKy44PeR/WXleeGzekg3b0YLS6qnzTf5ROqOJBUPAxCt8JefWpdMs107IbiA+tR61/bn+OWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7413
Subject: RE: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

DQoNCj4gRnJvbTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4NCj4gU2VudDog
RnJpZGF5LCBOb3ZlbWJlciAyNCwgMjAyMyA1OjQwIFBNDQo+IA0KPiBPbiBGcmksIE5vdiAyNCwg
MjAyMyBhdCAwNzo1MTowNlBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOg0KPiA+IE9uIEZyaSwg
Tm92IDI0LCAyMDIzIGF0IDc6MzjigK9QTSBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQu
Y29tPg0KPiB3cm90ZToNCj4gPiA+DQo+ID4gPiBPbiBGcmksIE5vdiAyNCwgMjAyMyBhdCAxMTow
Nzo1M0FNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOg0KPiA+ID4gPiBIb3cgVERJU1AvYXR0ZXN0
YXRpb24gaXMgcmVsYXRlZCB0byBhIHNwZWNpZmljIGRldmljZSBkcml2ZXI/IEhvdw0KPiA+ID4g
PiBjYW4gYSBsZWdhY3kgRFBESyBkcml2ZXIgYnJlYWsgdGhpbmdzIGxpa2UgYXR0ZXN0YXRpb24g
aGVyZT8NCj4gPiA+ID4NCj4gPiA+ID4gPiBIZW5jZSBpdCBpcyBub3QgYXBwbGljYWJsZS4NCj4g
PiA+ID4NCj4gPiA+ID4gV293LiBUaGUgbGVnYWN5IHR1bm5lbCB3YXMganVzdCBpbnZlbnRlZCBi
eSB5b3UgZm9yIGp1c3Qgc2V2ZXJhbA0KPiA+ID4gPiBtb250aHMgYW5kIHNvb24gYmVjYW1lIGEg
c2Vjb25kLWNsYXNzIGNpdGl6ZW4gaW4gdGhlIHByb3Bvc2FsIGhlcmU/DQo+ID4gPg0KPiA+ID4g
TGVnYWN5IGlzIG5vdCBnb2luZyB0byBiZSBhIDFzdCBjbGFzcyBjaXRpemVuIGFuZCB0aGF0IHdh
cyBhDQo+ID4gPiBjb25jaW91cyBkZWNpc2lvbiB0aGUgVEMgbWFkZS4NCj4gPiA+IEluIHBhcnRp
Y3VsYXIgd2Uga25vdyBzdHJhaWdodA0KPiA+ID4gYXdheSB0aGF0IHRoZXJlIGlzIG5vIHdheSB0
byBtYWtlIHRoZW0gc2FmZWx5IHdvcmsgd2hpbGUgcHJlc2VydmluZw0KPiA+ID4gYXNzdW1wdGlv
bnMgY29uZmlkZW50aWFsIGNvbXB1dGluZyBndWVzdHMgbWFrZSAod2hpY2ggSSBndWVzcyBpcw0K
PiA+ID4gd2hhdCB5b3UgbWVhbiBoZXJlKS4NCj4gPg0KPiA+IFByb2JhYmx5LCBidXQgSSB0aGlu
ayB3ZSBuZWVkIHRvIHN1cHBvcnQgaXRzIG1pZ3JhdGlvbiB3aXRob3V0IFRELg0KPiANCj4gQWgs
IG1pZ3JhdGlvbiBvZiBsZWdhY3kgZ3Vlc3RzIGlzIGFuIGludGVyZXN0aW5nIHBvaW50Lg0KPiBC
cmluZ2luZyB1cCBURCB3YXMganVzdCBjb25mdXNpbmcuDQo+IA0KPiBJIGV4cGVjdCB0aGlzIHRv
IGJlIHJhdGhlciBwYWlubGVzcyB0byBhZGQgcHJlY2lzZWx5IGJlY2F1c2UgdGhpcyBwcm9wb3Nh
bCBkb2VzDQo+IG5vdCByZXBseSBvbiBlaXRoZXIgbW9kZXJuIG9yIGxlZ2FjeSBwY2kgbGF5b3V0
LiBCdXQgZGV0YWlscyBuZWVkIHRvIGJlDQo+IHRob3VnaHQgdGhyb3VnaCwgSSBhZ3JlZS4gSSBk
b24ndCBzZWUgd2h5IHRoaXMgaXMgbm90IGFwcGxpY2FibGUgLSBkZWZpbml0ZWx5DQo+IHBlb3Bs
ZSBhcmUgdXNlZCB0byBiZSBhYmxlIHRvIG1pZ3JhdGUgdGhlc2UgZ3Vlc3RzLg0KPg0KVGhlIGN1
cnJlbnQgbGF5b3V0IGluIGRldmljZSBjb250ZXh0IGlzIGZvciB0aGUgbW9kZXJuLg0KVGhlIGxl
Z2FjeSBvbmUgd2lsbCBiZSBqdXN0IGFub3RoZXIgZW51bSBhbmQgc3RydWN0IHRoYXQgd2lsbCBi
ZSBhZGRlZCBzdWJzZXF1ZW50bHkuDQogDQo+IA0KPiA+ID4gVGhlIHdob2xlIHBvaW50IG9mIGlz
b2xhdGluZyBsZWdhY3kgbWVzcyBpbiB0aGUgc3BlY2lhbCBjb21tYW5kcyB3YXMNCj4gPiA+IHNv
IHdlIGRvbid0IHRyeSB0byBzdXBwb3J0IHRoZW0gZ29pbmcgZm9yd2FyZCwgZG9uJ3QgdHJ5IHRv
IGFkZCBuZXcNCj4gPiA+IGZlYXR1cmVzIGZvciBsZWdhY3kgaW50ZXJmYWNlcyBwbGVhc2UuDQo+
ID4NCj4gPiBUaGFua3MNCj4gPg0KPiA+DQo+ID4gPg0KPiA+ID4gLS0NCj4gPiA+IE1TVA0KPiA+
ID4NCg0K

